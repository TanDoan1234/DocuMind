import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:documind_mobile/core/app_colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          _buildHeader(context),
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 8),
                    _buildSearchBar(),
                    const SizedBox(height: 16),
                    _buildBanner(),
                    const SizedBox(height: 32),
                    _buildSectionHeader("Hành động nhanh"),
                    const SizedBox(height: 12),
                    _buildQuickActions(),
                    const SizedBox(height: 32),
                    _buildSectionHeader("Sổ tay của bạn", showSeeAll: true),
                    const SizedBox(height: 6),
                    _buildFolderGrid(),
                    const SizedBox(height: 32),
                    _buildSectionHeader("Ghi chú gần đây", showSeeAll: true),
                    const SizedBox(height: 8),
                    _buildRecentNoteCard(),
                    const SizedBox(height: 140),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      extendBody: true,
      bottomNavigationBar: _buildCustomBottomNav(),
      floatingActionButton: _buildFloatingActionButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  /// HEADER DÙNG ASSET UTILITY CHÍNH CHỦ
  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top + 10,
        left: 20,
        right: 20,
        bottom: 10,
      ),
      color: Colors.white,
      child: Row(
        children: [
          // Icon Menu Utility
          Image.asset("assets/icons/utility/icon-utility-menu.png", width: 32, height: 32),
          const Spacer(),
          Column(
            children: [
              RichText(
                text: TextSpan(
                  style: GoogleFonts.outfit(fontSize: 22, fontWeight: FontWeight.bold, color: AppColors.textDark),
                  children: const [
                    TextSpan(text: "Chào bạn, "),
                    TextSpan(text: "Linh!", style: TextStyle(color: AppColors.primary)),
                  ],
                ),
              ),
              Text("Hôm nay bạn muốn học gì?", style: GoogleFonts.inter(fontSize: 14, color: Colors.grey.shade500)),
            ],
          ),
          const Spacer(),
          // Icon Bell Utility
          Image.asset("assets/icons/utility/icon-utility-bell.png", width: 32, height: 32),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      height: 52,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: const Color(0xFFF5F7F7),
        borderRadius: BorderRadius.circular(100),
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: "Tìm kiếm ghi chú, sổ tay...",
          hintStyle: GoogleFonts.inter(color: Colors.grey.shade400, fontSize: 14),
          prefixIcon: const Icon(Icons.search_rounded, color: Colors.grey, size: 22),
          suffixIcon: Icon(Icons.tune_rounded, color: Colors.grey.shade400, size: 22),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(vertical: 12),
        ),
      ),
    );
  }

  Widget _buildBanner() {
    return Container(
      width: double.infinity,
      height: 160,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [const Color(0xFFE0F2F1), const Color(0xFFF1F8F7)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(28),
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // Mây rải rác bên trái
          Positioned(
            left: -20,
            top: 10,
            child: Opacity(
              opacity: 0.2,
              child: Image.asset("assets/decor/clouds/decor-cloud-mint-01.png", width: 140),
            ),
          ),
          
          // Mây ở vùng khoanh đỏ phía trên
          Positioned(
            left: 160,
            top: 5,
            child: Opacity(
              opacity: 0.25,
              child: Image.asset("assets/decor/clouds/decor-cloud-mint-01.png", width: 130),
            ),
          ),

          // Mây ở vùng khoanh đỏ phía dưới
          Positioned(
            left: 140,
            bottom: 5,
            child: Opacity(
              opacity: 0.2,
              child: Image.asset("assets/decor/clouds/decor-cloud-mint-01.png", width: 110),
            ),
          ),

          // Lá cây phủ góc trái trên
          Positioned(
            left: -10,
            top: -15,
            child: Opacity(
              opacity: 0.5,
              child: Image.asset("assets/decor/botanical/decor-leaf-sprig-03.png", width: 100),
            ),
          ),

          Positioned(
            left: 20,
            bottom: -5,
            child: Opacity(
              opacity: 0.4,
              child: Image.asset("assets/decor/botanical/decor-leaf-sprig-02.png", width: 70),
            ),
          ),

          // Nội dung Text
          Padding(
            padding: const EdgeInsets.only(left: 24, top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Cùng AI học tập", style: GoogleFonts.outfit(fontSize: 22, fontWeight: FontWeight.bold, color: const Color(0xFF00695C))),
                const SizedBox(height: 6),
                Text("thông minh hơn mỗi ngày!", style: GoogleFonts.inter(fontSize: 15, color: const Color(0xFF4DB6AC))),
              ],
            ),
          ),

          // Mây lót sau Mascot
          Positioned(
            right: 0,
            top: 15,
            child: Opacity(
              opacity: 0.4,
              child: Image.asset("assets/decor/clouds/decor-cloud-mint-01.png", width: 130),
            ),
          ),

          // MASCOT SÁT LỀ PHẢI
          Positioned(
            right: -45,
            bottom: -35,
            child: Image.asset(
              "assets/mascot/mascot-owl-reading-book.png", 
              height: 250,
              fit: BoxFit.contain,
            ),
          ),

          // Lá cây phủ góc phải dưới
          Positioned(
            right: 0,
            bottom: -15,
            child: Opacity(
              opacity: 0.5,
              child: Image.asset("assets/decor/botanical/decor-leaf-double-01.png", width: 90),
            ),
          ),
          
          // Lá cây góc trái dưới
          Positioned(
            left: -5,
            bottom: -5,
            child: Opacity(
              opacity: 0.3,
              child: Image.asset("assets/decor/botanical/decor-leaf-single-01.png", width: 60),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title, {bool showSeeAll = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: GoogleFonts.outfit(fontSize: 19, fontWeight: FontWeight.bold, color: AppColors.textDark)),
        if (showSeeAll)
          Text("Xem tất cả", style: GoogleFonts.inter(fontSize: 14, color: AppColors.primary, fontWeight: FontWeight.bold)),
      ],
    );
  }

  Widget _buildQuickActions() {
    final actions = [
      {"icon": "assets/icons/actions/icon-actions-summary.png", "label": "Tóm tắt"},
      {"icon": "assets/icons/actions/icon-actions-ai-chat.png", "label": "Hỏi AI"},
      {"icon": "assets/icons/actions/icon-actions-flashcards.png", "label": "Flashcard"},
      {"icon": "assets/icons/actions/icon-action-more.png", "label": "Thêm"},
    ];

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: actions.map((item) {
        return Expanded(
          child: Column(
            children: [
              Image.asset(item["icon"] as String, width: 72, height: 72, fit: BoxFit.contain),
              const SizedBox(height: 6),
              Text(item["label"] as String, style: GoogleFonts.inter(fontSize: 13, fontWeight: FontWeight.w600, color: AppColors.textDark)),
            ],
          ),
        );
      }).toList(),
    );
  }

  Widget _buildFolderGrid() {
    final items = [
      {"title": "Toán học", "count": 24, "icon": "assets/icons/categories/icon-category-study.png"},
      {"title": "Vật lý", "count": 18, "icon": "assets/icons/categories/icon-category-research.png"},
      {"title": "Tiếng Anh", "count": 16, "icon": "assets/icons/categories/icon-category-project.png"},
      {"title": "Lịch sử", "count": 10, "icon": "assets/icons/categories/icon-category-personal.png"},
    ];

    return GridView.builder(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 8,
        childAspectRatio: 2.5,
      ),
      itemCount: items.length,
      itemBuilder: (context, index) {
        final folder = items[index];
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.grey.shade100, width: 1),
          ),
          child: Row(
            children: [
              Image.asset(folder["icon"] as String, width: 44, height: 44, fit: BoxFit.contain),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(folder["title"] as String, style: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.bold, color: AppColors.textDark), overflow: TextOverflow.ellipsis),
                    Text("${folder["count"]} ghi chú", style: GoogleFonts.inter(fontSize: 11, color: Colors.grey.shade500)),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildRecentNoteCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey.shade100),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(color: const Color(0xFFF1F8F7), borderRadius: BorderRadius.circular(14)),
            child: const Icon(Icons.description_rounded, color: AppColors.primary, size: 24),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Định luật Newton", style: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.textDark)),
                Text("Vật lý • 12 phút trước", style: GoogleFonts.inter(fontSize: 12, color: Colors.grey.shade500)),
              ],
            ),
          ),
          const Icon(Icons.more_vert_rounded, color: Colors.grey, size: 24),
        ],
      ),
    );
  }

  Widget _buildCustomBottomNav() {
    return BottomAppBar(
      color: Colors.white,
      elevation: 20,
      notchMargin: 12,
      height: 95,
      shape: const CircularNotchedRectangle(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(child: _buildNavItem(0, "assets/icons/navigations/icon-nav-home-outline.png", "Trang chủ")),
          Expanded(child: _buildNavItem(1, "assets/icons/navigations/icon-nav-notebook-outline.png", "Số tay")),
          const SizedBox(width: 50),
          Expanded(child: _buildNavItem(2, "assets/icons/navigations/icon-nav-ai-outline.png", "AI")),
          Expanded(child: _buildNavItem(3, "assets/icons/navigations/icon-nav-profile-outline.png", "Cá nhân")),
        ],
      ),
    );
  }

  Widget _buildNavItem(int index, String iconPath, String label) {
    bool isActive = _currentIndex == index;
    return GestureDetector(
      onTap: () => setState(() => _currentIndex = index),
      behavior: HitTestBehavior.opaque,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Opacity(
            opacity: isActive ? 1.0 : 0.5,
            child: Image.asset(
              iconPath, 
              width: 36,
              height: 36, 
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            label,
            style: GoogleFonts.inter(
              fontSize: 12,
              color: isActive ? AppColors.primary : Colors.grey.shade400,
              fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFloatingActionButton() {
    return Container(
      width: 68,
      height: 68,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: const LinearGradient(colors: [AppColors.primary, Color(0xFF4DB6AC)]),
        boxShadow: [BoxShadow(color: AppColors.primary.withOpacity(0.3), blurRadius: 18, offset: const Offset(0, 8))],
      ),
      child: FloatingActionButton(
        onPressed: () {},
        elevation: 0,
        backgroundColor: Colors.transparent,
        shape: const CircleBorder(),
        child: Image.asset(
          "assets/icons/navigations/icon-nav-plus-outline.png", 
          width: 34, 
          height: 34, 
          color: Colors.white,
        ),
      ),
    );
  }
}
