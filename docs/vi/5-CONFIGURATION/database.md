# Cấu hình Cơ sở dữ liệu - SurrealDB

DocuMind sử dụng **SurrealDB** làm cơ sở dữ liệu cốt lõi để lưu trữ Notebooks, ghi chú và thông tin cấu hình.

---

## Cấu hình mặc định

Hệ thống sẽ hoạt động ngay lập tức nếu các biến môi trường được thiết lập chính xác. Dưới đây là các kịch bản cài đặt phổ biến:

### 1. Chạy cùng trong Docker Compose (Khuyên dùng)
Nếu bạn cài đặt theo hướng dẫn [Docker Compose](../1-INSTALLATION/docker-compose.md), hãy dùng cấu hình này:

```env
SURREAL_URL="ws://surrealdb:8000/rpc"
SURREAL_USER="root"
SURREAL_PASSWORD="root" # HÃY THAY ĐỔI TRONG THỰC TẾ!
SURREAL_NAMESPACE="documind"
SURREAL_DATABASE="documind"
```

### 2. CSDL chạy trên máy chủ (Host), DocuMind chạy trong Docker
Nếu DocuMind chạy trong Docker nhưng SurrealDB lại chạy trực tiếp trên máy của bạn:

```env
SURREAL_URL="ws://host.docker.internal:8000/rpc"
SURREAL_USER="root"
SURREAL_PASSWORD="root"
SURREAL_NAMESPACE="documind"
SURREAL_DATABASE="documind"
```

### 3. Cả hai cùng chạy trực tiếp trên một máy (không dùng Docker)
Nếu bạn cài đặt từ nguồn và chạy mọi thứ bằng dòng lệnh:

```env
SURREAL_URL="ws://localhost:8000/rpc"
SURREAL_USER="root"
SURREAL_PASSWORD="root"
SURREAL_NAMESPACE="documind"
SURREAL_DATABASE="documind"
```

---

## Quản lý nhiều cơ sở dữ liệu
Một máy chủ SurrealDB duy nhất có thể chứa nhiều `Namespace` và nhiều `Database` khác nhau. Điều này có nghĩa là bạn có thể triển khai nhiều thực thể DocuMind cho các dự án hoặc người dùng khác nhau mà chỉ cần duy trì một instance SurrealDB duy nhất, giúp tiết kiệm tài nguyên hệ thống đáng kể.

---

## Xử lý sự cố kết nối
- **Lỗi kết nối**: Kiểm tra xem cổng 8000 đã được mở và không bị chiếm dụng bởi ứng dụng khác.
- **Lỗi xác thực**: Đảm bảo `SURREAL_USER` và `SURREAL_PASSWORD` khớp với thông tin bạn dùng khi khởi chạy lệnh `surreal start`.
- **Lỗi Namespace/Database**: Nếu bạn đổi tên hai biến này, DocsMind sẽ tạo mới một CSDL hoàn toàn sạch - dữ liệu cũ sẽ không hiển thị nhưng vẫn nằm trong file vật lý của SurrealDB.
