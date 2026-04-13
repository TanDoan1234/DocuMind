# Chat hiệu quả - Hội thoại với Tài liệu nghiên cứu của bạn

Chat là công cụ chính để bạn đặt các câu hỏi mang tính khám phá và thực hiện các cuộc đối thoại qua lại. Hướng dẫn này bao gồm cách sử dụng tính năng Chat một cách hiệu quả nhất trong DocuMind.

---

## Bắt đầu nhanh: Cuộc trò chuyện đầu tiên của bạn

```
1. Đi tới Notebook của bạn
2. Nhấp vào "Chat"
3. Chọn các nguồn tài liệu muốn đưa vào (Ngữ cảnh - Context)
4. Nhập câu hỏi của bạn
5. Nhấp vào "Send" (Gửi)
6. Đọc phản hồi từ AI
7. Đặt câu hỏi tiếp theo (Ngữ cảnh vẫn được giữ nguyên)
8. Lặp lại cho đến khi bạn hài lòng
```

---

## Quản lý Ngữ cảnh: Chìa khóa để Chat tốt

Ngữ cảnh (Context) kiểm soát **những gì AI được phép nhìn thấy**. Đây là quyền kiểm soát quan trọng nhất của bạn.

### Giải thích ba mức độ ngữ cảnh

**1. TOÀN BỘ NỘI DUNG (FULL CONTENT)**
- AI nhìn thấy: Toàn bộ văn bản của nguồn tài liệu.
- Phù hợp nhất cho: Phân tích chi tiết, yêu cầu trích dẫn chính xác từng câu.
- Ví dụ: "Hãy phân tích kỹ phương pháp nghiên cứu của bài báo này."

**2. CHỈ TÓM TẮT (SUMMARY ONLY)**
- AI nhìn thấy: Bản tóm tắt khoảng 200 từ do AI tạo ra (không phải toàn văn).
- Phù hợp nhất cho: Các tài liệu làm nền tảng, ngữ cảnh tham chiếu phụ.
- Ví dụ: "Dùng tài liệu này làm thông tin nền, tập trung sâu vào bài báo chính."

**3. KHÔNG NẰM TRONG NGỮ CẢNH (NOT IN CONTEXT)**
- AI nhìn thấy: Không gì cả.
- Phù hợp nhất cho: Các nội dung nhạy cảm, không liên quan hoặc tài liệu đã lưu trữ.

---

## Cách đặt câu hỏi hiệu quả

### Câu hỏi kém vs. Câu hỏi tốt

**Câu hỏi kém**
```
"Bạn nghĩ sao về tài liệu này?"

Vấn đề:
- Quá mơ hồ (nghĩ về cái gì?)
- Không có trọng tâm (phân tích khía cạnh nào?)
```

**Câu hỏi tốt**
```
"Dựa trên phần phương pháp luận của bài báo, 
hãy cho biết ba hạn chế chính mà tác giả đã thừa nhận là gì? 
Vui lòng trích dẫn trang chứa các thông tin đó."

Ưu điểm:
- Cụ thể về những gì bạn muốn.
- Phạm vi rõ ràng (phần phương pháp luận).
- Yêu cầu trích dẫn cụ thể.
```

### Công thức "SPECIFIC" cho câu hỏi tốt:

1.  **SCOPE (Phạm vi)** - Bạn đang phân tích cái gì? ("Trong bài báo này...", "Nhìn vào 3 nguồn tài liệu này...")
2.  **SPECIFICITY (Cụ thể)** - Chính xác bạn muốn gì? ("...phần kết quả...", "...các bước giải quyết...")
3.  **CONSTRAINT (Ràng buộc)** - Có giới hạn nào không? ("...trong 3 gạch đầu dòng...", "...so sánh 2 phương pháp này...")
4.  **VERIFICATION (Xác thực)** - Bạn kiểm tra bằng cách nào? ("...kèm trích dẫn cụ thể...", "...chỉ ra số trang...")

---

## Câu hỏi tiếp nối (Sức mạnh thực sự của Chat)

Điểm mạnh của Chat là sự đối thoại. Bạn hỏi, nhận câu trả lời, và hỏi sâu hơn.

```
Câu hỏi 1: "Kết quả chính của nghiên cứu này là gì?"
AI: "Nghiên cứu chỉ ra X [trích dẫn trang 5]"

Câu hỏi tiếp theo: "Vậy kết quả đó khác gì so với nghiên cứu Y?"
AI: "Sự khác biệt chính là Z [trích dẫn nguồn Y]"
```

---

## Trích dẫn và Xác thực

Trích dẫn là cách bạn kiểm tra xem câu trả lời của AI có chính xác hay không.

- **Hiểu về trích dẫn**: Khi AI nói "Nghiên cứu báo cáo tỷ lệ chính xác 95% [xem trang 12]", bạn phải có thể nhấp vào đó và thấy đúng dòng chữ đó ở trang 12.
- **Quy trình xác thực**: Nhận câu trả lời -> Kiểm tra trích dẫn -> Nhấp vào link trích dẫn -> Xem văn bản gốc. Nếu thông tin khớp, bạn có thể yên tâm sử dụng.

---

## Mẹo tối ưu hóa chi phí

Tính năng Chat tiêu tốn Token cho mỗi phản hồi. Để tiết kiệm:
- **Tối giản ngữ cảnh**: Chỉ chọn "Full Content" cho những tài liệu thực sự quan trọng nhất. Các tài liệu phụ nên để "Summary Only" hoặc loại bỏ khỏi ngữ cảnh.
- **Câu hỏi ngắn gọn**: AI sẽ xử lý nhanh hơn và ít tốn token hơn.
- **Sử dụng mô hình phù hợp**: Dùng các mô hình "Mini" (như GPT-4o-mini) cho các câu hỏi khám phá thông thường, và chỉ dùng các mô hình mạnh (như Claude 3.5 Sonnet) cho các phân tích cực kỳ chuyên sâu.

---

## Khi nào dùng Chat vs. dùng Ask?

- **Dùng CHAT khi**: Bạn muốn đối thoại qua lại, muốn tìm hiểu sâu dần một chủ đề, hoặc cần điều chỉnh ngữ cảnh linh hoạt trong quá trình nói chuyện.
- **Dùng ASK khi**: Bạn có một câu hỏi cụ thể và muốn nhận được một câu trả lời tổng hợp toàn diện duy nhất từ toàn bộ hệ thống lưu trữ kiến thức.

---

**DocuMind Chat** giúp bạn không chỉ là trò chuyện với AI, mà là đang thực hiện một cuộc hội thoại trực tiếp với chính kho tri thức nghiên cứu của mình.
