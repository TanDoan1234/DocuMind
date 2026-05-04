from transformers import AutoTokenizer, AutoModelForSeq2SeqLM
from peft import PeftModel, PeftConfig
import torch
import os

# Đường dẫn đến model ViT5 đã finetune
model_path = os.path.join(os.path.dirname(__file__), "..", "ai/results/models/vit5_summarization/best_model")

print(f"Đang tải mô hình từ: {model_path}...")

# Load cấu hình và mô hình (ViT5 dùng LoRA)
config = PeftConfig.from_pretrained(model_path)
base_model = AutoModelForSeq2SeqLM.from_pretrained(config.base_model_name_or_path)
model = PeftModel.from_pretrained(base_model, model_path)
tokenizer = AutoTokenizer.from_pretrained(config.base_model_name_or_path)

# Văn bản cần tóm tắt
text = """
Việt Nam là một quốc gia nằm ở phía Đông bán đảo Đông Dương, thuộc khu vực Đông Nam Á. Với đường bờ biển dài hơn 3.260 km và địa hình đa dạng, Việt Nam có tiềm năng lớn về phát triển kinh tế biển và du lịch. Trong những năm gần đây, Việt Nam đã đạt được nhiều thành tựu quan trọng trong việc cải cách kinh tế, thu hút vốn đầu tư nước ngoài và nâng cao đời sống người dân. Các thành phố lớn như Hà Nội và TP. Hồ Chí Minh đang trở thành những trung tâm kinh tế, văn hóa và công nghệ năng động của khu vực. Chính phủ cũng đang đẩy mạnh quá trình chuyển đổi số nhằm xây dựng chính phủ điện tử và nền kinh tế số bền vững.
"""

# Tokenize và tạo kết quả
inputs = tokenizer(text, return_tensors="pt", max_length=512, truncation=True)
outputs = model.generate(
    input_ids=inputs["input_ids"],
    max_length=150,
    num_beams=4,
    no_repeat_ngram_size=3,
    repetition_penalty=2.0,
    early_stopping=True
)

summary = tokenizer.decode(outputs[0], skip_special_tokens=True)
print("\n" + "="*50)
print("KẾT QUẢ TÓM TẮT (ViT5):")
print("="*50)
print(summary)
print("="*50)
