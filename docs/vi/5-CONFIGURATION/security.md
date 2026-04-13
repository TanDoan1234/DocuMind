# Cấu hình Bảo mật

Bảo vệ hệ thống DocuMind của bạn bằng xác thực mật khẩu và các biện pháp bảo mật chuyên sâu.

---

## Mã hóa khóa API

DocuMind tự động mã hóa các khóa API lưu trữ trong cơ sở dữ liệu bằng thuật toán Fernet (thanh đối xứng AES-128-CBC với HMAC-SHA256).

### Thiết lập khóa mã hóa
Bạn cần đặt một chuỗi bí mật cho biến môi trường sau:

```bash
# Trong tệp .env hoặc docker-compose.yml
OPEN_NOTEBOOK_ENCRYPTION_KEY=chuoi-bi-mat-cua-ban
```

**Lưu ý quan trọng**: Biến này là **bắt buộc**. Nếu không có nó, bạn sẽ không thể lưu trữ các thông tin định danh (Credentials) của nhà cung cấp AI. Nếu bạn làm mất hoặc đổi khóa này, toàn bộ các khóa API đã lưu trước đó sẽ không thể giải mã được.

---

## Bảo mật bằng mật khẩu truy cập

### Khi nào nên sử dụng?
- Khi triển khai trên Cloud công cộng.
- Trong môi trường mạng dùng chung.
- Bất kỳ khi nào DocuMind có thể truy cập được từ bên ngoài máy tính cá nhân của bạn.

### Cách thiết lập
Thêm biến môi trường sau vào cấu hình Docker của bạn:

```yaml
environment:
  - OPEN_NOTEBOOK_PASSWORD=mat_khau_bao_mat_cua_ban
```

Sau khi đặt mật khẩu, mọi yêu cầu truy cập giao diện web hoặc API đều yêu cầu xác thực.

---

## Bảo mật API

Tất cả các điểm cuối (endpoints) của API đều yêu cầu quyền truy cập:

```bash
# Truy vấn có mật khẩu
curl -H "Authorization: Bearer mat_khau_cua_ban" \
  http://localhost:5055/api/notebooks

# Truy vấn không mật khẩu (Sẽ lỗi)
curl http://localhost:5055/api/notebooks
# Trả về: {"detail": "Missing authorization header"}
```

---

## Các biện pháp tăng cường (Hardening)

### Cấu hình Docker
Để tăng tính bảo mật, bạn nên giới hạn quyền và tài nguyên cho container:

```yaml
services:
  documind:
    image: tandoan/documind:latest
    ports:
      - "127.0.0.1:8502:8502"  # Chỉ cho phép truy cập từ máy nội bộ
    environment:
      - OPEN_NOTEBOOK_PASSWORD=mat_khau_cuc_kho
    security_opt:
      - no-new-privileges:true
```

### Cấu hình Tường lửa (UFW trên Ubuntu)
```bash
sudo ufw allow ssh
sudo ufw allow 80/tcp
sudo ufw allow 443/tcp
sudo ufw deny 8502/tcp   # Chặn truy cập trực tiếp vào giao diện
sudo ufw deny 5055/tcp   # Chặn truy cập trực tiếp vào API
sudo ufw enable
```

---

## Khuyên dùng về An toàn dữ liệu

1. **Luôn sử dụng HTTPS**: Mã hóa lưu lượng truy cập qua SSL/TLS.
2. **Mật khẩu mạnh**: Sử dụng trên 20 ký tự bao gồm chữ hoa, chữ thường, số và ký hiệu.
3. **Cập nhật thường xuyên**: Luôn sử dụng phiên bản Docker image mới nhất để nhận các bản vá bảo mật.
4. **Sao lưu an toàn**: Lưu trữ khóa mã hóa tách biệt hoàn toàn với dữ liệu sao lưu cơ sở dữ liệu.

Bằng cách tuân thủ các hướng dẫn trên, bạn có thể yên tâm nghiên cứu và làm việc trên **DocuMind** một cách riêng tư nhất.
