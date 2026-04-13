# Cài đặt Single Container (Sắp ngừng hỗ trợ)

> **Thông báo quan trọng:** Hình ảnh single-container (`v1-latest-single`) hiện đã bị **ngừng hỗ trợ** và sẽ bị gỡ bỏ trong phiên bản v2. Vui lòng chuyển sang sử dụng [Docker Compose](docker-compose.md), đây là phương thức cài đặt được khuyến nghị cho mọi người dùng.

Đây là phương thức thiết lập tất-cả-trong-một trong một container duy nhất. **Đơn giản hơn Docker Compose nhưng ít linh hoạt hơn.**

**Phù hợp nhất cho:** Railway, Render, DigitalOcean, hoặc các môi trường lưu trữ chia sẻ có cấu hình tối thiểu.

## Điều kiện tiên quyết

- Đã cài đặt Docker.
- Khóa API của AI provider (OpenAI, Google, v.v.).

---

## Thiết lập nhanh

### Chạy thử cục bộ (Docker)

```yaml
# docker-compose.yml
services:
  documind:
    image: tandoan/documind:v1-latest-single
    pull_policy: always
    ports:
      - "8502:8502"  # Giao diện Web
      - "5055:5055"  # API
    environment:
      - OPEN_NOTEBOOK_ENCRYPTION_KEY=chuoi-bi-mat-cua-ban
      - SURREAL_URL=ws://localhost:8000/rpc
      - SURREAL_USER=root
      - SURREAL_PASSWORD=root
      - SURREAL_NAMESPACE=documind
      - SURREAL_DATABASE=documind
    volumes:
      - ./data:/app/data
    restart: always
```

Chạy lệnh: `docker compose up -d`

Truy cập: `http://localhost:8502`

---

## Biến môi trường

| Biến | Mục đích | Ví dụ |
|----------|---------|---------|
| `OPEN_NOTEBOOK_ENCRYPTION_KEY` | Khóa mã hóa để lưu API Keys (bắt buộc) | `my-secret-key` |
| `SURREAL_URL` | Kết nối cơ sở dữ liệu | `ws://localhost:8000/rpc` |
| `API_URL` | URL công khai (khi truy cập từ xa) | `https://myapp.example.com` |

---

## So sánh với Docker Compose

| Tính năng | Single Container | Docker Compose |
|---------|------------------|-----------------|
| Thời gian thiết lập | 2 phút | 5 phút |
| Độ phức tạp | Cực thấp | Trung bình |
| Khả năng mở rộng | Hạn chế | Rất tốt |
| Sử dụng bộ nhớ | ~800MB | ~1.2GB |

---

## Các bước tiếp theo

Sau khi khởi chạy thành công, hãy truy cập vào giao diện web:
1. Vào **Settings → API Keys** để thêm thông tin nhà cung cấp AI.
2. Kiểm tra kết nối (**Test Connection**) và đăng ký mô hình (**Discover Models**).

Xem thêm hướng dẫn tại [Docker Compose](docker-compose.md) để biết các bước sau cài đặt đầy đủ nhất.
