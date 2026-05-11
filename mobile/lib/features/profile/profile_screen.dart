import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:documind_mobile/core/app_colors.dart';
import 'package:documind_mobile/features/profile/settings_screen.dart';
import 'package:documind_mobile/core/api_service.dart';
import 'package:documind_mobile/features/auth/login_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final ApiService _apiService = ApiService();
  String _fullName = "Người dùng";
  bool _isLoggingOut = false; // Trạng thái đang đăng xuất

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    final name = await _apiService.getUserName();
    if (mounted) {
      setState(() {
        if (name != null) _fullName = name;
      });
    }
  }

  void _handleLogout() async {
    setState(() => _isLoggingOut = true);

    // Giả lập độ trễ 1.5s cho mượt mà
    await Future.delayed(const Duration(milliseconds: 1500));

    await _apiService.logout();

    if (mounted) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
        (route) => false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 24),
              _buildHeader(),
              const SizedBox(height: 16), // Reduced from 32

              // Thống kê Section
              _buildSectionTitle("Thống kê học tập"),
              const SizedBox(height: 16),
              _buildStatsGrid(),
              const SizedBox(height: 32),

              // Cài đặt Section
              _buildSectionTitle("Tài khoản & Tùy chọn"),
              const SizedBox(height: 16),
              _buildMenuSection(context),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: GoogleFonts.outfit(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: AppColors.textDark,
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      children: [
        Image.asset(
          "assets/mascot/mascot-owl-avatar-circle.png",
          width: 120,
          height: 120,
          fit: BoxFit.contain,
        ),
        const SizedBox(width: 24),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              _fullName,
              style: GoogleFonts.outfit(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: AppColors.textDark,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              "Thành viên DocuMind",
              style: GoogleFonts.inter(
                fontSize: 16,
                color: const Color(0xFF64748B), // Slate Gray from guide
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildStatsGrid() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildStatItem("0", "Sổ tay", Icons.book_outlined,
            AppColors.categoryStudy, AppColors.primary),
        _buildStatItem("0", "Ghi chú", Icons.note_alt_outlined,
            AppColors.categoryProject, Colors.blue),
        _buildStatItem("0h", "Thời gian", Icons.access_time,
            AppColors.categoryPersonal, Colors.orange),
      ],
    );
  }

  Widget _buildStatItem(String value, String label, IconData icon,
      Color bgColor, Color iconColor) {
    return Container(
      width: 105,
      padding: const EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: bgColor,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, size: 20, color: iconColor),
          ),
          const SizedBox(height: 12),
          Text(
            value,
            style: GoogleFonts.outfit(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: AppColors.textDark,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: GoogleFonts.inter(
              fontSize: 13,
              color: const Color(0xFF64748B),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuSection(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(28),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          _buildMenuItem(
            Icons.cloud_outlined,
            "Dữ liệu của tôi",
            iconBg: AppColors.categoryStudy,
            iconColor: AppColors.primary,
          ),
          _buildDivider(),
          _buildMenuItem(
            Icons.settings_outlined,
            "Cài đặt",
            iconBg: AppColors.categoryProject,
            iconColor: Colors.blue,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SettingsScreen()),
              );
            },
          ),
          _buildDivider(),
          _buildMenuItem(
            Icons.language_outlined,
            "Ngôn ngữ",
            iconBg: AppColors.categoryPersonal,
            iconColor: Colors.orange,
            trailing: "Tiếng Việt",
          ),
          const SizedBox(height: 12),
          _buildLogoutItem(),
        ],
      ),
    );
  }

  Widget _buildDivider() {
    return Divider(
      height: 1,
      thickness: 1,
      color: Colors.grey.shade50,
      indent: 60,
      endIndent: 12,
    );
  }

  Widget _buildLogoutItem() {
    return GestureDetector(
      onTap: _isLoggingOut ? null : _handleLogout,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: const Color(0xFFFFF1F2),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (_isLoggingOut)
              const SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
                ),
              )
            else
              const Icon(Icons.logout_rounded, color: Colors.red, size: 24),
            const SizedBox(width: 12),
            Text(
              _isLoggingOut ? "Đang đăng xuất..." : "Đăng xuất",
              style: GoogleFonts.inter(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem(IconData icon, String title,
      {Color? iconBg,
      Color? iconColor,
      String? trailing,
      VoidCallback? onTap}) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: iconBg ?? const Color(0xFFF1F5F9),
                shape: BoxShape.circle,
              ),
              child: Icon(icon,
                  size: 22, color: iconColor ?? const Color(0xFF64748B)),
            ),
            const SizedBox(width: 16),
            Text(
              title,
              style: GoogleFonts.inter(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: AppColors.textDark,
              ),
            ),
            const Spacer(),
            if (trailing != null)
              Text(
                trailing,
                style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFF64748B),
                ),
              ),
            const SizedBox(width: 4),
            const Icon(Icons.chevron_right_rounded,
                size: 22, color: Color(0xFFCBD5E1)),
          ],
        ),
      ),
    );
  }
}
