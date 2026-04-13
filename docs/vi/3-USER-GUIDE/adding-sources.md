# Thêm nguồn tài liệu - Đưa nội dung vào Notebook của bạn

Nguồn tài liệu (Sources) là nguyên liệu thô cho nghiên cứu của bạn. Hướng dẫn này bao gồm cách thêm các loại nội dung khác nhau vào DocuMind.

---

## Bắt đầu nhanh: Thêm nguồn đầu tiên của bạn

### Lựa chọn 1: Tải lên một tập tin (PDF, Word, v.v.)

```
1. Trong notebook của bạn, nhấp vào "Add Source" (Thêm nguồn)
2. Chọn "Upload File" (Tải tệp lên)
3. Chọn một tệp từ máy tính của bạn
4. Nhấp vào "Upload" (Tải lên)
5. Đợi 30-60 giây để hệ thống xử lý
6. Xong! Nguồn sẽ xuất hiện trong notebook của bạn
```

### Lựa chọn 2: Thêm liên kết Web (URL)

```
1. Nhấp vào "Add Source"
2. Chọn "Web Link" (Liên kết Web)
3. Dán URL: https://example.com/bai-viet
4. Nhấp vào "Add" (Thêm)
5. Đợi xử lý (thường nhanh hơn tải tệp lên)
6. Xong!
```

### Lựa chọn 3: Dán văn bản trực tiếp

```
1. Nhấp vào "Add Source"
2. Chọn "Text" (Văn bản)
3. Dán hoặc nhập nội dung của bạn
4. Nhấp vào "Save" (Lưu)
5. Xong! Nội dung có sẵn ngay lập tức
```

---

## Các loại tệp được hỗ trợ

### Tài liệu văn bản
- **PDF** (.pdf) — Hỗ trợ tốt nhất, bao gồm cả PDF dạng ảnh quét (scanned) nhờ công nghệ OCR.
- **Word** (.docx, .doc) — Hỗ trợ đầy đủ.
- **PowerPoint** (.pptx) — Các trang slide được chuyển đổi thành văn bản.
- **Excel** (.xlsx, .xls) — Dữ liệu bảng tính.
- **EPUB** (.epub) — Tệp sách điện tử.
- **Markdown** (.md, .txt) — Các định dạng văn bản thuần túy.
- **HTML** (.html, .htm) — Các tệp trang web.

**Giới hạn kích thước tệp:** Lên đến ~100MB (tùy thuộc vào cấu hình hệ thống).

**Thời gian xử lý:** Từ 10 giây đến 2 phút (tùy thuộc vào độ dài và loại tệp).

### Âm thanh & Video
- **Âm thanh**: MP3, WAV, M4A, OGG, FLAC.
- **Video**: MP4, AVI, MOV, MKV, WebM.
- **YouTube**: Hỗ trợ trực tiếp thông qua URL.
- **Podcasts**: Hỗ trợ URL của RSS feed.

**Chuyển đổi văn bản tự động**: Âm thanh/video sẽ được tự động chuyển thành văn bản. Điều này yêu cầu bạn phải kích hoạt tính năng Speech-to-Text (Chuyển giọng nói thành văn bản) trong phần cài đặt.

### Nội dung Web
- **Bài viết**: Bài đăng blog, tin tức, Medium.
- **YouTube**: Video đơn lẻ hoặc danh sách phát (playlist).
- **PDF trực tuyến**: Các liên kết dẫn trực tiếp đến tệp PDF.

---

## Điều gì xảy ra khi bạn thêm một nguồn?

Hệ thống sẽ tự động thực hiện bốn bước sau:

```
1. TRÍCH XUẤT VĂN BẢN (EXTRACT TEXT)
   Tệp/URL → Văn bản có thể đọc được
   (PDF dạng ảnh sẽ được chạy OCR)
   (Video/Âm thanh sẽ được chuyển thành văn bản nếu kích hoạt)

2. CHIA NHỎ NỘI DUNG (BREAK INTO CHUNKS)
   Văn bản dài → Các đoạn nhỏ khoảng 500 từ
   (Giúp việc tìm kiếm chính xác từng phần thay vì cả tài liệu)

3. TẠO EMBEDDINGS (CREATE EMBEDDINGS)
   Mỗi đoạn nhỏ → Đại diện Vector
   (Cho phép tìm kiếm theo ngữ nghĩa và khái niệm)

4. CHỈ MỤC & LƯU TRỮ (INDEX & STORE)
   Mọi thứ → Cơ sở dữ liệu
   (Sẵn sàng để tìm kiếm và truy xuất)
```

---

## Quản lý nguồn tài liệu của bạn

### Xem chi tiết nguồn

```
Nhấp vào một nguồn → Bạn sẽ thấy:
  - Tên tệp/Tiêu đề gốc
  - Thời gian thêm vào
  - Kích thước và định dạng
  - Trạng thái xử lý (Processing status)
  - Số lượng phân đoạn (Number of chunks)
```

### Tổ chức với Metadata

Bạn có thể thêm thông tin cho mỗi nguồn:
- **Tiêu đề (Title)**: Đặt tên mô tả rõ ràng hơn tên tệp gốc.
- **Thẻ (Tags)**: Nhãn phân loại (ví dụ: "nghiên cứu chính", "tổng quan", "phân tích đối thủ").
- **Mô tả (Description)**: Một vài dòng tóm tắt nội dung bên trong.

---

## Quản lý Ngữ cảnh (Context Management)

Bạn có quyền kiểm soát cách AI truy cập các nguồn:

### Ba mức độ (dành cho Chat)

**Full Content (Toàn bộ nội dung):**
- AI nhìn thấy: Toàn bộ văn bản của nguồn.
- Sử dụng khi: Cần phân tích chi tiết, trích dẫn chính xác.

**Summary Only (Chỉ tóm tắt):**
- AI nhìn thấy: Bản tóm tắt do AI tạo ra (không phải toàn văn).
- Sử dụng khi: Tài liệu chỉ mang tính chất tham khảo nền tảng.

**Not in Context (Không nằm trong ngữ cảnh):**
- AI nhìn thấy: Không gì cả (bị loại trừ).
- Sử dụng khi: Tài liệu nhạy cảm hoặc không liên quan đến cuộc hội thoại hiện tại.

---

## Các lỗi thường gặp và Cách xử lý

- **"Unsupported file type" (Loại tệp không được hỗ trợ)**: Chuyển đổi tệp sang định dạng được hỗ trợ (PDF cho tài liệu, MP3 cho âm thanh).
- **"Processing timeout" (Hết thời gian xử lý)**: Tệp quá lớn (>100MB) hoặc video quá dài. Hãy thử chia nhỏ tệp.
- **"Web link won't extract" (Không thể trích xuất link web)**: Trang web chặn truy cập tự động. Hãy sao chép văn bản bằng tay và dán vào phần "Text".

---

## Mẹo để có kết quả tốt nhất

- **Đối với tệp PDF**: PDF dạng văn bản số (digital) hoạt động tốt nhất. PDF dạng ảnh quét sẽ mất nhiều thời gian xử lý hơn.
- **Đối với bài viết Web**: Sử dụng URL đầy đủ. Nếu trang web có quá nhiều quảng cáo/popup làm lỗi trích xuất, hãy dùng cách Copy-Paste văn bản.
- **Đối với tổ chức**: Đặt tên nguồn rõ ràng (đừng để "document_2.pdf") và thêm thẻ (tags) ngay sau khi tải lên để dễ quản lý sau này.
