# Cấu hình nâng cao

Tinh chỉnh hiệu suất, gỡ lỗi và các tính năng chuyên sâu cho DocuMind.

---

## Tinh chỉnh Hiệu suất

### Kiểm soát đồng thời (Concurrency Control)

```env
# Số lượng tối đa các tác vụ xử lý cùng lúc (mặc định: 5)
SURREAL_COMMANDS_MAX_TASKS=5
```

**Khuyến nghị theo phần cứng:**
- CPU 2 nhân: 2-3 tác vụ.
- CPU 4 nhân: 5 tác vụ (mặc định).
- CPU 8+ nhân: 10-20 tác vụ.

### Chiến lược thử lại (Retry Strategy)

```env
# Cách hệ thống đợi giữa các lần thử lại (mặc định: exponential_jitter)
SURREAL_COMMANDS_RETRY_WAIT_STRATEGY=exponential_jitter
```
Chiến lược `exponential_jitter` giúp ngăn chặn hiện tượng quá tải hệ thống khi nhiều tác vụ cùng thử lại một lúc.

### Tinh chỉnh Thời gian chờ (Timeout)

```env
# Thời gian chờ của Client (mặc định: 300 giây)
API_CLIENT_TIMEOUT=300

# Thời gian chờ của mô hình AI (mặc định: 60 giây)
ESPERANTO_LLM_TIMEOUT=60
```
Luôn đảm bảo `API_CLIENT_TIMEOUT` lớn hơn `ESPERANTO_LLM_TIMEOUT` để tránh ngắt kết nối trước khi AI kịp trả lời.

---

## Nhật ký lỗi & Gỡ lỗi (Logging & Debugging)

### Bật nhật ký chi tiết

```bash
# Đối với các thành phần Rust
RUST_LOG=debug

# Đối với các thành phần Python
LOGLEVEL=DEBUG
```

---

## Cấu hình Cổng (Port)

Dưới đây là các cổng mặc định:
- **Giao diện Web**: 8502 (Nếu chạy Docker)
- **API**: 5055
- **SurrealDB**: 8000

Nếu bạn muốn đổi cổng Giao diện Web, hãy sửa trong `docker-compose.yml`:
```yaml
ports:
  - "8001:8502"  # Đổi từ 8502 thành 8001
```

---

## Bảo mật hệ thống

### Thay đổi thông tin mặc định cơ sở dữ liệu
Đừng sử dụng thông tin mặc định (root/root) khi triển khai thực tế:
```env
SURREAL_USER=ten_dang_nhap_bao_mat
SURREAL_PASSWORD=mat_khau_cuc_kho
```

### Bảo vệ bằng mật khẩu cho DocuMind
```env
# Yêu cầu mật khẩu khi truy cập giao diện
OPEN_NOTEBOOK_PASSWORD=mat_khau_cua_ban
```

---

## Sao lưu & Khôi phục (Backup & Restore)

### Vị trí lưu trữ dữ liệu chính:
- `./notebook_data`: Chứa tệp tải lên, podcast, v.v.
- `./surreal_data`: Chứa cơ sở dữ liệu SurrealDB.

### Cách sao lưu nhanh:
```bash
# Dừng dịch vụ
docker compose down

# Nén dữ liệu
tar -czf backup-$(date +%Y%m%d).tar.gz notebook_data/ surreal_data/

# Khởi chạy lại
docker compose up -d
```

---

## Tóm tắt
Đa số người dùng chỉ cần cấu hình mặc định là đủ. Bạn chỉ nên tinh chỉnh các thông số nâng cao này khi:
- Hệ thống bị nghẽn (Bottlenecks).
- Cần xử lý lượng dữ liệu cực lớn đồng thời.
- Triển khai trên phần cứng đặc biệt (quá yếu hoặc quá mạnh).
