from docling.document_converter import DocumentConverter, PdfFormatOption
from docling.datamodel.base_models import InputFormat
from docling.datamodel.pipeline_options import PdfPipelineOptions
from langchain_text_splitters import RecursiveCharacterTextSplitter
from typing import List, Dict, Any
import os
import logging

from backend.processor.embedding_service import EmbeddingService

logger = logging.getLogger(__name__)

class DocumentProcessor:
    def __init__(self, chunk_size: int = 1000, chunk_overlap: int = 100, do_ocr: bool = False):
        # 1. Cấu hình Pipeline cho PDF
        pipeline_options = PdfPipelineOptions()
        pipeline_options.do_ocr = do_ocr
        
        format_options = {
            InputFormat.PDF: PdfFormatOption(pipeline_options=pipeline_options)
        }
        
        # 2. Khởi tạo bộ chuyển đổi của Docling
        self.converter = DocumentConverter(
            format_options=format_options
        )
        
        # 3. Khởi tạo bộ cắt văn bản
        self.text_splitter = RecursiveCharacterTextSplitter(
            chunk_size=chunk_size,
            chunk_overlap=chunk_overlap,
            separators=["\n\n", "\n", " ", ""]
        )

        # 4. Khởi tạo Embedding Service (Singleton)
        self.embedding_service = EmbeddingService()

    def process_document(self, file_path: str) -> List[Dict[str, Any]]:
        """
        Quy trình xử lý hoàn chỉnh:
        1. Docling: PDF -> Markdown
        2. TextSplitter: Markdown -> Chunks
        3. EmbeddingService: Chunks -> Vectors
        """
        if not os.path.exists(file_path):
            raise FileNotFoundError(f"Không tìm thấy file: {file_path}")

        logger.info(f"Đang xử lý tài liệu: {os.path.basename(file_path)}")

        # Bước 1: Trích xuất nội dung bằng Docling
        result = self.converter.convert(file_path)
        markdown_content = result.document.export_to_markdown()
        
        # Bước 2: Cắt nhỏ nội dung
        chunks_text = self.text_splitter.split_text(markdown_content)
        
        # Bước 3: Tạo Embedding cho toàn bộ chunks
        # Chúng ta tạo đồng loạt (batch) để tối ưu hiệu năng
        embeddings = self.embedding_service.embed_chunks(chunks_text)
        
        processed_chunks = []
        for i, (text, vector) in enumerate(zip(chunks_text, embeddings)):
            processed_chunks.append({
                "content": text,
                "embedding": vector,
                "metadata": {
                    "source": os.path.basename(file_path),
                    "chunk_index": i,
                    "format": "markdown",
                    "embedding_model": "keepitreal/vietnamese-sbert"
                }
            })
            
        logger.info(f"Đã xử lý xong {len(processed_chunks)} mảnh kèm vector.")
        return processed_chunks

# Demo nhanh cách dùng
if __name__ == "__main__":
    processor = DocumentProcessor(do_ocr=False)
    print("DocumentProcessor integrated with EmbeddingService successfully.")
