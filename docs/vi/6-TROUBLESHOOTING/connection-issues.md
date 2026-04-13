# Lỗi kết nối - Vấn đề về Mạng & API

Giao diện không thể kết nối với API hoặc các dịch vụ không thể giao tiếp với nhau.

---

## "Cannot connect to server" (Lỗi phổ biến nhất)

**Triệu chứng:**
- Trình duyệt báo lỗi không thể truy cập trang web.
- Thông báo "Unable to reach API" hoặc "Cannot connect to server".
- Giao diện tải được nhưng không thể tạo notebook hay thao tác gì khác.

**Chẩn đoán bằng lệnh:**

```bash
# Kiểm tra xem API có đang chạy không
docker ps | grep documind

# Kiểm tra xem API có phản hồi không
curl http://localhost:5055/health
# Kết quả đúng: {"status":"healthy"}
```

**Các giải pháp:**

### Giải pháp 1: API chưa chạy
```bash
# Khởi động lại dịch vụ API
docker compose up documind -d
```

### Giải pháp 2: Cổng (Port) chưa được mở
Kiểm tra tệp `docker-compose.yml` xem đã có ánh xạ cổng chưa:
```yaml
documind:
  ports:
    - "5055:5055"
```

### Giải pháp 3: Sai địa chỉ API_URL
Trong tệp `.env` hoặc `docker.env`, kiểm tra tham số `API_URL`. Nó phải khớp với địa chỉ mà trình duyệt dùng để gọi API:
- Nếu dùng local: `API_URL=http://localhost:5055`
- Nếu dùng IP máy: `API_URL=http://192.168.1.100:5055`

---

## Lỗi 502 Bad Gateway (Khi dùng Proxy)

**Nguyên nhân:** Máy chủ Proxy (như Nginx) không thể kết nối tới container API.

**Cách xử lý:**
- Kiểm tra xem API có đang chạy thực sự không.
- Kiểm tra cấu hình Nginx, đảm bảo `proxy_pass` trỏ đúng vào cổng 5055 của container.

---

## Truy cập từ thiết bị khác trong mạng nội bộ

Bạn muốn dùng điện thoại hoặc máy tính khác để truy cập DocuMind đang chạy trên máy chủ này.

**Bước 1: Lấy IP của máy chủ**
Chạy lệnh `hostname -I` hoặc `ifconfig` để lấy IP (ví dụ: `192.168.1.100`).

**Bước 2: Cập nhật API_URL**
Trong file cấu hình, đặt: `API_URL=http://192.168.1.100:5055`.

**Bước 3: Khởi động lại và truy cập**
Sử dụng địa chỉ `http://192.168.1.100:8502` trên trình duyệt của thiết bị khác.

---

## Danh sách kiểm tra nhanh:
- [ ] Dịch vụ đang chạy (docker ps).
- [ ] Đã mở các cổng quan trọng: 8502 (Web), 5055 (API), 8000 (DB).
- [ ] `API_URL` được thiết lập chính xác.
- [ ] Tường lửa (Firewall) của máy chủ không chặn các cổng trên.
