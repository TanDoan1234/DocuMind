# Tích hợp Giao thức Ngữ cảnh Mô hình (MCP)

DocuMind có thể tích hợp liền mạch vào quy trình làm việc AI của bạn thông qua **Model Context Protocol (MCP)**. Điều này cho phép bạn truy cập trực tiếp vào các Notebook, nguồn tài liệu và chức năng chat của DocuMind từ các trợ lý AI như Claude Desktop hoặc các tiện ích mở rộng trong VS Code.

---

## MCP là gì?

[Model Context Protocol](https://modelcontextprotocol.io) là một tiêu chuẩn mở cho phép các ứng dụng AI kết nối bảo mật với các nguồn dữ liệu và công cụ bên ngoài. Với máy chủ DocuMind MCP, bạn có thể:

- 📚 **Truy cập Notebook** trực tiếp từ Claude hoặc VS Code.
- 🔍 **Tìm kiếm nội dung nghiên cứu** mà không cần rời khỏi trình duyệt chat.
- 💬 **Quản lý phiên chat** sử dụng chính tài liệu của bạn làm ngữ cảnh.
- 📝 **Tạo ghi chú** và phân tích chuyên sâu ngay lập tức.
- 🤖 **Tự động hóa quy trình** bằng cách sử dụng toàn bộ API của DocuMind.

---

## Thiết lập nhanh

### Cho Claude Desktop

1. **Cấu hình Claude Desktop**:
   Mở tệp cấu hình (thường tại `~/Library/Application Support/Claude/claude_desktop_config.json` trên macOS):

   ```json
   {
     "mcpServers": {
       "documind": {
         "command": "uvx",
         "args": ["documind-mcp"],
         "env": {
           "OPEN_NOTEBOOK_URL": "http://localhost:5055",
           "OPEN_NOTEBOOK_PASSWORD": "mat_khau_cua_ban_neu_co"
         }
       }
     }
   }
   ```

2. **Khởi động lại Claude**: Bạn sẽ thấy biểu tượng DocuMind xuất hiện, sẵn sàng để truy vấn dữ liệu.

### Cho VS Code (Cline hoặc các extension hỗ trợ MCP)

Thêm cấu hình tương tự vào tệp `mcp.json` của extension:

```json
{
  "servers": {
    "documind": {
      "command": "uvx",
      "args": ["documind-mcp"],
      "env": {
        "OPEN_NOTEBOOK_URL": "http://localhost:5055",
        "OPEN_NOTEBOOK_PASSWORD": "mat_khau_cua_ban_neu_co"
      }
    }
  }
}
```

---

## Bạn có thể yêu cầu trợ lý AI làm gì?

Sau khi kết nối, bạn có thể ra lệnh cho Claude:
- _"Tìm kiếm trong DocuMind thông tin về [chủ đề] giúp tôi."_
- _"Tạo một ghi chú mới tóm tắt các điểm chính từ cuộc hội thoại này vào Notebook Nghiên cứu."_
- _"Liệt kê tất cả các nguồn tài liệu tôi có trong Notebook [tên]."_
- _"Phân tích tài liệu PDF này dựa trên kho kiến thức tôi đã lưu."_

---

## Các công cụ MCP khả dụng

Máy chủ DocuMind MCP cung cấp quyền truy cập đầy đủ vào:
- **Notebooks**: Liệt kê, tạo, cập nhật, xóa.
- **Sources**: Quản lý tệp tin, liên kết web, văn bản.
- **Notes**: Quản lý các ghi chú và phân tích AI.
- **Chat**: Tạo phiên hội thoại và gửi tin nhắn.
- **Search**: Tìm kiếm vector và tìm kiếm văn bản trên toàn bộ hệ thống.

---

## Xử lý sự cố

1. **Lỗi kết nối**: Đảm bảo `OPEN_NOTEBOOK_URL` chính xác (mặc định là cổng 5055).
2. **Sai mật khẩu**: Nếu bạn đã đặt mật khẩu bảo vệ cho DocuMind, hãy chắc chắn nó khớp với biến `OPEN_NOTEBOOK_PASSWORD` trong tệp JSON.
3. **Quyền truy cập**: Nếu chạy trên máy chủ từ xa, hãy đảm bảo cổng 5055 đã được mở trong tường lửa.

Tích hợp MCP biến **DocuMind** trở thành một "bộ não" kiến thức luôn song hành cùng các công cụ AI yêu thích của bạn.
