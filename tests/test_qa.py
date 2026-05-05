from transformers import AutoTokenizer, AutoModelForQuestionAnswering
import torch
import os

# Đường dẫn đến model XLM-RoBERTa đã finetune
model_path = os.path.join(os.path.dirname(__file__), "..", "ai/results/models/xlmroberta_qa/best_model")

print(f"Đang tải mô hình từ: {model_path}...")

# Load model và tokenizer
model = AutoModelForQuestionAnswering.from_pretrained(model_path)
tokenizer = AutoTokenizer.from_pretrained(model_path)

# Dữ liệu mẫu
context = """
Trường Đại học Công nghiệp Thực phẩm TP.HCM (HUFI) đã chính thức đổi tên thành Trường Đại học Công Thương TP.HCM (HUIT) từ ngày 01/07/2023. 
Trường là một cơ sở giáo dục công lập đào tạo đa ngành, có thế mạnh trong lĩnh vực công nghệ thực phẩm và kỹ thuật. 
Trụ sở chính của trường đặt tại địa chỉ 140 Lê Trọng Tấn, Phường Tây Thạnh, Quận Tân Phú, TP. Hồ Chí Minh.
"""

question = "Trường HUIT đổi tên vào ngày nào?"

# Thực hiện hỏi đáp không dùng pipeline
print("\nĐang thực hiện truy vấn...")
inputs = tokenizer(question, context, return_tensors="pt", truncation=True, max_length=512)

with torch.no_grad():
    outputs = model(**inputs)

# Xác định vị trí các token thuộc về context (loại bỏ question và special tokens)
sequence_ids = inputs.sequence_ids()
context_start = 0
while sequence_ids[context_start] != 1: # 1 là index của sequence thứ 2 (context)
    context_start += 1
context_end = len(sequence_ids) - 1
while sequence_ids[context_end] != 1:
    context_end -= 1

# Chỉ lấy Logits trong phạm vi của context
start_logits = outputs.start_logits[0, context_start : context_end + 1]
end_logits = outputs.end_logits[0, context_start : context_end + 1]

# Tìm vị trí tốt nhất trong phạm vi context
answer_start = start_logits.argmax() + context_start
answer_end = end_logits.argmax() + context_start

# Giải mã kết quả
predict_answer_tokens = inputs.input_ids[0, answer_start : answer_end + 1]
answer = tokenizer.decode(predict_answer_tokens, skip_special_tokens=True)

# Nếu kết quả rỗng hoặc không hợp lý (do mô hình chưa tốt), hiển thị thông báo
if not answer.strip():
    answer = "Không tìm thấy câu trả lời trong văn bản."

print("\n" + "="*50)
print("KẾT QUẢ HỎI ĐÁP (QA) - ĐÃ LỌC:")
print("="*50)
print(f"Câu hỏi: {question}")
print(f"Câu trả lời: {answer.strip()}")
print("="*50)
