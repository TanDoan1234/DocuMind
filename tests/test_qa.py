from transformers import AutoTokenizer, AutoModelForQuestionAnswering, pipeline
import torch
import os

# Đường dẫn đến model XLM-RoBERTa đã finetune
model_path = os.path.join(os.path.dirname(__file__), "..", "ai/results/models/xlmroberta_qa/best_model")

print(f"Đang tải mô hình từ: {model_path}...")

# Load model và tokenizer
model = AutoModelForQuestionAnswering.from_pretrained(model_path)
tokenizer = AutoTokenizer.from_pretrained(model_path)

# Khởi tạo pipeline hỏi đáp
qa_pipeline = pipeline("question-answering", model=model, tokenizer=tokenizer)

# Dữ liệu mẫu
context = """
Trường Đại học Công nghiệp Thực phẩm TP.HCM (HUFI) đã chính thức đổi tên thành Trường Đại học Công Thương TP.HCM (HUIT) từ ngày 01/07/2023. 
Trường là một cơ sở giáo dục công lập đào tạo đa ngành, có thế mạnh trong lĩnh vực công nghệ thực phẩm và kỹ thuật. 
Trụ sở chính của trường đặt tại địa chỉ 140 Lê Trọng Tấn, Phường Tây Thạnh, Quận Tân Phú, TP. Hồ Chí Minh.
"""

question = "Trường HUIT đổi tên vào ngày nào?"

# Thực hiện hỏi đáp
result = qa_pipeline(question=question, context=context)

print("\n" + "="*50)
print("KẾT QUẢ HỎI ĐÁP (QA):")
print("="*50)
print(f"Câu hỏi: {question}")
print(f"Câu trả lời: {result['answer']}")
print(f"Độ tin cậy: {result['score']:.4f}")
print("="*50)
