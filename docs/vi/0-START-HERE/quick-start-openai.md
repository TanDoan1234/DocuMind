# Hướng dẫn nhanh - OpenAI (5 phút)

Khởi chạy DocuMind với các mô hình GPT của OpenAI. Nhanh chóng, mạnh mẽ và đơn giản.

## Điều kiện tiên quyết

1. **Docker Desktop** đã được cài đặt.
2. **OpenAI API Key**:
   - Truy cập https://platform.openai.com/api-keys
   - Tạo khóa bí mật mới (bắt đầu bằng `sk-`).
   - Đảm bảo tài khoản của bạn có đủ số dư (tối thiểu $5).

---

## Bước 1: Tạo cấu hình (1 phút)

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

## Bước 4: Cấu hình OpenAI (1 phút)

1. Vào **Settings** → **API Keys**.
2. Nhấp **Add Credential** → Chọn **OpenAI**.
3. Dán khóa API của bạn và nhấp **Save**.
4. Nhấp **Test Connection** để đảm bảo thành công.
5. Nhấp **Discover Models** → **Register Models**.

---

## Bước 5: Thử nghiệm sơ bộ (1 phút)

1. Tạo một Notebook mới.
2. Thêm một link web (ví dụ: Wikipedia về AI).
3. Đợi xử lý xong và bắt đầu Chat: "AI là gì?"

---

## Xử lý sự cố nhanh

- **Lỗi cổng 8502 bị chiếm dụng**: Đổi thành `"8503:8502"` trong tệp cấu hình và truy cập `http://localhost:8503`.
- **Lỗi API Key**: Kiểm tra số dư và trạng thái khóa tại trang quản trị OpenAI.
- **Lỗi kết nối Server**: Chạy `docker compose restart` để khởi động lại toàn bộ dịch vụ.

**DocuMind** đã sẵn sàng đồng hành cùng bạn trong hành trình nghiên cứu tri thức!
