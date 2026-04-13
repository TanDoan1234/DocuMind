# Bắt đầu nhanh - Dành cho Nhà phát triển

Giúp DocuMind chạy trên máy cá nhân của bạn chỉ trong 5 phút.

## Yêu cầu tiên quyết

- **Python 3.11+**
- **Git**
- **uv** (trình quản lý gói) - cài đặt bằng: `curl -LsSf https://astral.sh/uv/install.sh | sh`
- **Docker** (tùy chọn, dùng để chạy SurrealDB nhanh hơn)

## 1. Tải mã nguồn (2 phút)

```bash
# Clone repository từ GitHub
git clone https://github.com/tandoan/documind.git
cd documind
```

## 2. Cài đặt các gói phụ thuộc (2 phút)

```bash
# Cài đặt các gói Python bằng uv
uv sync

# Kiểm tra uv đã hoạt động chưa
uv --version
```

## 3. Khởi chạy các dịch vụ (1 phút)

Mở 3 cửa sổ Terminal riêng biệt:

```bash
# Terminal 1: Khởi chạy SurrealDB (Cơ sở dữ liệu)
make database

# Terminal 2: Khởi chạy API (Backend tại cổng 5055)
make api

# Terminal 3: Khởi chạy Frontend (Giao diện tại cổng 3000)
cd frontend && npm install && npm run dev
```

## 4. Kiểm tra hệ thống

- **API Health**: Truy cập [http://localhost:5055/health](http://localhost:5055/health) → phải trả về `{"status": "ok"}`.
- **Tài liệu API**: [http://localhost:5055/docs](http://localhost:5055/docs) → Tài liệu API tương tác.
- **Giao diện người dùng**: [http://localhost:3000](http://localhost:3000).

**Nếu cả 3 đều hoạt động?** ✅ Bạn đã sẵn sàng để lập trình!

---

## Các lệnh phát triển thường dùng

```bash
# Chạy toàn bộ bản kiểm thử (Tests)
uv run pytest

# Định dạng code tự động
make ruff

# Kiểm tra lỗi code (Linting)
make lint

# Chạy toàn bộ hệ thống bằng 1 lệnh duy nhất
make start-all
```

---

## Xử lý sự cố nhanh

- **"Port 5055 already in use"**: Cổng 5055 đã bị chiếm. Hãy tắt ứng dụng đang dùng cổng đó hoặc đổi cổng bằng lệnh `uv run uvicorn api.main:app --port 5056`.
- **"Can't connect to SurrealDB"**: Đảm bảo Docker của bạn đang chạy và SurrealDB đã được khởi động ở bước 3.
- **"npm: command not found"**: Bạn cần cài đặt Node.js từ [nodejs.org](https://nodejs.org/).

Chúc bạn có những trải nghiệm lập trình tuyệt vời cùng **DocuMind**! 🎉
