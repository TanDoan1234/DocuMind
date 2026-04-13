# Sửa lỗi nhanh - Top 11 Vấn đề & Giải pháp

Các vấn đề thường gặp với giải pháp xử lý chỉ trong 1 phút.

---

## #1: Lỗi "Cannot connect to server" (Không thể kết nối máy chủ)

**Triệu chứng:** Trình duyệt báo lỗi "Cannot connect to server" hoặc "Unable to reach API".

**Giải pháp (1 phút):**

```bash
# Bước 1: Kiểm tra xem API có đang chạy không
docker ps | grep documind

# Bước 2: Kiểm tra cổng 5055 có phản hồi không
curl http://localhost:5055/health
# Kết quả mong đợi: {"status":"healthy"}

# Nếu không hoạt động:
# Bước 3: Khởi động lại dịch vụ
docker compose restart
```

---

## #2: Lỗi "Invalid API key" hoặc "Models not showing"

**Triệu chứng:** Trong Settings → Models báo "No models available" (Không có mô hình nào).

**Giải pháp (1 phút):**

1. Vào **Settings → API Keys**.
2. Nếu chưa có, nhấp **Add Credential** để thêm khóa mới.
3. Nếu đã có, nhấp **Test Connection**.
4. Nếu kiểm tra thất bại, xóa đi và tạo lại với khóa chính xác.
5. Khi kiểm tra thành công, nhấp **Discover Models** → **Register Models**.

---

## #3: Lỗi "Port X already in use" (Trùng cổng)

**Triệu chứng:** Docker báo lỗi "Port 8502 is already allocated".

**Giải pháp (1 phút):**

- **Cách 1: Tắt ứng dụng đang dùng cổng đó.**
  ```bash
  lsof -i :8502  # Tìm ứng dụng
  kill -9 <PID>  # Tắt nó
  ```
- **Cách 2: Đổi cổng trong docker-compose.yml.**
  Sửa `- "8502:8502"` thành `- "8503:8502"`, sau đó truy cập qua `http://localhost:8503`.

---

## #4: Không tải được tệp hoặc định dạng không hỗ trợ

**Triệu chứng:** Tải lên thất bại hoặc báo "File format not supported".

**Giải pháp (1 phút):**
- Kiểm tra xem tệp có nằm trong danh sách hỗ trợ không: PDF, DOCX, PPTX, XLSX, MP3, WAV, MP4, AVI...
- Lưu ý: Không hỗ trợ tệp ảnh thuần túy (trừ PDF quét) và tệp lớn hơn 100MB. Hãy thử chia nhỏ tệp nếu quá lớn.

---

## #5: "Chat rất chậm"

**Triệu chứng:** Phản hồi của AI mất nhiều phút hoặc bị timeout.

**Giải pháp (1 phút):**
1. **Dùng mô hình rẻ/nhanh hơn**: Trong Settings → Models, chọn `gpt-4o-mini` hoặc dùng mô hình từ **Groq** (cực nhanh).
2. **Giảm ngữ cảnh (Context)**: Chỉ chọn những tài liệu thực sự cần thiết khi chat. Dùng chế độ "Summary Only" thay vì "Full Content".

---

## #6: "AI trả lời không hay/sai lệch"

**Triệu chứng:** Câu trả lời của AI quá chung chung hoặc không đúng trọng tâm.

**Giải pháp (1 phút):**
1. **Kiểm tra ngữ cảnh**: Nhấp vào "Select Sources" trong Chat, đảm bảo tài liệu liên quan đã được chọn và đặt ở mức "Full Content".
2. **Đặt câu hỏi cụ thể**: Đừng hỏi "Bạn nghĩ sao?", hãy hỏi "Dựa trên phần X của tài liệu Y, hãy tóm tắt Z...".
3. **Dùng mô hình mạnh hơn**: Thử `gpt-4o` hoặc `claude-3-5-sonnet`.

---

## #7: Tìm kiếm không có kết quả

**Triệu chứng:** Tìm kiếm không ra gì dù tài liệu có tồn tại.

**Giải pháp (1 phút):**
- Thử đổi chế độ tìm kiếm: Nếu dùng **Keywords** (Từ khóa) không ra, hãy thử **Vector Search** (Tìm kiếm theo ý tưởng/ngữ nghĩa).
- Đảm bảo tài liệu ở trạng thái màu xanh "Ready".

---

## #8: Tạo Podcast thất bại

**Triệu chứng:** Báo lỗi "Podcast generation failed".

**Giải pháp (1 phút):**
1. Đảm bảo bạn đã chọn ít nhất 1-2 nguồn tài liệu có đủ thông tin.
2. Thử lại sau 30 giây (có thể do lỗi mạng tạm thời).
3. Thử đổi nhà cung cấp giọng nói (TTS): Chọn "Google" hoặc "OpenAI" thay vì "ElevenLabs" nếu bạn đã hết hạn mức.

---

## Danh sách kiểm tra nhanh khi gặp sự cố:

- [ ] **Khởi động lại:** `docker compose restart`
- [ ] **Xem logs:** `docker compose logs --tail=50`
- [ ] **Kiểm tra .env:** Khóa mã hóa đã đặt chưa? API key đúng chưa?
- [ ] **Kiểm tra tài nguyên:** Máy tính có bị quá tải RAM/CPU không?
- [ ] **Làm sạch Docker:** `docker system prune` để giải phóng dung lượng đĩa.
