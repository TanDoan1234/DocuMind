# Cẩm nang cấu hình Nhà cung cấp AI

Hướng dẫn thiết lập chi tiết cho từng nhà cung cấp AI thông qua giao diện **Settings**.

---

## Cơ chế hoạt động

Kể từ phiên bản v1.2, DocuMind quản lý các nhà cung cấp AI thông qua **hệ thống Credential**:

1. **Lấy API Key** từ trang web của nhà cung cấp.
2. **Mở Settings** → **API Keys** → **Add Credential**.
3. **Kiểm tra kết nối (Test)** để đảm bảo khóa hoạt động.
4. **Khám phá & Đăng ký (Discover & Register)** các mô hình muốn dùng.
5. **Bắt đầu sử dụng** trong các Notebook của bạn.

---

## Các nhà cung cấp Đám mây (Cloud)

### 1. OpenAI (Khuyên dùng)
- **Ưu điểm**: Phổ biến nhất, đa năng, hỗ trợ đầy đủ các tính năng (Chat, Tìm kiếm, Podcast).
- **Mô hình**: `gpt-4o` (mạnh nhất), `gpt-4o-mini` (rẻ và nhanh).
- **Cách lấy khóa**: [platform.openai.com](https://platform.openai.com/)

### 2. Google Gemini
- **Ưu điểm**: Cực kỳ mạnh mẽ với tài liệu dài (Context lên tới 2M tokens), đa phương thức (hình ảnh, video).
- **Mô hình**: `gemini-2.0-flash` (nhanh, rẻ), `gemini-1.5-pro` (thông minh nhất).
- **Cách lấy khóa**: [aistudio.google.com](https://aistudio.google.com/)

### 3. Anthropic (Claude)
- **Ưu điểm**: Khả năng suy luận và viết lách xuất sắc, xử lý ngữ cảnh dài rất tốt.
- **Mô hình**: `claude-3-5-sonnet` (cân bằng nhất), `claude-3-5-haiku` (nhanh nhất).
- **Cách lấy khóa**: [console.anthropic.com](https://console.anthropic.com/)

### 4. Groq (Siêu tốc độ)
- **Ưu điểm**: Tốc độ phản hồi cực nhanh (gần như tức thì), chi phí rất rẻ.
- **Mô hình**: `llama-3.3-70b` (mạnh mẽ), `mixtral-8x7b`.

---

## Giải pháp chạy Cục bộ (Local - Miễn phí & Riêng tư)

### 1. Ollama (Tốt nhất cho máy cá nhân)
- **Ưu điểm**: Hoàn toàn miễn phí, dữ liệu nằm trên máy bạn, không cần internet.
- **Thiết lập**: Cài đặt Ollama tại [ollama.ai](https://ollama.ai/), sau đó kết nối với DocuMind qua URL `http://host.docker.internal:11434`.

---

## Lựa chọn nhà cung cấp nào?

1. **Nếu bạn muốn đơn giản & mạnh mẽ**: Chọn **OpenAI** (gpt-4o).
2. **Nếu bạn cần nghiên cứu tài liệu cực dài**: Chọn **Google Gemini** (1.5 Pro).
3. **Nếu bạn ưu tiên quyền riêng tư & miễn phí**: Chọn **Ollama** (Llama 3 hoặc Qwen 3).
4. **Nếu bạn cần tốc độ phản hồi nhanh**: Chọn **Groq**.

---

## Lưu ý quan trọng
- Bạn cần thiết lập `OPEN_NOTEBOOK_ENCRYPTION_KEY` trong tệp cấu hình Docker trước khi lưu bất kỳ API Key nào.
- Luôn sử dụng nút **Test Connection** sau khi nhập API Key để đảm bảo không có lỗi sai sót.
- Bạn có thể thêm **nhiều nhà cung cấp cùng lúc** và thay đổi linh hoạt trong quá trình nghiên cứu.

DocuMind linh hoạt cho phép bạn kết hợp "nhiều bộ não" AI khác nhau để phục vụ mục tiêu nghiên cứu của mình.
