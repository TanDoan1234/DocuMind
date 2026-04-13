# Các khái niệm cốt lõi - Hiểu về mô hình tư duy của hệ thống

Trước khi đi sâu vào cách sử dụng DocuMind, điều quan trọng là phải hiểu **hệ thống "tư duy" như thế nào**. Những khái niệm cốt lõi này giải thích lý do đằng sau các thiết kế của chúng tôi.

## 5 Mô hình tư duy cốt lõi

### 1. [Notebook, Nguồn tài liệu và Ghi chú](../../2-CORE-CONCEPTS/notebooks-sources-notes.md)
Cách DocuMind tổ chức nghiên cứu của bạn. Hãy hiểu cấu trúc ba tầng và cách thông tin được chuyển đổi từ các nguyên liệu thô (nguồn) thành các hiểu biết hoàn thiện (ghi chú).

**Ý tưởng chính**: Một Notebook là một "thùng chứa" nghiên cứu có phạm vi cụ thể. Nguồn tài liệu là đầu vào (PDF, URL, v.v.). Ghi chú là đầu ra (phân tích của bạn, tóm tắt do AI tạo ra, các câu trả lời quan trọng).

---

### 2. [Ngữ cảnh AI & RAG](../../2-CORE-CONCEPTS/ai-context-rag.md)
Cách DocuMind giúp AI "nhận thức" được nghiên cứu của bạn — thông qua hai cách tiếp cận khác nhau.

**Ý tưởng chính**: **Chat** gửi toàn bộ các nguồn tài liệu đã chọn tới mô hình ngôn ngữ lớn (full context, mang tính hội thoại). **Ask** sử dụng kỹ thuật RAG (retrieval-augmented generation) để tự động tìm kiếm và chỉ trích xuất các đoạn văn bản có liên quan nhất. Các công cụ khác nhau cho những nhu cầu khác nhau.

---

### 3. [Chat vs. Biến đổi (Transformations)](../../2-CORE-CONCEPTS/chat-vs-transformations.md)
Tại sao DocuMind có các chế độ tương tác khác nhau và khi nào nên sử dụng từng chế độ.

**Ý tưởng chính**: Chat là cuộc hội thoại để khám phá (bạn kiểm soát ngữ cảnh). Transformations (Biến đổi) là quá trình trích xuất hiểu biết sâu. Chúng cô đặc nội dung thành các mảnh thông tin tập trung/cô đọng, giúp AI xử lý hiệu quả hơn rất nhiều.

---

### 4. [Quản lý Ngữ cảnh](../../2-CORE-CONCEPTS/chat-vs-transformations.md#context-management-the-control-panel)
Bảng điều khiển của bạn về quyền riêng tư và chi phí. Bạn quyết định dữ liệu nào thực sự được gửi tới AI.

**Ý tưởng chính**: Bạn chọn ba mức độ—không trong ngữ cảnh (riêng tư), chỉ tóm tắt (cô đọng), hoặc toàn bộ nội dung (truy cập hoàn toàn). Điều này mang lại cho bạn khả năng kiểm soát tinh vi.

---

### 5. [Giải thích về Podcasts](../../2-CORE-CONCEPTS/podcasts-explained.md)
Tại sao DocuMind có thể biến nghiên cứu thành âm thanh và tại sao điều này lại quan trọng.

**Ý tưởng chính**: Podcasts biến nghiên cứu của bạn thành một định dạng tiêu thụ khác. Thay vì đọc, bạn có thể nghe và hấp thụ các hiểu biết một cách thụ động khi đang làm việc khác.

---

## Bức tranh toàn cảnh

DocuMind được xây dựng dựa trên một quan điểm đơn giản: **Nghiên cứu của bạn phải thuộc về bạn**.

Điều đó có nghĩa là:
- **Quyền riêng tư là mặc định** — Dữ liệu của bạn không rời khỏi hạ tầng của bạn trừ khi bạn chủ động lựa chọn.
- **AI là một công cụ, không phải là người cai quản** — BẠN quyết định nguồn tài liệu nào AI được thấy, không phải AI tự quyết định thay bạn.
- **Tiêu thụ thông tin linh hoạt** — Đọc, nghe, tìm kiếm, chat hoặc biến đổi nghiên cứu của bạn theo bất kỳ cách nào bạn thấy hợp lý.

---

## Các bước tiếp theo

1. **Chỉ muốn bắt đầu dùng ngay?** → Xem [Hướng dẫn sử dụng](../3-USER-GUIDE/index.md)
2. **Muốn hiểu sâu về hệ thống trước?** → Đọc 5 phần ở trên (mất khoảng 15 phút)
3. **Cài đặt lần đầu?** → Xem [Hướng dẫn cài đặt](../1-INSTALLATION/index.md)
