# Các câu hỏi thường gặp (FAQ)

Các câu hỏi phổ biến về cách sử dụng, cấu hình và mẹo tối ưu DocuMind.

---

## Câu hỏi chung

### DocuMind là gì?
DocuMind là một giải pháp thay thế mã nguồn mở, tập trung vào quyền riêng tư cho Notebook LM của Google. Nó cho phép bạn:
- Tạo và quản lý các notebook nghiên cứu chuyên sâu.
- Chat với tài liệu bằng AI.
- Tạo Podcast từ nội dung của bạn.
- Tìm kiếm ngữ nghĩa trên toàn bộ nguồn tài liệu.

### DocuMind khác gì với Google Notebook LM?
**Quyền riêng tư**: Dữ liệu của bạn mặc định nằm tại máy chủ local.
**Linh hoạt**: Hỗ trợ nhiều nhà cung cấp AI (OpenAI, Google, Ollama, các mô hình Tiếng Việt như ViT5/PhoBERT).
**Khả năng tùy biến**: Là mã nguồn mở, bạn hoàn toàn có thể chỉnh sửa và mở rộng tính năng.

### Tôi có thể dùng DocuMind Offline không?
**Có một phần**: Ứng dụng chạy trên máy bạn, nhưng vẫn cần internet để gọi API các mô hình AI đám mây.
**Hoàn toàn Offline**: Bạn có thể làm được nếu sử dụng các mô hình Local (như Ollama, ViT5, PhoBERT).

### DocuMind hỗ trợ những định dạng nào?
- **Văn bản**: PDF, DOCX, TXT, Markdown.
- **Web**: URL trang web, Video YouTube.
- **Đa phương tiện**: MP3, WAV, MP4...
- **Dữ liệu**: CSV, tệp mã nguồn (Code).

---

## Mô hình AI & Nhà cung cấp

### Nên chọn nhà cung cấp AI nào?
- **Cho người mới**: OpenAI (ổn định, dễ dùng).
- **Cho quyền riêng tư**: Các mô hình Local (Ollama) hoặc mô hình Tiếng Việt tích hợp sẵn.
- **Cho tiết kiệm**: Google Gemini (có gói miễn phí) hoặc Groq (cực nhanh).
- **Cho ngữ cảnh dài**: Google Gemini (hỗ trợ tới 2 triệu tokens).

### Tôi có thể dùng nhiều nhà cung cấp cùng lúc không?
**Có**: Bạn có thể cấu hình OpenAI để Chat, Google để trích xuất thông tin, và ElevenLabs để tạo giọng nói Podcast.

### Làm sao để tiết kiệm chi phí AI?
- Sử dụng các mô hình nhỏ như `gpt-4o-mini` cho các tác vụ đơn giản.
- Tận dụng các mô hình Local miễn phí khi có thể.
- Đặt câu hỏi cụ thể để AI không phải trả lời quá dài.

---

## Quản lý dữ liệu

### Dữ liệu của tôi được lưu ở đâu?
Mặc định mọi thứ được lưu tại máy bạn:
- Cơ sở dữ liệu: Trong thư mục `surreal_data/`.
- Tài liệu tải lên: Trong thư mục `notebook_data/`.
- Podcast: Trong thư mục `notebook_data/podcasts/`.

### Làm cách nào để sao lưu dữ liệu?
Bạn chỉ cần nén (zip) và lưu trữ hai thư mục `surreal_data/` và `notebook_data/` là có thể khôi phục lại toàn bộ dữ liệu khi cần.

---

## Yêu cầu hệ thống

**Tối thiểu**:
- 4GB RAM
- 2 CPU cores
- 10GB dung lượng trống

**Khuyên dùng** (để chạy mượt mà các mô hình Local):
- 16GB+ RAM
- GPU (Card đồ họa rời)
- Ổ cứng SSD
