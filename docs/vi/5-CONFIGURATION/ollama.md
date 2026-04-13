# Hướng dẫn thiết lập Ollama

Ollama cung cấp các mô hình AI miễn phí, chạy cục bộ (local) ngay trên phần cứng của bạn. Hướng dẫn này bao gồm mọi thứ bạn cần biết để thiết lập Ollama với DocuMind.

---

## Tại sao chọn Ollama?

- **🆓 Hoàn toàn miễn phí**: Không tốn chi phí API sau khi thiết lập ban đầu.
- **🔒 Quyền riêng tư tuyệt đối**: Dữ liệu của bạn không bao giờ rời khỏi mạng nội bộ.
- **📱 Hoạt động ngoại tuyến**: Hoạt động tốt mà không cần kết nối internet.
- **🧠 Hỗ trợ mô hình suy luận**: Hỗ trợ các mô hình nâng cao như DeepSeek-R1.

---

## Bắt đầu nhanh

### 1. Cài đặt Ollama

- **macOS/Linux**: Truy cập [ollama.ai](https://ollama.ai) và chạy lệnh cài đặt.
- **Windows**: Tải xuống bản cài đặt `.exe` từ trang chủ.

### 2. Tải các mô hình cần thiết

Mở terminal và chạy các lệnh sau:

```bash
# Mô hình ngôn ngữ (Lựa chọn tốt nhất hiện nay)
ollama pull qwen3              # Đa năng, cực kỳ thông minh
ollama pull deepseek-r1       # Mô hình suy luận chuyên sâu

# Mô hình nhúng (Bắt buộc để tìm kiếm tài liệu)
ollama pull mxbai-embed-large
```

### 3. Cấu hình trong DocuMind

**Thông qua giao diện Settings (Khuyên dùng):**
1. Vào **Settings** → **API Keys**.
2. Nhấp **Add Credential** → Chọn **Ollama**.
3. Nhập URL cơ sở (Base URL):
   - Nếu chạy cùng máy: `http://localhost:11434`
   - Nếu DocuMind chạy trong Docker: `http://host.docker.internal:11434`
4. Nhấn **Save**, sau đó **Test Connection**.
5. Nhấn **Discover Models** → **Register Models**.

---

## Cấu hình mạng quan trọng

### Khi DocuMind chạy trong Docker

Để DocuMind có thể kết nối với Ollama chạy trên máy chủ (Host), bạn cần lưu ý:

1. **URL**: Sử dụng `http://host.docker.internal:11434`.
2. **Cho phép kết nối bên ngoài**: Ollama mặc định chỉ cho phép kết nối nội bộ. Bạn cần đặt biến môi trường cho Ollama:
   ```bash
   export OLLAMA_HOST=0.0.0.0:11434
   ollama serve
   ```

---

## Khuyên dùng mô hình

| Mô hình | Kích thước | Phù hợp cho | Tốc độ |
|-------|------|----------|-------|
| **qwen3** | 7B | Tổng quát, dịch thuật, tóm tắt | Nhanh |
| **deepseek-r1** | 7B | Giải quyết vấn đề phức tạp, suy luận | Trung bình |
| **phi4** | 14B | Tiết kiệm tài nguyên, hiệu suất tốt | Rất nhanh |

---

## Xử lý sự cố thường gặp

### Lỗi "Failed to send message"
**Nguyên nhân chính**: Tên mô hình trong DocuMind không khớp chính xác với Ollama.
- Chạy lệnh `ollama list` để xem chính xác tên (ví dụ: `qwen3:latest`).
- Trong DocuMind, hãy đảm bảo bạn nhập **đúng từng ký tự** của tên mô hình đó.

### Ollama không phản hồi
- Kiểm tra xem Ollama đã chạy chưa: Truy cập `http://localhost:11434` trên trình duyệt. Nếu thấy "Ollama is running" là thành công.

Sử dụng Ollama là cách tuyệt vời nhất để biến DocuMind thành một trạm nghiên cứu AI **hoàn toàn miễn phí và riêng tư**.
