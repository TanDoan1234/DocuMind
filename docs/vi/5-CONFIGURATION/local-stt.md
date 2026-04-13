# Thiết lập Nhận dạng giọng nói (STT) Cục bộ

Chuyển đổi âm thanh và video thành văn bản miễn phí, riêng tư và an toàn bằng cách chạy máy chủ STT cục bộ tương thích với OpenAI.

---

## Tại sao chọn STT Cục bộ?

- **Miễn phí**: Không tốn phí trên mỗi phút sau khi thiết lập.
- **Riêng tư**: Dữ liệu âm thanh không bao giờ rời khỏi máy tính của bạn.
- **Không giới hạn**: Không bị giới hạn tốc độ hay hạn mức sử dụng.
- **Offline**: Hoạt động tốt mà không cần kết nối internet.

---

## Bắt đầu nhanh với Speaches

[Speaches](https://github.com/speaches-ai/speaches) là máy chủ mã nguồn mở hỗ trợ cả TTS và STT, sử dụng công nghệ [faster-whisper](https://github.com/SYSTRAN/faster-whisper) để có tốc độ xử lý nhanh nhất.

### Bước 1: Khởi chạy Speaches bằng Docker
Nếu bạn đã cài đặt Speaches cho [TTS](local-tts.md), bạn có thể dùng chung máy chủ đó. Nếu chưa, tạo tệp `docker-compose.yml`:

```yaml
services:
  speaches:
    image: ghcr.io/speaches-ai/speaches:latest-cpu
    ports:
      - "8969:8000"
    restart: unless-stopped
```

### Bước 2: Tải mô hình Whisper
Whisper có nhiều kích thước khác nhau. Chúng tôi khuyên dùng bản `small` cho sự cân bằng giữa tốc độ và độ chính xác:

```bash
docker compose exec speaches uv tool run speaches-cli model download Systran/faster-whisper-small
```

### Bước 3: Cấu hình trong DocuMind
1. Vào **Settings** → **API Keys**.
2. Nhấn **Add Credential** → Chọn **OpenAI-Compatible**.
3. Nhập URL cơ sở cho STT: `http://host.docker.internal:8969/v1` (Docker) hoặc `http://localhost:8969/v1` (local).
4. Nhấn **Save**.

### Bước 4: Đăng ký mô hình STT
1. Vào **Settings** → **Models**.
2. Nhấn **Add Model** trong phần **Speech-to-Text**.
3. Cấu hình:
   - **Provider**: `openai_compatible`
   - **Model Name**: `Systran/faster-whisper-small`
   - **Display Name**: `Local Whisper`
4. Nhấn **Save**.

---

## Lựa chọn mô hình Whisper

| Mô hình | Kích thước | Đặc điểm |
|---------|------------|----------|
| `tiny` | ~75 MB | Nhanh nhất, độ chính xác cơ bản |
| `base` | ~150 MB | Nhanh, độ chính xác ổn |
| `small` | ~500 MB | **Khuyên dùng**: Cân bằng nhất |
| `medium` | ~1.5 GB | Chậm hơn, độ chính xác cao |
| `large-v3` | ~3 GB | Chậm nhất, độ chính xác tốt nhất |

---

## Tăng tốc bằng GPU
Xử lý âm thanh (STT) tốn nhiều tài nguyên hơn tạo giọng nói (TTS). Nếu bạn có card đồ họa NVIDIA, hãy sử dụng image `latest-cuda` để tăng tốc độ nhận dạng lên gấp 5-10 lần.

---

## Hỗ trợ ngôn ngữ
Whisper hỗ trợ hơn 99 ngôn ngữ, bao gồm cả **Tiếng Việt**. Hệ thống thường tự động nhận diện ngôn ngữ, nhưng bạn có thể chỉ định `language=vi` trong các yêu cầu nâng cao để có kết quả chính xác nhất.

---

## Xử lý sự cố
- **Nhận dạng sai**: Hãy thử chuyển sang mô hình lớn hơn (`medium` hoặc `large-v3`).
- **Xử lý quá lâu**: Đảm bảo bạn đã cấp đủ RAM cho Docker (khuyên dùng ít nhất 8GB).
- **Lỗi kết nối**: Kiểm tra máy chủ Speaches đã chạy và thông tin URL trong Cài đặt đã đúng.

Tích hợp STT cục bộ giúp **DocuMind** trở thành một trợ lý nghiên cứu vạn năng, có thể "nghe" và "hiểu" mọi tài liệu âm thanh của bạn một cách an toàn tuyệt đối.
