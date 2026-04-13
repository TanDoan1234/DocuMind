# Biến đổi (Transformations) - Xử lý tài liệu hàng loạt

Tính năng Biến đổi cho phép bạn áp dụng cùng một kiểu phân tích cho nhiều nguồn tài liệu cùng một lúc. Thay vì đặt cùng một câu hỏi lặp đi lặp lại, hãy định nghĩa một biểu mẫu (template) và chạy nó trên toàn bộ nội dung của bạn.

---

## Khi nào nên sử dụng Biến đổi?

| Nên dùng Biến đổi khi | Nên dùng Chat khi |
|-------------------------|----------------------|
| Cần phân tích giống nhau trên nhiều file | Chỉ có câu hỏi nhất thời |
| Cần kết quả có định dạng thống nhất | Muốn thảo luận theo kiểu khám phá |
| Xử lý hàng loạt | Cần đặt các câu hỏi tiếp nối |
| Tạo các ghi chú có cấu trúc | Ngữ cảnh thay đổi sau mỗi câu hỏi |

**Ví dụ**: Bạn có 10 bài báo và muốn có bản tóm tắt cho từng bài. Tính năng Biến đổi sẽ thực hiện việc này chỉ trong một thao tác.

---

## Các mẫu Biến đổi tích hợp sẵn

DocuMind bao gồm các mẫu sẵn sàng sử dụng ngay:

### Tóm tắt (Summary)
- **Chức năng**: Tạo bản tổng quan khoảng 200-300 từ.
- **Kết quả**: Các điểm chính, lập luận chủ đạo và kết luận.

### Ý tưởng chính (Key Concepts)
- **Chức năng**: Trích xuất các ý tưởng và thuật ngữ quan trọng.
- **Kết quả**: Danh sách các khái niệm kèm lời giải thích.

### Phương pháp luận (Methodology)
- **Chức năng**: Trích xuất cách tiếp cận nghiên cứu.
- **Kết quả**: Cách thức nghiên cứu được thực hiện.

---

## Tạo mẫu Biến đổi tùy chỉnh

### Các bước thực hiện:
1. Vào trang **Transformations**.
2. Nhấp chọn **Create New**.
3. Nhập tên (ví dụ: "Phân tích bài báo khoa học").
4. Viết nội dung mẫu (Prompt template):
   "Hãy phân tích bài báo này và trích xuất:
   1. **Câu hỏi nghiên cứu**: Vấn đề nào được giải quyết?
   2. **Phương pháp**: Họ đã kiểm chứng như thế nào?
   3. **Kết quả chính**: Những gì họ đã khám phá ra?
   Hãy viết cụ thể và trích dẫn số trang nếu có thể."
5. Nhấp **Save**.

---

## Áp dụng Biến đổi

### Cho một nguồn duy nhất:
- Trong bảng **Sources**, nhấp vào menu (⋮) của nguồn tài liệu.
- Chọn **Transform**.
- Chọn mẫu bạn muốn và nhấp **Apply**.

### Cho nhiều nguồn (Xử lý hàng loạt):
- Vào trang **Transformations**.
- Chọn mẫu bạn muốn dùng.
- Tích chọn nhiều nguồn tài liệu cùng lúc.
- Nhấp **Apply to Selected**. Hệ thống sẽ xử lý song song và tạo ra một ghi chú riêng cho từng nguồn.

---

## Những lưu ý quan trọng
1. **Thiết kế mẫu chi tiết**: Prompt càng cụ thể thì kết quả càng chất lượng.
2. **Yêu cầu định dạng**: Nên yêu cầu AI trả về dưới dạng danh sách hoặc tiêu đề rõ ràng.
3. **Kiểm tra trước**: Hãy chạy thử trên 1 tài liệu trước khi áp dụng cho hàng loạt.
4. **Kết quả đầu ra**: Các kết quả sau khi biến đổi sẽ tự động xuất hiện trong phần **Ghi chú (Notes)** của notebook.

DocuMind biến các phân tích lặp đi lặp lại thành các thao tác chỉ với một cú nhấp chuột. Hãy định nghĩa một lần và áp dụng mãi mãi.
