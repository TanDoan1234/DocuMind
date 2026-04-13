# Cấu hình - Các thiết lập thiết yếu

Cấu hình là cách bạn tùy chỉnh DocuMind cho môi trường cụ thể của mình. Phần này bao gồm những thông tin quan trọng bạn cần nắm vững.

---

## Những gì cần cấu hình?

Có 3 thành phần chính:

1. **Nhà cung cấp AI (AI Provider)** — Dịch vụ LLM/Embedding bạn sử dụng (OpenAI, Ollama, Local...).
2. **Cơ sở dữ liệu (Database)** — Kết nối với SurrealDB (thường đã được cấu hình mặc định).
3. **Máy chủ (Server)** — API URL, cổng (ports), thời gian chờ (timeouts).

---

## Lựa chọn nhanh: Nên dùng Provider nào?

### Lựa chọn 1: Đám mây (Cloud) - Nhanh nhất
- **OpenAI** (GPT)
- **Google Gemini** (Đa phương thức, ngữ cảnh cực dài)
- **ElevenLabs** (Giọng nói Podcast chất lượng nhất)

Cách thiết lập: Lấy API Key → Thêm thông tin trong giao diện Settings → Xong.

### Lựa chọn 2: Local (Miễn phí & Riêng tư)
- **Ollama** (Các mô hình mã nguồn mở chạy ngay trên máy bạn)
- **Local (ViT5/PhoBERT)** (Tối ưu riêng cho Tiếng Việt)

---

## Các thiết lập quan trọng nhất

Các thiết lập dưới đây thường được đặt trong file môi trường (`.env` hoặc `docker.env` tùy vào cách bạn cài đặt).

### 1. Cơ sở dữ liệu SurrealDB

```env
SURREAL_URL=ws://surrealdb:8000/rpc
SURREAL_USER=root
SURREAL_PASSWORD=root  # HÃY THAY ĐỔI KHI TRIỂN KHAI THẬT!
SURREAL_NAMESPACE=documind
SURREAL_DATABASE=documind
```

### 2. Khóa mã hóa (Encryption Key)

Đây là thông số **bắt buộc** để hệ thống có thể lưu trữ và mã hóa các khóa API của bạn một cách an toàn trong cơ sở dữ liệu.

```env
# Đặt một chuỗi ký tự bí mật của riêng bạn:
OPEN_NOTEBOOK_ENCRYPTION_KEY=chuoi-bi-mat-cua-ban-123
```

---

## Cách thêm cấu hình Nhà cung cấp AI

### Thông qua giao diện Settings (Khuyên dùng)

Đây là cách dễ nhất và không cần khởi động lại hệ thống:

1. Mở DocuMind trên trình duyệt.
2. Đi tới **Settings (Cài đặt) → API Keys**.
3. Nhấp vào **"Add Credential"**.
4. Chọn nhà cung cấp (ví dụ: OpenAI), nhập API Key.
5. Nhấp **Save**, sau đó chọn **Test Connection**.
6. Nhấp **Discover Models** → **Register Models**.

Mọi thông tin sẽ được lưu trữ mã hóa an toàn trong cơ sở dữ liệu.

---

## Các lỗi thường gặp khi cấu hình

| Lỗi | Nguyên nhân | Cách xử lý |
|---------|---------|-----|
| Không thấy mô hình | Chưa thêm Credential | Thêm khóa API trong Settings → API Keys |
| Không lưu được khóa | Thiếu Encryption Key | Thiết lập OPEN_NOTEBOOK_ENCRYPTION_KEY trong file .env |
| Lỗi kết nối Server | Cổng 5055 bị chặn | Đảm bảo port 5055 đã được mở trong Docker |
| Sai Database URL | API không khởi động | Kiểm tra định dạng SURREAL_URL |

---

## Hướng dẫn chuyên sâu

- **[Cấu hình Nâng cao](advanced.md)** — Tinh chỉnh hiệu suất, gỡ lỗi và các biến môi trường chuyên sâu.
- **[Bảo mật](security.md)** — Bảo mật bằng mật khẩu, mã hóa và thiết lập tường lửa.
- **[Reverse Proxy](reverse-proxy.md)** — Thiết lập tên miền riêng và HTTPS với Nginx, Caddy, Traefik.
- **[Tham chiếu Biến Môi trường](environment-reference.md)** — Danh sách đầy đủ tất thảy các biến môi trường khả dụng.

---

## Tóm tắt: Cấu hình tối thiểu để chạy

1. Thiết lập `OPEN_NOTEBOOK_ENCRYPTION_KEY` trong file môi trường.
2. Khởi động các dịch vụ (với Docker Compose).
3. Thêm khóa API nhà cung cấp trong giao diện Settings.
4. Xong! Bạn đã sẵn sàng sử dụng.
