import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:documind_mobile/core/app_colors.dart';
import 'package:documind_mobile/features/ai/ai_chat_screen.dart';
import 'package:documind_mobile/features/ai/summary_screen.dart';

class NotebookDetailScreen extends StatefulWidget {
  final String notebookTitle;
  final String? iconPath;
  final Color themeColor;

  const NotebookDetailScreen({
    super.key, 
    required this.notebookTitle, 
    this.iconPath,
    this.themeColor = const Color(0xFFE0F2F1),
  });

  @override
  State<NotebookDetailScreen> createState() => _NotebookDetailScreenState();
}

class _NotebookDetailScreenState extends State<NotebookDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(),
      body: Column(
        children: [
          _buildActionGrid(),
          const SizedBox(height: 10),
          _buildContentHeader(),
          Expanded(
            child: _buildDocumentList(),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: AppColors.primary,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios_new_rounded, color: AppColors.textDark, size: 22),
        onPressed: () => Navigator.pop(context),
      ),
      title: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (widget.iconPath != null) ...[
            Image.asset(widget.iconPath!, width: 24, height: 24, fit: BoxFit.contain),
            const SizedBox(width: 8),
          ],
          Text(
            widget.notebookTitle,
            style: GoogleFonts.outfit(fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.textDark),
          ),
        ],
      ),
      centerTitle: true,
      actions: [
        IconButton(
          icon: const Icon(Icons.more_horiz_rounded, color: AppColors.textDark),
          onPressed: () {},
        ),
      ],
    );
  }

  Widget _buildActionGrid() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildActionButton(
            label: "Tóm tắt",
            icon: "assets/icons/actions/icon-actions-summary.png",
            color: const Color(0xFFE8F5E9),
            iconColor: const Color(0xFF2E7D32),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SummaryScreen()),
              );
            },
          ),
          _buildActionButton(
            label: "Hỏi AI",
            icon: "assets/icons/actions/icon-actions-ai-chat.png",
            color: const Color(0xFFE3F2FD),
            iconColor: const Color(0xFF1565C0),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AIChatScreen()),
              );
            },
          ),
          _buildActionButton(
            label: "Flashcards",
            icon: "assets/icons/actions/icon-actions-flashcards.png",
            color: const Color(0xFFFFF3E0),
            iconColor: const Color(0xFFEF6C00),
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton({
    required String label,
    required String icon,
    required Color color,
    required Color iconColor,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.28,
        padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: color.withValues(alpha: 0.5), width: 1.5),
          boxShadow: [
            BoxShadow(
              color: color.withValues(alpha: 0.2),
              blurRadius: 15,
              offset: const Offset(0, 8),
            ),
            BoxShadow(
              color: Colors.white,
              blurRadius: 2,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(icon, width: 72, height: 72, fit: BoxFit.contain),
            const SizedBox(height: 8),
            Text(
              label,
              style: GoogleFonts.outfit(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppColors.textDark,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContentHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Tài liệu của bạn",
            style: GoogleFonts.outfit(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.textDark),
          ),
          Text(
            "Xem thêm",
            style: GoogleFonts.inter(fontSize: 13, color: AppColors.primary, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }

  Widget _buildDocumentList() {
    final docs = [
      {"name": "Quang hợp ở thực vật.pdf", "date": "2 giờ trước", "type": "PDF"},
      {"name": "Ghi chú sinh học lớp 12.docx", "date": "Hôm qua", "type": "DOCX"},
      {"name": "Bài tập về nhà - Hóa.txt", "date": "3 ngày trước", "type": "TXT"},
    ];

    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      itemCount: docs.length,
      itemBuilder: (context, index) {
        final doc = docs[index];
        return Container(
          margin: const EdgeInsets.only(bottom: 12),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.grey.shade50,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.grey.shade100),
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  doc['type'] == 'PDF' ? Icons.picture_as_pdf_rounded : Icons.description_rounded,
                  color: AppColors.primary,
                  size: 24,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      doc['name']!,
                      style: GoogleFonts.inter(fontSize: 15, fontWeight: FontWeight.w600, color: AppColors.textDark),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      doc['date']!,
                      style: GoogleFonts.inter(fontSize: 12, color: Colors.grey.shade500),
                    ),
                  ],
                ),
              ),
              IconButton(
                icon: const Icon(Icons.more_vert_rounded, color: Colors.grey),
                onPressed: () {},
              ),
            ],
          ),
        );
      },
    );
  }
}
