# Hướng dẫn nhanh - Nhà cung cấp AI Đám mây (5 phút)

Khởi động DocuMind với **OpenAI, Google hoặc các nhà cung cấp đám mây khác**. Đơn giản, mạnh mẽ và tốc độ cao.

## Điều kiện tiên quyết

1. **Docker Desktop** đã được cài đặt.
2. **Khóa API (API Key)** từ nhà cung cấp bạn chọn:
   - **OpenAI**: https://platform.openai.com/api-keys
   - **Google (Gemini)**: https://aistudio.google.com/

---

## Bước 1: Tạo tệp cấu hình (1 phút)

Tạo một thư mục mới tên là `documind` và thêm tệp sau:

**docker-compose.yml**:
```yaml
services:
  surrealdb:
    image: surrealdb/surrealdb:v2
    command: start --user root --pass password --bind 0.0.0.0:8000 rocksdb:/mydata/mydatabase.db
    ports:
      - "8000:8000"
    volumes:
      - ./surreal_data:/mydata
    restart: always

  documind:
    image: tandoan/documind:latest
    pull_policy: always
    ports:
      - "8502:8502"  # Giao diện Web
      - "5055:5055"  # API
    environment:
      - OPEN_NOTEBOOK_ENCRYPTION_KEY=thay-bang-mot-chuoi-bi-mat
      - SURREAL_URL=ws://surrealdb:8000/rpc
      - SURREAL_USER=root
      - SURREAL_PASSWORD=password
      - SURREAL_NAMESPACE=documind
      - SURREAL_DATABASE=documind
    volumes:
      - ./notebook_data:/app/data
    depends_on:
      - surrealdb
    restart: always
```

---

## Bước 2: Khởi chạy dịch vụ (1 phút)

Mở terminal trong thư mục `documind` và chạy:

```bash
docker compose up -d
```

---

## Bước 3: Truy cập DocuMind (Tức thì)

Mở trình duyệt: `http://localhost:8502`

---

## Bước 4: Cấu hình Nhà cung cấp AI (1 phút)

1. Vào **Settings** → **API Keys**.
2. Nhấp **Add Credential**.
3. Chọn nhà cung cấp (ví dụ: Google hoặc OpenAI).
4. Nhập khóa API của bạn và nhấp **Save**.
5. Nhấp **Test Connection** để đảm bảo thành công.
6. Nhấp **Discover Models** → **Register Models**.

---

## Bước 5: Chọn Mô hình mặc định (1 phút)

1. Vào **Settings** → **Models**.
2. Chọn mô hình bạn vừa đăng ký (ví dụ: `gpt-4o` hoặc `gemini-1.5-flash`).
3. Nhấp **Save**.

---

## So sánh nhanh các Nhà cung cấp Cloud

| Nhà cung cấp | Tốc độ | Chất lượng | Ngữ cảnh | Chi phí |
|----------|-------|---------|---------|------|
| **OpenAI** | Rất nhanh | Xuất sắc | 128K | $$ |
| **Google** | Nhanh | Rất tốt | 1M+ | $ (Có gói miễn phí) |

---

## Xử lý sự cố nhanh

- **Lỗi "Model not found"**: Đảm bảo bạn đã nhấp "Discover Models" sau khi thêm API Key.
- **Lỗi kết nối Server**: Chạy `docker compose restart` để khởi động lại dịch vụ.

---

## Các bước tiếp theo

1. **Thêm tài liệu**: Tải lên PDF, gán link web để bắt đầu phân tích.
2. **Khám phá tính năng**: Thử tạo Podcast hoặc sử dụng Chat để đặt câu hỏi về tài liệu.
3. **Xem tài liệu đầy đủ**: [Hướng dẫn sử dụng](../3-USER-GUIDE/index.md).
