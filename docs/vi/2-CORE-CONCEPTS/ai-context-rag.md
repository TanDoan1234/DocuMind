# Ngữ cảnh AI & RAG - Cách DocuMind sử dụng tài liệu của bạn

DocuMind sử dụng các phương pháp khác nhau để giúp mô hình AI "nhận thức" được các nghiên cứu của bạn. Phần này giải thích về **RAG** (được dùng trong tính năng Ask) và **Ngữ cảnh toàn phần** (được dùng trong Chat).

---

## Vấn đề: Làm sao để AI hiểu được dữ liệu của bạn?

### Các hướng tiếp cận truyền thống
1. **Fine-tuning (Huấn luyện lại)**: Đắt đỏ, chậm chạp và dữ liệu trở nên "vĩnh viễn" (không thể xóa bỏ).
2. **Gửi tất cả lên Cloud**: Đưa toàn bộ tài liệu lên ChatGPT/Claude. Vấn đề lớn về quyền riêng tư và chi phí cực cao.
3. **Bỏ qua dữ liệu**: AI không biết gì về kiến thức chuyên sâu của bạn.

### Cách tiếp cận kép của DocuMind

- **Dành cho Chat**: Gửi toàn bộ nội dung tài liệu bạn đã chọn trực tiếp cho AI. AI nhìn thấy mọi thứ bạn chọn, giúp phân tích sâu và chính xác.
- **Dành cho Ask (RAG)**: Retrieval-Augmented Generation (Tạo văn bản dựa trên truy xuất tìm kiếm). AI chỉ nhận được những đoạn văn bản liên quan nhất được tìm thấy sau khi quét toàn bộ kho tài liệu.

---

## Quy trình hoạt động của RAG (3 Giai đoạn)

### Giai đoạn 1: Chuẩn bị nội dung
Khi bạn tải một tài liệu lên, DocuMind thực hiện:
1. **Trích xuất văn bản**: Chuyển PDF, URL, Âm thanh... thành văn bản thuần.
2. **Chia nhỏ (Chunking)**: Chia tài liệu dài thành các đoạn nhỏ khoảng 500 từ.
3. **Tạo Vector (Embeddings)**: Biến mỗi đoạn văn thành một chuỗi số đại diện cho ý nghĩa của nó.
4. **Lưu trữ**: Lưu vào cơ sở dữ liệu để sẵn sàng tìm kiếm.

### Giai đoạn 2: Truy vấn (Khi bạn tìm kiếm)
1. Bạn đặt một câu hỏi.
2. Hệ thống chuyển câu hỏi của bạn thành một vector số.
3. Hệ thống so sánh vector câu hỏi với tất cả các đoạn văn trong kho để tìm ra những đoạn có **ý nghĩa tương đồng nhất**.

### Giai đoạn 3: Tổng hợp (AI trả lời)
Hệ thống xây dựng một câu lệnh (Prompt) gửi cho AI:
"Dưới đây là một số thông tin từ tài liệu của người dùng: [Các đoạn văn bản đã tìm thấy]. Hãy trả lời câu hỏi: [Câu hỏi của bạn] dựa trên các thông tin này."

AI sẽ trả lời kèm theo **trích dẫn cụ thể** từ các đoạn văn đó.

---

## Hai chế độ tìm kiếm: Chính xác vs. Ngữ nghĩa

1. **Tìm kiếm văn bản (Keyword Matching)**: Tìm các đoạn chứa đúng từ khóa bạn nhập. Phù hợp khi bạn nhớ chính xác một cái tên hoặc con số.
2. **Tìm kiếm Vector (Semantic Similarity)**: Tìm theo ý tưởng. Ngay cả khi bạn không dùng đúng từ khóa, AI vẫn tìm được nội dung có ý nghĩa tương đương.

---

## Quản lý Ngữ cảnh: Bảng điều khiển quyền riêng tư & chi phí

DocuMind cho phép bạn quyết định AI được thấy cái gì:

| Cấp độ | AI nhận được gì? | Chi phí | Quyền riêng tư |
|-------|---------------|--------------|---------|
| **Toàn bộ nội dung** | Toàn văn tài liệu | Cao | Trung bình |
| **Chỉ tóm tắt** | Bản tóm tắt do AI tạo | Thấp | Cao |
| **Không trong ngữ cảnh** | Không gì cả | $0 | Tối đa |

---

## Sự khác biệt: Chat vs. Ask

### Chat (Gửi toàn bộ - Không dùng RAG)
- AI nhận được toàn bộ văn bản của các tài liệu bạn đã chọn.
- Phù hợp khi bạn muốn đối thoại qua lại và phân tích cực sâu một vài tài liệu cụ thể.
- **Ưu điểm**: AI không bỏ sót chi tiết nào.

### Ask (Dùng RAG - Truy xuất tự động)
- Hệ thống tự tìm kiếm trên toàn bộ hàng trăm tài liệu và chỉ gửi những đoạn liên quan cho AI.
- Phù hợp khi bạn có quá nhiều tài liệu và không biết câu trả lời nằm ở đâu.
- **Ưu điểm**: Tự động, tiết kiệm chi phí cho các notebook lớn.

---

## Tóm tắt

DocuMind mang lại cho bạn hai cách thức làm việc với AI:
1. **Chat**: Phân tích sâu, kiểm soát thủ công từng nguồn tài liệu.
2. **Ask**: Quét diện rộng, tìm kiếm tự động trên toàn kho tri thức.

Cả hai cách tiếp cận đều đảm bảo: **Dữ liệu của bạn nằm trong tầm kiểm soát, có thể xác thực qua trích dẫn và tối ưu hóa chi phí.**
