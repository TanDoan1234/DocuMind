from transformers import AutoTokenizer, AutoModelForSeq2SeqLM
from peft import PeftModel, PeftConfig
import torch
import os

# Đường dẫn đến model đã finetune (sử dụng path tuyệt đối hoặc lùi 1 cấp thư mục)
model_path = os.path.join(os.path.dirname(__file__), "..", "ai/results/models/bartpho_summarization/best_model")

# Load cấu hình và mô hình
config = PeftConfig.from_pretrained(model_path)
base_model = AutoModelForSeq2SeqLM.from_pretrained(config.base_model_name_or_path)
model = PeftModel.from_pretrained(base_model, model_path)
tokenizer = AutoTokenizer.from_pretrained(config.base_model_name_or_path)

# Văn bản cần tóm tắt
text = """
Trí tuệ nhân tạo (AI) đang tạo ra một cuộc cách mạng sâu rộng trong mọi lĩnh vực của đời sống kinh tế - xã hội trên toàn cầu. Tại Việt Nam, xu hướng này không chỉ dừng lại ở các cuộc thảo luận học thuật mà đã bắt đầu len lỏi vào các hoạt động sản xuất, kinh doanh và dịch vụ công. Chính phủ Việt Nam cũng đã ban hành Chiến lược quốc gia về nghiên cứu, phát triển và ứng dụng Trí tuệ nhân tạo đến năm 2030, với mục tiêu đưa AI trở thành lĩnh vực công nghệ quan trọng, góp phần thúc đẩy tăng trưởng kinh tế bền vững.

Trong lĩnh vực giáo dục, nhiều nền tảng học tập thông minh đã được ra đời, giúp cá nhân hóa lộ trình học tập cho từng học sinh. Các hệ thống này sử dụng thuật toán học máy để phân tích điểm mạnh, điểm yếu của người học, từ đó đưa ra những gợi ý bài tập và tài liệu phù hợp nhất. Điều này không chỉ giúp nâng cao hiệu quả học tập mà còn giảm bớt áp lực cho giáo viên trong việc quản lý lớp học có trình độ không đồng đều.

Đối với ngành y tế, AI đang hỗ trợ các bác sĩ trong việc chẩn đoán bệnh chính xác và nhanh chóng hơn thông qua việc phân tích hình ảnh X-quang, MRI hay CT. Những hệ thống AI có khả năng phát hiện những dấu hiệu bất thường nhỏ nhất mà mắt thường có thể bỏ sót, từ đó giúp phát hiện sớm các bệnh nguy hiểm như ung thư. Ngoài ra, AI cũng giúp tối ưu hóa quy trình quản lý bệnh viện và dự báo nhu cầu về nguồn lực y tế trong các đợt dịch bệnh.

Trong sản xuất công nghiệp, các nhà máy thông minh đang ứng dụng robot và các hệ thống điều khiển tự động hóa tích hợp AI để tối ưu hóa dây chuyền sản xuất. Việc sử dụng AI giúp doanh nghiệp giảm thiểu sai sót do con người, tiết kiệm năng lượng và nguyên vật liệu, đồng thời tăng năng suất lao động một cách đáng kể. Tuy nhiên, việc ứng dụng AI cũng đặt ra những thách thức lớn về mặt nhân sự, đòi hỏi lực lượng lao động phải không ngừng nâng cao kỹ năng để thích ứng với môi trường làm việc mới.

Mặc dù có nhiều tiềm năng, nhưng việc phát triển AI tại Việt Nam vẫn đối mặt với không ít rào cản. Một trong những vấn đề lớn nhất là nguồn dữ liệu mở còn hạn chế và chất lượng dữ liệu chưa đồng nhất. Bên cạnh đó, tình trạng thiếu hụt nhân sự trình độ cao trong lĩnh vực AI cũng là một bài toán khó cần lời giải sớm. Để vượt qua những khó khăn này, sự phối hợp giữa chính phủ, doanh nghiệp và các tổ chức giáo dục là vô cùng cần thiết nhằm tạo ra một hệ sinh thái AI bền vững và phát triển mạnh mẽ trong tương lai.
"""

# Tokenize và tạo kết quả
inputs = tokenizer(text, return_tensors="pt", max_length=512, truncation=True)
outputs = model.generate(
    input_ids=inputs["input_ids"],
    max_length=250,
    min_length=50,
    num_beams=5,
    no_repeat_ngram_size=3,
    repetition_penalty=1.5,
    length_penalty=1.2,
    early_stopping=True
)

summary = tokenizer.decode(outputs[0], skip_special_tokens=True)
print("\n" + "="*50)
print("BẢN TÓM TẮT KẾT QUẢ:")
print("="*50)
print(summary)
print("="*50)
