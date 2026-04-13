# Hướng dẫn cài đặt

Chọn lộ trình cài đặt dựa trên nhu cầu sử dụng của bạn.

## Lựa chọn nhanh: Lộ trình nào phù hợp?

### 🚀 Cài đặt dễ dàng nhất (Khuyên dùng)
**→ [Docker Compose](docker-compose.md)** - Thiết lập nhiều container, sẵn sàng cho sử dụng ổn định.
- ✅ Tất cả tính năng đều hoạt động tốt.
- ✅ Phân tách rõ ràng giữa các dịch vụ.
- ✅ Dễ dàng mở rộng.
- ✅ Hoạt động trên Mac, Windows, Linux.
- ⏱️ Chỉ mất 5 phút để khởi chạy.

---

### 👨‍💻 Dành cho nhà phát triển (Developers only)
**→ [Cài đặt từ nguồn](from-source.md)** - Sao chép mã nguồn và thiết lập thủ công.
- ✅ Kiểm soát hoàn toàn mã nguồn.
- ✅ Dễ dàng gỡ lỗi (debug).
- ✅ Có thể chỉnh sửa và kiểm tra tính năng mới.
- ⚠️ Yêu cầu Python 3.11+, Node.js.
- ⏱️ Mất khoảng 10 phút để cài đặt.

---

## Yêu cầu hệ thống

### Tối thiểu
- **RAM**: 4GB
- **Dung lượng đĩa**: 2GB cho ứng dụng + không gian lưu trữ tài liệu.
- **CPU**: Bất kỳ bộ vi xử lý hiện đại nào.
- **Mạng**: Internet (không bắt buộc nếu dùng hoàn toàn offline).

### Khuyên dùng
- **RAM**: 8GB+ (đặc biệt nếu chạy mô hình AI local).
- **Dung lượng đĩa**: 10GB+ cho tài liệu và các mô hình.
- **GPU**: Tùy chọn (tăng tốc đáng kể cho các mô hình AI local như ViT5/PhoBERT).

---

## Các lựa chọn nhà cung cấp AI (Provider)

### Dựa trên đám mây (Cloud)
- **OpenAI** - GPT-4o, nhanh và cực kỳ thông minh.
- **Google Gemini** - Đa phương thức, chi phí hợp lý.
- **ElevenLabs** - Tạo giọng nói (TTS) chất lượng cao nhất hiện nay.

**Ưu điểm**: Tốc độ nhanh, không tốn tài nguyên máy tính.
**Nhược điểm**: Tốn phí API, dữ liệu được gửi lên đám mây.

### Local (Miễn phí, Riêng tư tuyệt đối)
- **Ollama** - Chạy các mô hình mã nguồn mở ngay trên máy bạn.
- **Local (ViT5/PhoBERT)** - Mô hình tối ưu riêng cho tiếng Việt được tích hợp sẵn bởi Tân Đoàn.

**Ưu điểm**: Chi phí $0, quyền riêng tư 100%.
**Nhược điểm**: Tốc độ phụ thuộc vào phần cứng của bạn (CPU/GPU).

---

## Kiểm tra trước khi cài đặt

Trước khi bắt đầu, bạn cần có:
- [ ] **Docker** (khuyên dùng) hoặc **Node.js 18+** (nếu cài từ nguồn).
- [ ] **Khóa API** (OpenAI, Google...) HOẶC sẵn lòng sử dụng các mô hình local (Ollama).
- [ ] Ít nhất **4GB RAM** còn trống.
- [ ] **Kết nối Internet ổn định** (để tải hình ảnh Docker ban đầu).

---

## Sau khi cài đặt xong

Khi hệ thống đã khởi chạy thành công:
1. **Cấu hình mô hình** - Chọn nhà cung cấp AI trong phần Settings.
2. **Tạo Notebook đầu tiên** - Bắt đầu tổ chức nghiên cứu của bạn.
3. **Thêm nguồn tài liệu** - Tải lên PDF, liên kết web hoặc văn bản.
4. **Khám phá tính năng** - Chat, tìm kiếm, tóm tắt tự động.
5. **Đọc hướng dẫn đầy đủ** - [Hướng dẫn sử dụng](../3-USER-GUIDE/index.md).
