# Chat vs. Ask vs. Biến đổi - Chọn công cụ nào cho công việc gì?

DocuMind cung cấp nhiều cách khác nhau để tương tác với các nghiên cứu của bạn. Hiểu rõ khi nào nên sử dụng từng công cụ là chìa khóa để vận hành hệ thống hiệu quả.

---

## 3 Chế độ tương tác chính

### 1. CHAT - Khám phá qua đối thoại (Tự chọn ngữ cảnh)

**Bản chất:** Trò chuyện trực tiếp với AI về các nguồn tài liệu bạn đã chọn.

**Quy trình:**
1. Bạn chủ động chọn các nguồn tài liệu muốn đưa vào ("ngữ cảnh").
2. Bạn đặt câu hỏi.
3. AI trả lời CHỈ dựa trên các nguồn đã chọn đó.
4. Bạn đặt các câu hỏi tiếp nối (lịch sử trò chuyện và ngữ cảnh được giữ nguyên).

**Phù hợp nhất cho:**
- Khám phá sâu một chủ đề tập trung với các nguồn tài liệu cụ thể.
- Đặt nhiều câu hỏi qua lại để làm rõ vấn đề.
- Khi bạn muốn kiểm soát chặt chẽ dữ liệu nào được gửi cho AI.

---

### 2. ASK - Tìm kiếm tổng hợp tự động

**Bản chất:** Đặt một câu hỏi phức tạp duy nhất, hệ thống tự động tìm kiếm nội dung liên quan trên toàn bộ notebook.

**Quy trình:**
1. Bạn đặt một câu hỏi tổng quát/phức tạp.
2. Hệ thống tự phân tích câu hỏi và tự động tìm kiếm trong toàn bộ các nguồn bạn có.
3. Hệ thống trích xuất các đoạn văn bản liên quan nhất.
4. AI tổng hợp thành một câu trả lời chi tiết duy nhất kèm trích dẫn.

**Phù hợp nhất cho:**
- Các câu hỏi mang tính tổng hợp, so sánh nhiều nguồn tài liệu cùng lúc.
- Khi bạn muốn hệ thống tự quyết định tài liệu nào là liên quan.
- Khi bạn cần một câu trả lời toàn diện mà không cần trò chuyện qua lại.

---

### 3. BIẾN ĐỔI (TRANSFORMATIONS) - Xử lý theo mẫu cấu trúc

**Bản chất:** Áp dụng một mẫu câu lệnh (template) có sẵn cho một nguồn tài liệu để nhận kết quả có cấu trúc.

**Quy trình:**
1. Bạn chọn (hoặc tự tạo) một mẫu biến đổi (ví dụ: "Trích xuất phương pháp luận và kết quả chính").
2. Bạn áp dụng cho từng nguồn tài liệu một.
3. Kết quả được lưu dưới dạng một **Ghi chú (Note)** mới trong notebook.

**Phù hợp nhất cho:**
- Trích xuất cùng một loại thông tin từ nhiều tài liệu khác nhau (chạy lặp lại cho từng file).
- Tạo ra các bản tóm tắt có định dạng thống nhất cho cả kho tài liệu.
- Xây dựng cơ sở dữ liệu tri thức được phân loại rõ ràng.

---

## Bảng so sánh nhanh

| Đặc điểm | CHAT | ASK | BIẾN ĐỔI |
|--------|------|-----|-----------------|
| **Mục đích** | Khám phá hội thoại | Trả lời tổng hợp | Trích xuất theo mẫu |
| **Số câu hỏi** | Nhiều (có ghi nhớ) | Một câu hỏi duy nhất | Một mẫu cho mỗi tài liệu |
| **Kiểm soát ngữ cảnh** | Thủ công (Bạn chọn) | Tự động (Hệ thống tìm) | Từng tài liệu một |
| **Tính hội thoại** | Có (hỏi sâu thêm) | Không | Không |
| **Kết quả đầu ra** | Cuộc trò chuyện tự nhiên | Câu trả lời tổng hợp | Ghi chú có cấu trúc |

---

## Cây quyết định: Nên dùng công cụ nào?

**Bạn đang muốn làm gì?**

- **"Tôi muốn thảo luận sâu và đặt nhiều câu hỏi liên quan"**
  - –> Hãy dùng **CHAT**.

- **"Tôi cần một câu trả lời tổng hợp từ tất cả tài liệu có trong notebook"**
  - –> Hãy dùng **ASK**.

- **"Tôi muốn trích xuất các ý chính của tài liệu này theo một định dạng cố định"**
  - –> Hãy dùng **BIẾN ĐỔI**.

---

## Tóm tắt nội dung

| Tình huống | Công cụ | Tại sao? |
|-----------|-----|-----|
| "Tôi muốn đặt câu hỏi tiếp nối để làm rõ vấn đề" | **CHAT** | Có tính hội thoại, bạn kiểm soát dữ liệu đầu vào |
| "Tôi cần so sánh phương pháp của 2-3 tài liệu cụ thể" | **CHAT** | Chọn chính xác 2-3 nguồn đó và bắt đầu đối thoại |
| "Cho tôi biết bức tranh toàn cảnh về chủ đề X từ 100 tài liệu" | **ASK** | Hệ thống tự quét toàn bộ và tổng hợp kết quả |
| "Tôi muốn mỗi file PDF đều có bản tóm tắt theo cùng 1 format" | **BIẾN ĐỔI** | Dùng mẫu cố định áp dụng cho từng nguồn một |

Mỗi câu hỏi nghiên cứu đều cần một công cụ khác nhau. **DocuMind** cung cấp cả ba vì nghiên cứu thực tế hiếm khi chỉ nằm ở một chế độ duy nhất.
