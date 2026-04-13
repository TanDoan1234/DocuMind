# Hướng dẫn nhanh - Chạy Local & Riêng tư (5 phút)

Khởi động DocuMind với **AI chạy local 100%**. Không cần API key đám mây, hoàn toàn riêng tư và bảo mật.

## Điều kiện tiên quyết

1. **Docker Desktop** đã được cài đặt.
2. **Mô hình AI Local** - Chọn một trong hai cách:
   - **Ollama** (Khuyên dùng): [Tải tại đây](https://ollama.ai/)
   - **Mô hình Tiếng Việt tích hợp sẵn** (ViT5/PhoBERT): Đã có sẵn trong DocuMind cho người dùng Việt Nam.

---

## Bước 1: Chọn cách thiết lập (1 phút)

### Máy cá nhân (Chạy cùng máy)
Mọi thứ chạy trên máy tính của bạn. Khuyên dùng để thử nghiệm và học tập.

### Máy chủ từ xa (NAS, Raspberry Pi, Cloud VM)
Chạy trên một máy tính khác và truy cập từ xa. Cần cấu hình mạng nội bộ.

---

## Bước 2: Tạo tệp cấu hình (1 phút)

Tạo một thư mục mới tên là `documind-local` và thêm tệp sau:

**docker-compose.yml**:
```yaml
services:
  surrealdb:
    image: surrealdb/surrealdb:v2
    command: start --user root --pass password --bind 0.0.0.0:8000 rocksdb:/mydata/mydatabase.db
    ports:
      - "8000:8000"
    volumes:
      - ./surreal_data:/mydata

  documind:
    image: tandoan/documind:latest
    pull_policy: always
    ports:
      - "8502:8502"  # Giao diện Web
      - "5055:5055"  # API
    environment:
      - OPEN_NOTEBOOK_ENCRYPTION_KEY=thay-bang-mot-chuoi-bi-mat
      - SURREAL_URL=ws://surrealdb:8000/rpc
      - SURREAL_USER=root
      - SURREAL_PASSWORD=password
      - SURREAL_NAMESPACE=documind
      - SURREAL_DATABASE=documind
    volumes:
      - ./notebook_data:/app/data
    depends_on:
      - surrealdb
    restart: always

  ollama:
    image: ollama/ollama:latest
    ports:
      - "11434:11434"
    volumes:
      - ./ollama_models:/root/.ollama
    restart: always
```

---

## Bước 3: Khởi chạy dịch vụ (1 phút)

Mở terminal trong thư mục `documind-local` và chạy:

```bash
docker compose up -d
```

---

## Bước 4: Thiết lập AI Tiếng Việt (Dành cho người Việt)

Trong bản DocuMind này, Tân Đoàn đã tích hợp sẵn các mô hình tối ưu cho Tiếng Việt:

1. **ViT5**: Chuyên dùng để tóm tắt văn bản tiếng Việt.
2. **PhoBERT**: Chuyên dùng cho hỏi đáp (QA) và xử lý ngôn ngữ tự nhiên.

Bạn không cần tải thêm gì cả, các mô hình này đã được đăng ký sẵn trong hệ thống dưới tên nhà cung cấp **"Local"**.

---

## Bước 5: Cấu hình trên giao diện (2 phút)

1. Mở trình duyệt: `http://localhost:8502`
2. Vào **Settings** → **API Keys**.
3. Chọn **Local** (nếu dùng ViT5/PhoBERT) hoặc **Ollama**.
4. Nhấp **Save** và **Register Models**.
5. Vào **Settings** → **Models** để chọn mô hình bạn muốn dùng mặc định.

---

## Lợi ích của việc chạy Local

- **Không tốn phí API** - Miễn phí mãi mãi.
- **Không cần Internet** - Khả năng làm việc offline thực sự.
- **Quyền riêng tư tối đa** - Dữ liệu nghiên cứu không bao giờ rời khỏi máy của bạn.
- **Tối ưu Tiếng Việt** - Sử dụng các mô hình chuyên biệt cho ngôn ngữ Việt Nam.

---

## Các bước tiếp theo

1. **Thêm tài liệu của bạn**: PDF, Word, link web (xem Hướng dẫn sử dụng).
2. **Chat với tài liệu**: Sử dụng mô hình PhoBERT để hỏi đáp cực chuẩn.
3. **Tóm tắt thông minh**: Sử dụng ViT5 để trích xuất Insights từ các tài liệu dài.
