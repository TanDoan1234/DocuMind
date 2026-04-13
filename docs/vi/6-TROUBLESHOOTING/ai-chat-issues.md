# Lỗi AI & Chat - Cấu hình & Chất lượng phản hồi

Giải quyết các vấn đề liên quan đến mô hình AI, phản hồi của Chat và chất lượng câu trả lời.

---

## Lỗi "Failed to send message" (Gửi tin nhắn thất bại)

**Triệu chứng**: Thông báo lỗi xuất hiện khi gửi tin nhắn. Log hệ thống báo: `Model is not a LanguageModel: None`.

**Nguyên nhân**: Chưa cấu hình mô hình ngôn ngữ (LLM) mặc định cho Chat.

**Giải pháp**:
1. Vào **Settings** → **Models**.
2. Cuộn xuống phần **Default Models**.
3. Tại ô **Default Chat Model**, chọn một mô hình có sẵn (ví dụ: gpt-4o, gemini-1.5-flash hoặc mô hình Local).
4. Nhấp **Save**.

---

## Mô hình không hiển thị (Models not showing)

**Nguyên nhân**: Chưa thêm thông tin tài khoản (Credential) hoặc khóa API bị sai.

**Giải pháp**:
1. Vào **Settings** → **API Keys**.
2. Nhấp **Add Credential** và thêm khóa API của bạn (OpenAI, Google, v.v.).
3. Nhấp **Test Connection** để đảm bảo khóa hoạt động.
4. Nhấp **Discover Models** → **Register Models** để hệ thống nhận diện các mô hình khả dụng.

---

## AI trả lời hời hợt hoặc sai lệch

**Giải pháp**:
1. **Kiểm tra Ngữ cảnh (Context)**: Đảm bảo bạn đã chọn đúng nguồn tài liệu cần thiết trong bảng Chat. Nên chuyển sang chế độ **Full Content** thay vì **Summary Only**.
2. **Cải thiện câu hỏi**: Đưa ra yêu cầu cụ thể hơn. Thay vì hỏi "Nó nói gì?", hãy hỏi "Dựa trên phương pháp nghiên cứu, hãy liệt kê 3 điểm hạn chế của tài liệu này."
3. **Sử dụng mô hình mạnh hơn**: Nếu đang dùng `gpt-4o-mini`, hãy thử chuyển sang `gpt-4o` để có câu trả lời sâu sắc hơn.

---

## Chat quá chậm

**Nguyên nhân**: Ngữ cảnh quá lớn, mô hình phản hồi chậm hoặc API đang quá tải.

**Giải pháp**:
1. **Giảm bớt nguồn tài liệu**: Chỉ chọn những tài liệu thực sự cần thiết cho câu hỏi hiện tại.
2. **Sử dụng mô hình nhanh**: Các mô hình như `gpt-4o-mini` hoặc `Gemini Flash` có tốc độ phản hồi nhanh hơn nhiều so với các phiên bản "Pro" hay "Sonnet".
3. **Tăng thời gian chờ (Timeout)**: Nếu tài liệu cực lớn, hãy tăng `API_CLIENT_TIMEOUT` trong tệp `.env`.

---

## Hiện tượng AI "bịa đặt" thông tin (Hallucinations)

**Giải pháp**:
1. **Yêu cầu trích dẫn**: Luôn thêm câu "Hãy trích dẫn số trang cụ thể" vào câu hỏi. AI sẽ cẩn thận hơn khi phải đưa ra bằng chứng.
2. **Kiểm tra trích dẫn**: Nhấp vào các số [1], [2] trong câu trả lời để đối chiếu trực tiếp với văn bản gốc.
3. **Giới hạn phạm vi**: Nhắc AI "Chỉ trả lời dựa trên tài liệu tôi cung cấp, nếu không có hãy nói không biết".

---

## Tối ưu hóa chi phí API

Nếu hóa đơn API cao hơn dự kiến:
1. Sử dụng các mô hình tiết kiệm như **gpt-4o-mini** (rẻ hơn 10 lần so với bản gpt-4o).
2. Chuyển sang sử dụng **Ollama** hoặc các **Mô hình Local Tiếng Việt** (ViT5/PhoBERT) để chạy hoàn toàn miễn phí trên máy cá nhân.

Nếu vẫn gặp sự cố, hãy xem thêm phần [Sửa lỗi nhanh](quick-fixes.md) hoặc kiểm tra log Docker của API.
