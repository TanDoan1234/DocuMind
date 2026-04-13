# Tổng quan Giao diện - Cách sử dụng DocuMind

DocuMind sử dụng bố cục 3 bảng (panels) gọn gàng và hiện đại. Hướng dẫn này sẽ chỉ cho bạn vị trí của từng tính năng.

---

## Bố cục Giao diện chính

```
┌─────────────────────────────────────────────────────────────┐
│  [Logo]  Notebooks  Search  Podcasts  Models  Settings      │
├──────────────┬──────────────┬───────────────────────────────┤
│              │              │                               │
│ NGUỒN TÀI LIỆU│   GHI CHÚ    │           CHAT                │
│ (SOURCES)    │   (NOTES)    │                               │
│              │              │                               │
│  Tệp của bạn │  Ý tưởng &   │   Hỏi AI về                   │
│  PDF, URL    │  tóm tắt     │   các tài liệu                │
│              │              │                               │
│  [+ Thêm]    │  [+ Viết]    │   [Nhập nội dung...]          │
│              │              │                               │
└──────────────┴──────────────┴───────────────────────────────┘
```

---

## Thanh điều hướng (Navigation Bar)

Thanh menu phía trên cho phép bạn di chuyển giữa các khu vực chính:
- **Notebooks**: Không gian làm việc, quản lý các dự án nghiên cứu của bạn.
- **Search (Tìm kiếm)**: Đặt câu hỏi hoặc tìm kiếm từ khóa trên toàn bộ các notebook.
- **Podcasts**: Quản lý hồ sơ người nói và tạo các tập Podcast âm thanh.
- **Models**: Cấu hình các nhà cung cấp AI (OpenAI, Google, Ollama...) và chọn mô hình mặc định.
- **Settings**: Cài đặt các tùy chọn hệ thống (xử lý tệp, ngôn ngữ YouTube...).

---

## Các bảng chức năng (Inside a Notebook)

### 1. Bảng bên trái: Nguồn tài liệu (Sources)
Nơi lưu trữ và quản lý các nguyên liệu thô cho nghiên cứu của bạn.
- **Chỉ báo Ngữ cảnh (Context)**: AI có thể nhìn thấy gì?
  - 🟢 **Full Content**: AI xem được toàn bộ nội dung.
  - 🟡 **Summary Only**: AI chỉ xem được bản tóm tắt.
  - ⛔ **Not in Context**: AI không được quyền xem tài liệu này.

### 2. Bảng ở giữa: Ghi chú (Notes)
Nơi lưu trữ các phân tích cá nhân và các sản phẩm do AI tạo ra.
- **Biểu tượng 📝**: Ghi chú do bạn tự viết tay.
- **Biểu tượng 🤖**: Ghi chú do AI tạo ra (từ Chat hoặc Biến đổi).

### 3. Bảng bên phải: Chat & Podcasts
Không gian tương tác trực tiếp với AI.
- **Chat**: Đặt câu hỏi và lưu lại các câu trả lời hay thành Ghi chú.
- **Podcasts**: Thiết lập kịch bản và người nói để xuất bản các tập âm thanh.

---

## Các thao tác thường gặp

1. **Tạo Notebook**: Click `+ New Notebook` ở trang Notebooks.
2. **Thêm tài liệu**: Click `+ Add Source` trong một notebook, chọn tệp PDF, dán link Web hoặc YouTube.
3. **Đặt câu hỏi**: Nhập nội dung vào ô Chat ở bảng bên phải.
4. **Lưu kết quả**: Khi AI trả lời hay, nhấp `Save as Note` để lưu kết quả vào bảng Ghi chú.
5. **Đổi mức độ ngữ cảnh**: Nhấp vào tiêu đề một tài liệu để chọn giữa Full Content / Summary / Exclude.

**DocuMind** được thiết kế để bạn tập trung tối đa vào việc nghiên cứu. Hãy bắt đầu bằng cách thêm nguồn tài liệu đầu tiên của bạn!
