# Xử lý sự cố - Hướng dẫn giải quyết vấn đề

Bạn đang gặp lỗi? Hãy sử dụng hướng dẫn này để chẩn đoán và khắc phục các vấn đề thường gặp.

---

## Cách sử dụng hướng dẫn này

**Bước 1: Xác định vấn đề của bạn**
- Triệu chứng là gì? (Thông báo lỗi, hành vi lạ, hay tính năng không hoạt động?)
- Xảy ra khi nào? (Trong khi cài đặt, đang sử dụng, hay sau khi cập nhật?)

**Bước 2: Tìm hướng dẫn phù hợp**
- Xem danh sách triệu chứng bên dưới để tìm mục tương ứng.

**Bước 3: Thực hiện theo các bước**
- Mỗi mục đều có các bước chẩn đoán và giải pháp cụ thể.

---

## Bản đồ vấn đề nhanh

### Trong khi cài đặt
- **Docker không khởi động được** → [Sửa lỗi nhanh](quick-fixes.md)
- **Cổng (Port) đã bị sử dụng** → [Sửa lỗi nhanh](quick-fixes.md#3-port-x-already-in-use)
- **Lỗi Permission denied** → Thử chạy lệnh với `sudo`.

### Khi khởi động
- **API không khởi động** → Kiểm tra logs: `docker compose logs api`.
- **Giao diện (Frontend) không tải được** → [Lỗi kết nối](connection-issues.md).

### Cài đặt / Cấu hình
- **Mô hình AI không hiển thị** → [Lỗi AI & Chat](ai-chat-issues.md).
- **Lỗi "Invalid API key"** → Kiểm tra lại mã khóa API của bạn trong Settings.

### Sử dụng tính năng
- **Chat không hoạt động** → Kiểm tra kết nối Internet và Provider.
- **Tạo Podcast thất bại** → Kiểm tra lại cấu hình ElevenLabs hoặc OpenAI TTS.

---

## Chẩn đoán nhanh

**Khi có gì đó không hoạt động, hãy kiểm tra:**

- [ ] Các dịch vụ có đang chạy không: `docker ps`
- [ ] Kiểm tra nhật ký lỗi (logs): `docker compose logs api`
- [ ] Kiểm tra cổng kết nối: Cổng 5055 (API) và 8502 (Frontend) có bị chặn không.
- [ ] Thử khởi động lại toàn bộ: `docker compose restart`
- [ ] Đảm bảo tường lửa hoặc phần mềm diệt virus không chặn ứng dụng.

---

## Các giải pháp phổ biến

**Dịch vụ không khởi động?**
```bash
# Kiểm tra logs
docker compose logs

# Khởi động lại tất cả
docker compose restart

# Cách cuối cùng: build lại từ đầu
docker compose down
docker compose up --build
```

**Xung đột cổng (Port)?**
```bash
# Tìm xem ứng dụng nào đang dùng cổng 5055
lsof -i :5055
# Tắt ứng dụng đó hoặc đổi cổng trong docker-compose.yml
```

**Chi phí API quá cao?**
```bash
# Chuyển sang mô hình rẻ hơn (ví dụ: gpt-4o-mini của OpenAI)
# Hoặc sử dụng Ollama (Miễn phí)
```

---

## Vẫn còn thắc mắc?

**Trước khi yêu cầu hỗ trợ:**
1. Đọc kỹ hướng dẫn tương ứng.
2. Thử tất cả các bước khắc phục ở trên.
3. Kiểm tra nhật ký lỗi (logs).
4. Khởi động lại dịch vụ.
