# Thiết lập Chuyển văn bản thành giọng nói (TTS) Cục bộ

Tạo Podcast miễn phí, riêng tư và không giới hạn bằng cách chạy máy chủ TTS cục bộ tương thích với OpenAI.

---

## Tại sao chọn TTS Cục bộ?

- **Miễn phí**: Không tốn phí trên mỗi ký tự sau khi thiết lập.
- **Riêng tư**: Âm thanh không bao giờ rời khỏi máy tính của bạn.
- **Không giới hạn**: Không bị giới hạn tốc độ (Rate limit) hay hạn mức (Quota).
- **Offline**: Hoạt động tốt mà không cần kết nối internet.

---

## Bắt đầu nhanh với Speaches

[Speaches](https://github.com/speaches-ai/speaches) là một máy chủ TTS mã nguồn mở, tương thích hoàn toàn với định dạng API của OpenAI.

### Bước 1: Khởi chạy Speaches bằng Docker
Tạo tệp `docker-compose.yml` với nội dung sau:

```yaml
services:
  speaches:
    image: ghcr.io/speaches-ai/speaches:latest-cpu
    ports:
      - "8969:8000"
    restart: unless-stopped
```

Chạy lệnh: `docker compose up -d`

### Bước 2: Tải mô hình giọng nói
```bash
docker compose exec speaches uv tool run speaches-cli model download speaches-ai/Kokoro-82M-v1.0-ONNX
```

### Bước 3: Cấu hình trong DocuMind
1. Vào **Settings** → **API Keys**.
2. Nhấn **Add Credential** → Chọn **OpenAI-Compatible**.
3. Nhập URL cơ sở cho TTS: `http://host.docker.internal:8969/v1` (Docker) hoặc `http://localhost:8969/v1` (local).
4. Nhấn **Save**.

### Bước 4: Đăng ký mô hình TTS
1. Vào **Settings** → **Models**.
2. Nhấn **Add Model** trong phần **Text-to-Speech**.
3. Cấu hình:
   - **Provider**: `openai_compatible`
   - **Model Name**: `speaches-ai/Kokoro-82M-v1.0-ONNX`
   - **Display Name**: `Local TTS`
4. Nhấn **Save** và đặt làm mặc định nếu muốn.

---

## Danh sách giọng nói sẵn có (Kokoro)
Mô hình Kokoro cung cấp nhiều giọng nói chất lượng:
- **Nữ**: `af_bella` (Chuyên nghiệp), `af_sarah` (Thân thiện), `af_nicole` (Năng động).
- **Nam**: `am_adam` (Trầm ấm), `am_michael` (Tự nhiên).

---

## Tăng tốc bằng GPU
Nếu bạn có card đồ họa NVIDIA, hãy đổi image sang `latest-cuda` và thêm cấu hình `deploy` trong Docker Compose để việc tạo giọng nói nhanh hơn gấp nhiều lần.

---

## Xử lý sự cố
- **Lỗi kết nối**: Kiểm tra xem cổng 8969 đã mở chưa bằng cách truy cập `http://localhost:8969/v1/models` trên trình duyệt.
- **Không có âm thanh**: Đảm bảo mô hình đã được tải xuống hoàn tất ở Bước 2.

Sử dụng TTS cục bộ giúp bạn làm chủ hoàn toàn quy trình tạo nội dung âm thanh từ tài liệu nghiên cứu trên **DocuMind**.
