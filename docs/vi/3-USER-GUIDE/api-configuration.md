# Cấu hình API & Nhà cung cấp

Thiết lập các nhà cung cấp AI thông qua giao diện Cài đặt (Settings). Không cần chỉnh sửa tệp tin.

---

## Hệ thống thông tin định danh (Credentials)

DocuMind quản lý truy cập AI thông qua hệ thống "Credential":
1. Bạn tạo một **Credential** cho mỗi nhà cung cấp (API Key + Cài đặt liên quan).
2. Thông tin này được **mã hóa** và lưu trữ an toàn trong cơ sở dữ liệu.
3. Bạn **kiểm tra kết nối** để đảm bảo khóa hoạt động.
4. Bạn **"Khám phá" (Discover)** và **"Đăng ký" (Register)** các mô hình từ Credential đó.

---

## Bước chuẩn bị: Thiết lập mã hóa

Trước khi lưu bất kỳ khóa API nào, bạn **bắt buộc** phải thiết lập khóa mã hóa trong tệp `docker-compose.yml`:

```yaml
environment:
  - OPEN_NOTEBOOK_ENCRYPTION_KEY=chuoi-bi-mat-cua-ban
```

> **Cảnh báo**: Nếu bạn làm mất hoặc thay đổi khóa này, toàn bộ API Keys đã lưu sẽ không thể đọc được. Hãy sao lưu chuỗi này cẩn thận.

---

## Các bước thiết lập một Nhà cung cấp AI

### Bước 1: Thêm Credential
1. Vào **Settings** → **API Keys**.
2. Nhấn **Add Credential**.
3. Chọn nhà cung cấp (OpenAI, Google, Ollama, v.v.).
4. Nhập tên gợi nhớ và API Key của bạn. Sau đó nhấn **Save**.

### Bước 2: Kiểm tra kết nối
1. Trên thẻ Credential vừa tạo, nhấn **Test Connection**.
2. Nếu hiện **Success**, thông tin của bạn đã chính xác.

### Bước 3: Khám phá mô hình
1. Nhấn **Discover Models** trên thẻ Credential.
2. Hệ thống sẽ liệt kê các mô hình mà tài khoản của bạn có quyền truy cập.

### Bước 4: Đăng ký mô hình
1. Chọn các mô hình bạn muốn dùng (ví dụ: gpt-4o, mxbai-embed-large).
2. Nhấn **Register Models**. Giờ đây các mô hình này đã sẵn sàng để sử dụng trong Chat và Tìm kiếm.

---

## Hỗ trợ đa tài khoản
Bạn có thể thêm nhiều Credential cho cùng một nhà cung cấp. Điều này hữu ích khi bạn muốn tách biệt API Key cho các dự án nghiên cứu khác nhau. Mỗi mô hình khi đăng ký sẽ được liên kết chặt chẽ với Credential mà nó thuộc về.

---

## Chuyển đổi từ biến môi trường (Migration)
Nếu bạn đang sử dụng phiên bản cũ (khai báo API Key trong tệp `.env`), hãy vào **Settings → API Keys**. Bạn sẽ thấy một biểu ngữ thông báo. Nhấn **Migrate to Database** để tự động chuyển các khóa này vào hệ thống mã hóa mới, sau đó bạn có thể xóa chúng khỏi tệp `.env`.

---

## Xử lý sự cố

- **Không lưu được Credential**: Kiểm tra xem bạn đã đặt `OPEN_NOTEBOOK_ENCRYPTION_KEY` chưa.
- **Test Connection thất bại**: Kiểm tra lại API Key có bị thừa khoảng trắng không, tài khoản còn tiền không, hoặc liên kết mạng (nếu dùng Ollama).
- **Không thấy mô hình**: Đảm bảo bạn đã thực hiện bước **Discover Models** sau khi lưu Credential.
