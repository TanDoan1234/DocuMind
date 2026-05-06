import sys
import os
from docling.document_converter import DocumentConverter

def debug_docling_output():
    sample_file = os.path.abspath("Bao_cao_dinh_huong_AI_Engineer.docx")
    converter = DocumentConverter()
    
    print(f"🔍 Đang phân tích raw markdown từ: {sample_file}")
    result = converter.convert(sample_file)
    md_content = result.document.export_to_markdown()
    
    print("\n--- NỘI DUNG MARKDOWN TRÍCH XUẤT ĐƯỢC ---")
    print(md_content[:2000]) # Xem 2000 ký tự đầu tiên
    print("\n--- KẾT THÚC ---")

if __name__ == "__main__":
    debug_docling_output()
