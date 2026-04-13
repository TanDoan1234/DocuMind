# Notebook, Nguồn tài liệu và Ghi chú - Mô hình Thùng chứa

DocuMind tổ chức nghiên cứu của bạn theo ba lớp kết nối chặt chẽ với nhau. Hiểu rõ hệ thống phân cấp này là chìa khóa để sử dụng hệ thống một cách hiệu quả nhất.

## Cấu trúc Ba lớp

```
┌─────────────────────────────────────┐
│         NOTEBOOK (Thùng chứa)       │
│     "Nghiên cứu AI Safety 2026"     │
├─────────────────────────────────────┤
│                                     │
│  NGUỒN TÀI LIỆU (Nguyên liệu thô)   │
│  ├─ safety_paper.pdf                │
│  ├─ alignment_video.mp4             │
│  └─ prompt_injection_article.html   │
│                                     │
│  GHI CHÚ (Kiến thức đã xử lý)       │
│  ├─ Tóm tắt AI (tự động tạo)        │
│  ├─ Khái niệm chính (biến đổi)      │
│  ├─ Ghi chú nghiên cứu (thủ công)   │
│  └─ Ý tưởng từ Chat (lưu từ chat)   │
│                                     │
└─────────────────────────────────────┘
```

---

## 1. NOTEBOOK - Thùng chứa Nghiên cứu

### Notebook là gì?

Một **notebook** là một *thùng chứa có phạm vi cụ thể* cho một dự án nghiên cứu hoặc một chủ đề. Đây là không gian làm việc nghiên cứu của bạn.

Hãy tưởng tượng nó giống như một cuốn sổ ghi chép vật lý: mọi thứ bên trong đều xoay quanh cùng một chủ đề, chia sẻ cùng một ngữ cảnh và hướng tới cùng một mục tiêu.

### Tại sao cấu trúc này quan trọng?

- **Sự cô lập**: Mỗi notebook hoàn toàn tách biệt. Các nguồn tài liệu trong Notebook A sẽ không bao giờ xuất hiện trong Notebook B.
- **Ngữ cảnh chung**: Tất cả các nguồn và ghi chú trong một notebook đều được thừa hưởng ngữ cảnh của notebook đó (như tên và mô tả dự án).
- **Dự án song song**: Bạn có thể chạy 10 notebook cùng lúc cho 10 đề tài khác nhau mà không bị nhầm lẫn.

---

## 2. NGUỒN TÀI LIỆU (SOURCES) - Nguyên liệu thô

### Nguồn tài liệu là gì?

Một **nguồn** là một *mảnh vật liệu đầu vào duy nhất* — nội dung thô mà bạn đưa vào hệ thống. Các nguồn không bao giờ thay đổi nội dung; chúng chỉ được xử lý, lập chỉ mục và lưu trữ.

### Các loại nguồn hỗ trợ:
- **PDF**: Bài báo khoa học, báo cáo, tài liệu.
- **Liên kết Web**: Bài viết, blog, trang web.
- **Tệp âm thanh**: Podcast, phỏng vấn, bài giảng.
- **Tệp video**: Video hướng dẫn, thuyết trình.
- **Văn bản thuần túy**: Bạn có thể dán nội dung trực tiếp.

### Quy trình xử lý nguồn:
1. **Trích xuất**: Lấy văn bản từ tệp/URL (bao gồm cả OCR cho ảnh trong PDF).
2. **Chia nhỏ (Chunking)**: Chia văn bản dài thành các đoạn nhỏ để AI dễ xử lý.
3. **Nhúng (Embedding)**: Tạo các vector ngữ nghĩa để máy tính "hiểu" được ý nghĩa nội dung.
4. **Lưu trữ**: Lưu vào cơ sở dữ liệu để sẵn sàng tìm kiếm.

---

## 3. GHI CHÚ (NOTES) - Kiến thức đã xử lý

### Ghi chú là gì?

Một **ghi chú** là một *kết quả đã qua xử lý* — những thứ do bạn hoặc AI tạo ra dựa trên các nguồn tài liệu. Ghi chú chính là "thành quả" công việc của bạn.

### Các loại ghi chú:
- **Ghi chú thủ công**: Bạn tự viết dựa trên suy nghĩ và phân tích cá nhân.
- **Tạo từ AI (Transformations)**: Tóm tắt, trích xuất concepts, phân tích phương pháp luận.
- **Lưu từ hội thoại Chat**: Những câu trả lời hay của AI mà bạn muốn giữ lại vĩnh viễn.

---

## Luồng dữ liệu: Chúng kết nối như thế nào?

1. **BẠN** tạo một **Notebook** (ví dụ: "Nghiên cứu về VinFast").
2. **BẠN** thêm các **Nguồn tài liệu** (Báo cáo tài chính, video đánh giá xe...).
3. **HỆ THỐNG** tự động trích xuất và lập chỉ mục.
4. **BẠN** thực hiện **Chat** hoặc **Biến đổi** tài liệu.
5. **AI** tạo ra các kết quả, bạn lưu chúng thành các **Ghi chú**.
6. **BẠN** có thể dùng toàn bộ nguồn + ghi chú để tạo **Podcast** nghe tóm tắt cuối ngày.

---

## Tóm tắt Mô hình

| Khái niệm | Mục đích | Vòng đời | Phạm vi |
|---------|---------|-----------|-------|
| **Notebook** | Thùng chứa + Ngữ cảnh | Tạo một lần, cấu hình | Toàn bộ nguồn + ghi chú |
| **Nguồn tài liệu** | Nguyên liệu thô | Thêm → Xử lý → Lưu trữ | Nằm trong một notebook |
| **Ghi chú** | Thành quả xử lý | Tạo → Chỉnh sửa → Chia sẻ | Nằm trong một notebook |

Mô hình ba lớp của **DocuMind** giúp bạn tổ chức dữ liệu khoa học, bảo mật và cực kỳ linh hoạt cho mọi nhu cầu nghiên cứu.
