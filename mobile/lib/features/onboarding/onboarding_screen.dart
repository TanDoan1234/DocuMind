import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:documind_mobile/core/app_colors.dart';
import 'package:documind_mobile/shared/widgets/atoms/primary_button.dart';
import '../auth/login_screen.dart';

/// Màn hình giới thiệu (Onboarding) của DocuMind.
/// Điểm chạm đầu tiên với người dùng, sử dụng phong cách thiết kế organic.
class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(flex: 2),

              // 1. Hình ảnh minh họa & Linh vật (Illustration Section)
              _buildIllustrationSection(),

              const Spacer(flex: 1),

              // 2. Nội dung giới thiệu (Content Section)
              _buildContentSection(),

              const Spacer(flex: 2),

              // 3. Nút bấm bắt đầu (Action Section)
              _buildActionSection(context),

              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  /// Khu vực minh họa với các assets bay bổng
  Widget _buildIllustrationSection() {
    return SizedBox(
      height: 360,
      child: Stack(
        clipBehavior: Clip.none, // Quy tắc cứng: Không cắt decor overflow
        alignment: Alignment.center,
        children: [
          // Clouds - Phóng to & Tỏa ra
          Positioned(
            left: -80,
            top: 10,
            child: Opacity(
              opacity: 0.5,
              child: Image.asset("assets/decor/clouds/decor-cloud-mint-01.png", width: 180),
            ),
          ),
          Positioned(
            right: -90,
            bottom: 60,
            child: Opacity(
              opacity: 0.3,
              child: Image.asset("assets/decor/clouds/decor-cloud-mint-01.png", width: 200),
            ),
          ),
          // Botanical - Nhành lá organic
          Positioned(
            left: -40,
            bottom: 40,
            child: Transform.rotate(
              angle: -0.5,
              child: Image.asset("assets/decor/botanical/decor-leaf-sprig-01.png", width: 120),
            ),
          ),
          Positioned(
            right: -30,
            top: 60,
            child: Transform.rotate(
              angle: 0.5,
              child: Image.asset("assets/decor/botanical/decor-leaf-sprig-02.png", width: 110),
            ),
          ),
          // Mascot chính (Reading on books)
          Image.asset(
            "assets/mascot/mascot-owl-reading-on-books.png",
            width: 320,
            fit: BoxFit.contain,
          ),
        ],
      ),
    );
  }

  /// Phần văn bản giới thiệu
  Widget _buildContentSection() {
    return Column(
      children: [
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            style: GoogleFonts.outfit(
              fontSize: 36,
              fontWeight: FontWeight.bold,
              color: AppColors.textDark,
            ),
            children: [
              const TextSpan(text: "Học tập thông minh\n"),
              TextSpan(
                text: "cùng AI",
                style: GoogleFonts.outfit(color: AppColors.primary),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Text(
          "Ghi chú, tóm tắt, hỏi đáp và ôn tập dễ dàng hơn bao giờ hết.",
          textAlign: TextAlign.center,
          style: GoogleFonts.inter(
            fontSize: 16,
            height: 1.5,
            color: AppColors.textDark.withValues(alpha: 0.6),
          ),
        ),
      ],
    );
  }

  /// Nút bấm chuyển hướng sang Login
  Widget _buildActionSection(BuildContext context) {
    return PrimaryButton(
      text: "Bắt đầu",
      height: 60,
      borderRadius: 30,
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const LoginScreen()),
        );
      },
    );
  }
}
