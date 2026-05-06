from docling.document_converter import DocumentConverter, PdfFormatOption
from docling.datamodel.base_models import InputFormat
from docling.datamodel.pipeline_options import PdfPipelineOptions
from langchain_text_splitters import RecursiveCharacterTextSplitter
from typing import List, Dict, Any
import os

class DocumentProcessor:
    def __init__(self, chunk_size: int = 1000, chunk_overlap: int = 100, do_ocr: bool = False):
        # 1. Cấu hình Pipeline cho PDF
        pipeline_options = PdfPipelineOptions()
        pipeline_options.do_ocr = do_ocr  # Tắt OCR để tăng tốc độ
        
        # 2. Thiết lập Format Options (Chỉ định rõ cấu hình cho file PDF)
        format_options = {
            InputFormat.PDF: PdfFormatOption(pipeline_options=pipeline_options)
        }
        
        # 3. Khởi tạo bộ chuyển đổi với format_options
        self.converter = DocumentConverter(
            format_options=format_options
        )
        
        # 4. Khởi tạo bộ cắt văn bản
        self.text_splitter = RecursiveCharacterTextSplitter(
            chunk_size=chunk_size,
            chunk_overlap=chunk_overlap,
            separators=["\n\n", "\n", " ", ""]
        )

    def process_document(self, file_path: str) -> List[Dict[str, Any]]:
        """
        Quy trình xử lý bằng Docling:
        1. Chuyển đổi tài liệu sang định dạng Markdown.
        2. Cắt nhỏ (Chunking) văn bản Markdown.
        """
        if not os.path.exists(file_path):
            raise FileNotFoundError(f"Không tìm thấy file: {file_path}")

        # Bước 1: Convert tài liệu
        result = self.converter.convert(file_path)
        
        # Bước 2: Xuất ra Markdown
        markdown_content = result.document.export_to_markdown()
        
        # Bước 3: Cắt nhỏ nội dung Markdown
        chunks_text = self.text_splitter.split_text(markdown_content)
        
        processed_chunks = []
        for i, chunk in enumerate(chunks_text):
            processed_chunks.append({
                "content": chunk,
                "metadata": {
                    "source": os.path.basename(file_path),
                    "chunk_index": i,
                    "format": "markdown"
                }
            })
            
        return processed_chunks

# Demo nhanh cách dùng
if __name__ == "__main__":
    processor = DocumentProcessor(do_ocr=False)
    print("Docling Processor initialized successfully (Corrected Config).")
