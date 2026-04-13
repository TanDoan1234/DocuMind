# Tham chiếu đầy đủ về Biền môi trường

Danh sách toàn diện tất cả các biến môi trường khả dụng trong DocuMind.

---

## Cấu hình API

| Biến | Bắt buộc? | Mặc định | Mô tả |
|----------|-----------|---------|-------------|
| `API_URL` | Không | Tự động | URL để Frontend kết nối với API (ví dụ: http://localhost:5055) |
| `INTERNAL_API_URL` | Không | http://localhost:5055 | URL API nội bộ cho Next.js server-side proxying |
| `API_CLIENT_TIMEOUT` | Không | 300 | Thời gian chờ (giây) để nhận phản hồi từ API |
| `OPEN_NOTEBOOK_PASSWORD` | Không | Không | Mật khẩu bảo vệ ứng dụng DocuMind |
| `OPEN_NOTEBOOK_ENCRYPTION_KEY` | **Có** | Không | Chuỗi bí mật để mã hóa API Keys trong CSDL. **Bắt buộc** để hệ thống quản lý thông tin định danh hoạt động. |
| `HOSTNAME` | Không | `0.0.0.0` | Giao diện mạng mà Next.js sẽ lắng nghe. Mặc định `0.0.0.0` giúp truy cập được từ Reverse Proxy |

---

## Cơ sở dữ liệu: SurrealDB

| Biến | Bắt buộc? | Mặc định | Mô tả |
|----------|-----------|---------|-------------|
| `SURREAL_URL` | Có | ws://surrealdb:8000/rpc | URL kết nối WebSocket tới SurrealDB |
| `SURREAL_USER` | Có | root | Tên đăng nhập SurrealDB |
| `SURREAL_PASSWORD` | Có | root | Mật khẩu SurrealDB |
| `SURREAL_NAMESPACE` | Có | documind | Namespace của SurrealDB |
| `SURREAL_DATABASE` | Có | documind | Tên cơ sở dữ liệu SurrealDB |

---

## Thời gian chờ & Hiệu suất

| Biến | Bắt buộc? | Mặc định | Mô tả |
|----------|-----------|---------|-------------|
| `ESPERANTO_LLM_TIMEOUT` | Không | 60 | Thời gian chờ phản hồi của mô hình LLM (giây) |
| `SURREAL_COMMANDS_MAX_TASKS` | Không | 5 | Số lượng tác vụ cơ sở dữ liệu chạy đồng thời tối đa |
| `TTS_BATCH_SIZE` | Không | 5 | Số lượng yêu cầu Chuyển giọng nói (TTS) đồng thời |

---

## Trích xuất nội dung

| Biến | Bắt buộc? | Mặc định | Mô tả |
|----------|-----------|---------|-------------|
| `FIRECRAWL_API_KEY` | Không | Không | Khóa API Firecrawl để cào dữ liệu web nâng cao |
| `JINA_API_KEY` | Không | Không | Khóa API Jina AI để trích xuất văn bản từ web |

---

## Biến môi trường theo trường hợp sử dụng

### Cài đặt tối thiểu (Dành cho người mới)
```
OPEN_NOTEBOOK_ENCRYPTION_KEY=chuoi-bí-mat-cua-ban
SURREAL_URL=ws://surrealdb:8000/rpc
SURREAL_USER=root
SURREAL_PASSWORD=password
```

### Triển khai thực tế (Production)
```
OPEN_NOTEBOOK_ENCRYPTION_KEY=chuoi-mat-ma-cuc-manh
OPEN_NOTEBOOK_PASSWORD=mat-khau-truy-cap-cua-ban
API_URL=https://mynotebook.example.com
```

### Chạy qua Proxy doanh nghiệp
```
HTTP_PROXY=http://proxy.corp.com:8080
HTTPS_PROXY=http://proxy.corp.com:8080
NO_PROXY=localhost,127.0.0.1
```

---

## Các lưu ý quan trọng

- **Phân biệt hoa thường**: `OPEN_NOTEBOOK_ENCRYPTION_KEY` khác với `open_notebook_encryption_key`.
- **Không có khoảng trắng**: Sử dụng `KEY=VALUE`, không dùng `KEY = VALUE`.
- **Cần khởi động lại**: Mọi thay đổi trong tệp môi trường yêu cầu bạn phải khởi động lại các dịch vụ (container) để có hiệu lực.
- **Bảo mật**: Tuyệt đối không đẩy tệp chứa khóa mã hóa hoặc mật khẩu lên GitHub.

Bằng cách hiểu rõ các biến môi trường này, bạn có thể tinh chỉnh **DocuMind** để đạt được hiệu suất và độ bảo mật cao nhất cho công việc nghiên cứu của mình.
