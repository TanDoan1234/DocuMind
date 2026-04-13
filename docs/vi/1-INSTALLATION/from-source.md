# Cài đặt từ Mã nguồn (From Source)

Tải mã nguồn và chạy trực tiếp trên máy cục bộ. **Dành cho các nhà phát triển và người muốn đóng góp cho dự án.**

## Điều kiện tiên quyết

- **Python 3.11+**
- **Node.js 18+**
- **Git**
- **Docker** (để chạy SurrealDB)
- **uv** (Trình quản lý gói Python): `curl -LsSf https://astral.sh/uv/install.sh | sh`
- Khóa API (OpenAI, Google...) hoặc sử dụng Ollama cho Local AI miễn phí.

---

## Thiết lập nhanh (10 phút)

### 1. Tải Mã nguồn

```bash
git clone https://github.com/tandoan/documind.git
cd documind
```

### 2. Cài đặt các thư viện Python
Sử dụng `uv` để đồng bộ và cài đặt nhanh:

```bash
uv sync
uv pip install python-magic
```

**Tùy chọn: Sử dụng Conda (Nếu bạn thích)**
```bash
conda create -n documind python=3.11 -y
conda activate documind
conda install -c conda-forge uv nodejs -y
uv sync
```

### 3. Khởi chạy Cơ sở dữ liệu (SurrealDB)
Mở một Terminal mới (Terminal 1) và chạy:

```bash
make database
# Hoặc: docker compose up surrealdb
```

### 4. Thiết lập Biến môi trường
Sao chép tệp mẫu và chỉnh sửa:

```bash
cp .env.example .env
# Mở .env và đặt khóa mã hóa:
# OPEN_NOTEBOOK_ENCRYPTION_KEY=chuoi-bi-mat-cua-ban
```

### 5. Khởi chạy API Backend
Mở Terminal mới (Terminal 2) và chạy:

```bash
make api
# Hoặc: uv run --env-file .env uvicorn api.main:app --host 0.0.0.0 --port 5055
```

### 6. Khởi chạy Frontend
Mở Terminal mới (Terminal 3) và chạy:

```bash
cd frontend && npm install && npm run dev
```

---

## Địa chỉ truy cập mặc định

- **Giao diện người dùng (Frontend)**: http://localhost:3000
- **Tài liệu API (Swagger)**: http://localhost:5055/docs
- **Cơ sở dữ liệu**: http://localhost:8000

---

## Quy trình Phát triển

### Kiểm tra chất lượng mã (Linting & Formatting)
```bash
# Định dạng và kiểm tra lỗi Python
make ruff

# Kiểm tra kiểu dữ liệu (Type checking)
make lint
```

### Chạy kiểm thử (Testing)
```bash
uv run pytest tests/
```

### Lệnh thường dùng
- **Khởi chạy tất cả**: `make start-all`
- **Dọn dẹp hệ thống**: `make clean`

---

## Xử lý sự cố nhanh

- **Lỗi phiên bản Python**: Hãy chắc chắn bạn đang dùng Python 3.11 trở lên. Dùng `python --version` để kiểm tra.
- **Lỗi kết nối CSDL**: Kiểm tra xem container SurrealDB đã chạy chưa bằng lệnh `docker ps`.
- **Lỗi cổng 5055 bị chiếm dụng**: Bạn có thể đổi sang cổng khác bằng tham số `--port 5056` khi chạy lệnh khởi chạy API.

Chúc bạn có những trải nghiệm phát triển tuyệt vời cùng **DocuMind**!
