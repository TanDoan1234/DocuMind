# Cấu hình Reverse Proxy

Triển khai DocuMind đằng sau Nginx, Caddy, Traefik hoặc các bộ định tuyến ngược khác với tên miền tùy chỉnh và giao thức HTTPS.

---

## Thiết lập đơn giản hóa (v1.1+)

Kể từ phiên bản v1.1, DocuMind sử dụng cơ chế Next.js rewrites để đơn giản hóa cấu hình. **Bạn chỉ cần chuyển hướng (proxy) tới một cổng duy nhất (8502)** - Next.js sẽ tự động xử lý việc định tuyến API nội bộ.

### Cơ chế hoạt động:
```
Trình duyệt → Reverse Proxy → Cổng 8502 (Next.js)
                                 ↓ (Proxy nội bộ)
                              Cổng 5055 (FastAPI)
```
Next.js tự động chuyển các yêu cầu `/api/*` tới backend FastAPI, vì vậy bộ định tuyến ngược của bạn chỉ cần quản lý một cổng duy nhất!

---

## Các ví dụ cấu hình nhanh

### Nginx (Khuyên dùng)

```nginx
server {
    listen 443 ssl http2;
    server_name notebook.example.com;

    ssl_certificate /etc/nginx/ssl/fullchain.pem;
    ssl_certificate_key /etc/nginx/ssl/privkey.pem;

    # Cho phép tải tệp lên tới 100MB
    client_max_body_size 100M;

    location / {
        proxy_pass http://documind:8502;
        proxy_http_version 1.1;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection 'upgrade';
        proxy_cache_bypass $http_upgrade;
        
        # Tăng thời gian chờ cho các tác vụ AI lâu (600 giây)
        proxy_read_timeout 600s;
    }
}
```

### Caddy (Tự động HTTPS)

```caddy
notebook.example.com {
    reverse_proxy documind:8502 {
        transport http {
            read_timeout 600s
            write_timeout 600s
        }
    }
}
```
Caddy tự động quản lý chứng chỉ SSL. Các thiết lập `timeout` đảm bảo các tác vụ lâu như tạo Podcast không bị ngắt giữa chừng.

---

## Biến môi trường quan trọng

Khi chạy đằng sau Reverse Proxy, bạn **bắt buộc** phải thiết lập biến này:

```bash
# URL công khai của bạn (phải có https://)
API_URL=https://notebook.example.com
```

### Tại sao phải đặt API_URL?
- **Độ tin cậy**: Giúp hệ thống định vị chính xác địa chỉ API Server.
- **Bảo mật**: Đảm bảo giao diện sử dụng `https://` khi trao đổi dữ liệu.
- **Tên miền tùy chỉnh**: Hoạt động chính xác với domain thay vì địa chỉ IP.

---

## Troubleshooting (Xử lý sự cố)

### Lỗi "502 Bad Gateway"
1. Kiểm tra xem container DocuMind đã chạy chưa (`docker ps`).
2. Đảm bảo Nginx/Caddy có thể kết nối tới container (cùng mạng Docker).

### Lỗi "413 Payload Too Large"
- Do bộ định tuyến ngược chặn tệp tải lên quá lớn. Hãy tăng giới hạn `client_max_body_size` trong Nginx hoặc `max_size` trong Caddy.

### Lỗi "Mixed Content"
- Xảy ra khi giao diện chạy HTTPS nhưng `API_URL` lại đặt là `http://`. Hãy đảm bảo tất cả đều sử dụng `https://`.

---

## Tóm tắt
Việc sử dụng Reverse Proxy không chỉ giúp bạn có một tên miền đẹp mà còn là lớp bảo vệ quan trọng cho hệ thống nghiên cứu của bạn. Đối với hầu hết người dùng, **Nginx** hoặc **Caddy** là lựa chọn tối ưu nhất về cả hiệu suất lẫn sự tiện lợi.
