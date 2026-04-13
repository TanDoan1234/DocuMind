# Cài đặt bằng Docker Compose (Khuyên dùng)

Thiết lập đa container với các dịch vụ riêng biệt. **Đây là lựa chọn tốt nhất cho hầu hết người dùng.**

## Điều kiện cần thiết

- Đã cài đặt **Docker Desktop** ([Tải tại đây](https://www.docker.com/products/docker-desktop/))
- Khoảng **5-10 phút** thời gian của bạn
- **Khóa API** cho ít nhất một nhà cung cấp AI (Khuyên dùng OpenAI cho người mới bắt đầu) hoặc dùng mô hình Local.

---

## Bước 1: Lấy tệp docker-compose.yml (1 phút)

Tạo một tệp tên là `docker-compose.yml` với nội dung sau:

```yaml
services:
  surrealdb:
    image: surrealdb/surrealdb:v2
    command: start --log info --user root --pass root rocksdb:/mydata/mydatabase.db
    user: root  # Cần thiết cho Linux
    ports:
      - "8000:8000"
    volumes:
      - ./surreal_data:/mydata
    restart: always

  documind:
    image: tandoan/documind:latest
    ports:
      - "8502:8502"  # Giao diện Web
      - "5055:5055"  # API
    environment:
      # BẮT BUỘC: Thay đổi chuỗi này thành khóa bí mật của riêng bạn
      - OPEN_NOTEBOOK_ENCRYPTION_KEY=thay-bang-mot-chuoi-bi-mat

      # Kết nối Database (giữ nguyên mặc định)
      - SURREAL_URL=ws://surrealdb:8000/rpc
      - SURREAL_USER=root
      - SURREAL_PASSWORD=root
      - SURREAL_NAMESPACE=documind
      - SURREAL_DATABASE=documind
    volumes:
      - ./notebook_data:/app/data
    depends_on:
      - surrealdb
    restart: always
```

**Lưu ý:**
- Thay thế `thay-bang-mot-chuoi-bi-mat` bằng một chuỗi ký tự bất kỳ của bạn (ví dụ: `my-secret-key-123`).

---

## Bước 2: Khởi chạy dịch vụ (2 phút)

Mở terminal trong thư mục chứa tệp trên và chạy:

```bash
docker compose up -d
```

Đợi 15-20 giây để các dịch vụ khởi động hoàn toàn. Bạn có thể kiểm tra trạng thái bằng lệnh:
```bash
docker compose ps
```

---

## Bước 3: Kiểm tra cài đặt (1 phút)

Mở trình duyệt và truy cập:
```
http://localhost:8502
```
Nếu bạn thấy giao diện DocuMind hiện lên, chúc mừng! Bạn đã cài đặt thành công.

---

## Bước 4: Cấu hình Nhà cung cấp AI (2 phút)

1. Vào **Settings** (Cài đặt) → **API Keys**.
2. Nhấp chọn **Add Credential**.
3. Chọn nhà cung cấp của bạn (ví dụ: OpenAI, Google, hoặc Local cho ViT5/PhoBERT).
4. Nhập khóa API của bạn và nhấp **Save**.
5. Nhấp **Test Connection** để đảm bảo kết nối thành công.
6. Nhấp **Discover Models** để hệ thống nhận diện các mô hình khả dụng.

---

## Các lệnh thường dùng

### Dừng dịch vụ
```bash
docker compose down
```

### Xem nhật ký lỗi (Logs)
```bash
docker compose logs -f
```

### Cập nhật lên phiên bản mới nhất
```bash
docker compose down
docker compose pull
docker compose up -d
```

---

## Xử lý sự cố nhanh

**Lỗi "Cannot connect to API"**
- Kiểm tra xem Docker đã chạy chưa.
- Đợi thêm 30 giây vì đôi khi cơ sở dữ liệu cần thời gian để sẵn sàng.

**Lỗi trùng cổng (Port Already in Use)**
- Nếu cổng 8502 đã bị dùng bởi ứng dụng khác, hãy đổi dòng `8502:8502` thành `8503:8502` trong tệp `docker-compose.yml` và truy cập qua `http://localhost:8503`.
