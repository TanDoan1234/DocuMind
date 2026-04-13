# Các nhà cung cấp tương thích OpenAI

Sử dụng bất kỳ máy chủ nào thực hiện định dạng API của OpenAI với DocuMind. Điều này bao gồm LM Studio, vLLM, Text Generation WebUI và nhiều công cụ khác.

---

## Chuẩn tương thích OpenAI là gì?

Nhiều công cụ AI sử dụng chung định dạng API với OpenAI:
- `POST /v1/chat/completions` (Chat)
- `POST /v1/embeddings` (Tìm kiếm tài liệu)
- `POST /v1/audio/speech` (Tạo giọng nói)

DocuMind có thể kết nối với bất kỳ máy chủ nào sử dụng định dạng này.

---

## Các máy chủ phổ biến

| Máy chủ | Mục đích |
|--------|----------|
| **LM Studio** | Giao diện đồ họa dễ dùng cho mô hình local |
| **Text Generation WebUI** | Công cụ chạy AI local đầy đủ tính năng nhất |
| **vLLM** | Máy chủ AI hiệu suất cao cho doanh nghiệp |
| **Speaches** | Chuyên về Chuyển giọng nói (TTS) và Nhận dạng giọng nói (STT) |

---

## Thiết lập nhanh với LM Studio

### Bước 1: Khởi động LM Studio
1. Mở LM Studio và tải xuống một mô hình (ví dụ: Llama 3).
2. Chuyển sang tab **Local Server**.
3. Nhấn **Start Server** (mặc định cổng là 1234).

### Bước 2: Cấu hình trong DocuMind
1. Vào **Settings** → **API Keys**.
2. Nhấn **Add Credential** → Chọn **OpenAI-Compatible**.
3. Nhập URL cơ sở (Base URL):
   - Nếu chạy trong Docker: `http://host.docker.internal:1234/v1`
   - Nếu chạy trực tiếp: `http://localhost:1234/v1`
4. API key: Nhập bất kỳ chuỗi nào (ví dụ: `lm-studio`) vì LM Studio không yêu cầu khóa thật.
5. Nhấn **Save** và **Test Connection**.

### Bước 3: Đăng ký mô hình
1. Vào **Settings** → **Models**.
2. Nhấn **Add Model**. Nhập chính xác tên mô hình hiển thị trong LM Studio.
3. Chọn Provider là `openai_compatible`.

---

## Lưu ý về Mạng trong Docker

Khi DocuMind chạy trong Docker và máy chủ AI chạy trên máy của bạn (Host):
- **macOS / Windows**: Sử dụng URL `http://host.docker.internal:PORT/v1`.
- **Linux**: Sử dụng địa chỉ IP của Docker bridge (thường là `http://172.17.0.1:PORT/v1`) hoặc chạy Docker với chế độ `--network host`.

---

## Xử lý sự cố

- **Lỗi kết nối**: Kiểm tra xem máy chủ AI đã bật chưa và cổng (Port) có chính xác không. Thử truy cập URL API trên trình duyệt để kiểm tra.
- **Model not found**: Đảm bảo tên mô hình bạn nhập trong DocuMind khớp hoàn toàn với tên mô hình đang được "load" trên máy chủ AI.
- **Phản hồi chậm**: Hãy thử các mô hình đã được nén (Quantized - Q4_K_M) hoặc giảm độ dài ngữ cảnh trong phần cài đặt mô hình.

Việc hỗ trợ chuẩn OpenAI giúp **DocuMind** trở nên vô cùng linh hoạt, cho phép bạn tự xây dựng hệ sinh thái AI của riêng mình một cách chuyên nghiệp.
