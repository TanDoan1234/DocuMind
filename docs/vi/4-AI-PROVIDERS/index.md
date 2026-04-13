# Nhà cung cấp AI - Hướng dẫn So sánh & Lựa chọn

DocuMind hỗ trợ 5 nhà cung cấp AI cốt lõi (OpenAI, Google AI, Ollama, ElevenLabs, Local). Hướng dẫn này giúp bạn **chọn nhà cung cấp phù hợp** với nhu cầu của mình.

---

## Lựa chọn nhanh: Nên dùng hãng nào?

### Dịch vụ đám mây (Dễ nhất)

**OpenAI (Khuyên dùng)**
- Chi phí: ~$0.03-0.15 cho mỗi 1K tokens
- Tốc độ: Rất nhanh
- Chất lượng: Xuất sắc
- Phù hợp nhất cho: Đa số người dùng (cân bằng tốt nhất giữa chất lượng và giá cả)

**Google Gemini**
- Chi phí: ~$0.075-0.30 cho mỗi 1K tokens
- Tốc độ: Rất nhanh
- Chất lượng: Tốt đến Xuất sắc
- Phù hợp nhất cho: Nội dung đa phương tiện (hình ảnh, âm thanh, video), ngữ cảnh cực dài (lên đến 2 triệu tokens).

**ElevenLabs (Chuyên về giọng nói)**
- Chi phí: Theo gói hàng tháng
- Chất lượng: Giọng nói tự nhiên nhất hiện nay
- Phù hợp nhất cho: Tính năng tạo Podcast chuyên nghiệp.

### Chạy Local / Tự máy chủ (Miễn phí, Riêng tư)

**Ollama (Khuyên dùng cho chạy Local)**
- Chi phí: Miễn phí (chỉ tốn điện)
- Tốc độ: Phụ thuộc vào phần cứng (Chậm trên CPU, Nhanh trên GPU/Chip Apple Silicon)
- Chất lượng: Tốt (sử dụng các mô hình mã nguồn mở như Llama 3, Mistral)
- Quyền riêng tư: 100% nội địa, không có dữ liệu nào rời khỏi máy của bạn.

**Local (Mô hình Tiếng Việt tối ưu - ViT5/PhoBERT)**
- Chi phí: Miễn phí
- Đặc điểm: Tích hợp sẵn bởi Tân Đoàn, tối ưu riêng cho việc tóm tắt và hỏi đáp tiếng Việt.
- Tốc độ: Tối ưu cho phần cứng phổ thông.

---

## Bảng So sánh

| Nhà cung cấp | Tốc độ | Chi phí | Chất lượng | Quyền riêng tư | Ngữ cảnh (Context) |
|----------|-------|------|---------|---------|---------|
| **OpenAI** | Rất nhanh | $$ | Xuất sắc | Thấp | 128K |
| **Google** | Rất nhanh | $$ | Tốt-Xuất sắc | Thấp | 2M |
| **Ollama** | Trung bình | Miễn phí | Tốt | Tối đa | Tùy mô hình |
| **ElevenLabs**| Nhanh | $$$ | Xuất sắc | Thấp | - |
| **Local (VN)** | Trung bình | Miễn phí | Tối ưu VN | Tối đa | 4K-32K |

---

## Lựa chọn theo nhu cầu

### Tôi muốn cài đặt dễ nhất
→ **OpenAI** — Phổ biến nhất, hỗ trợ cộng đồng tốt nhất.

### Tôi có ngân sách không giới hạn
→ **OpenAI** — Chất lượng phản hồi ổn định nhất.

### Tôi muốn quyền riêng tư tuyệt đối / Dùng Offline
→ **Ollama** hoặc **Mô hình Local Tiếng Việt** — Miễn phí và riêng tư.

### Tôi cần ngữ cảnh cực dài (đọc nhiều tài liệu cùng lúc)
→ **Google Gemini** — Hỗ trợ lên đến 2 triệu tokens.

---

## Ước tính chi phí hàng tháng

### OpenAI
```
Sử dụng ít (10 chats/ngày): $1-5/tháng 
Sử dụng trung bình (50 chats/ngày): $10-30/tháng
Sử dụng nhiều (cả ngày): $50-100+/tháng
```

### Ollama / Local
```
Mọi mức độ sử dụng: Miễn phí (chỉ tốn điện năng)
```

---

## Các bước tiếp theo

1. **Chọn một nhà cung cấp** (từ hướng dẫn so sánh này).
2. **Thêm thông tin xác thực** trong phần Settings (Cài đặt) → API Keys trên giao diện DocuMind.
3. **Kiểm tra kết nối** và khám phá các mô hình.
4. **Bắt đầu sử dụng DocuMind!**
