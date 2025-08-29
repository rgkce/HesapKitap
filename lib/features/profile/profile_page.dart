import 'package:flutter/material.dart';
import 'package:hesapkitap/core/theme/app_colors.dart';
import 'package:hesapkitap/core/theme/app_styles.dart';

class ProfilePage extends StatelessWidget {
  final String name;
  final String email;
  final String role;
  final String company;

  const ProfilePage({
    super.key,
    required this.name,
    required this.email,
    required this.role,
    required this.company,
  });

  void _showConfirmationDialog(
    BuildContext context,
    String action,
    VoidCallback onConfirm,
  ) {
    showDialog(
      context: context,
      builder:
          (_) => AlertDialog(
            title: Text("$action Onayı"),
            content: Text("Bu işlemi yapmak istediğinizden emin misiniz?"),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("Hayır"),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  onConfirm();
                },
                child: const Text("Evet"),
              ),
            ],
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors:
              isDark
                  ? [AppColors.grey800, AppColors.primary.withOpacity(0.8)]
                  : [
                    AppColors.primary.withOpacity(0.8),
                    AppColors.accent.withOpacity(0.8),
                  ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            // Profil Fotoğrafı
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.textLight.withOpacity(0.2),
              ),
              child: const Icon(
                Icons.person,
                size: 80,
                color: AppColors.textLight,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              name,
              style: AppStyles.heading2.copyWith(color: AppColors.textLight),
            ),
            const SizedBox(height: 5),
            Text(
              email,
              style: AppStyles.bodyText.copyWith(color: AppColors.textLight),
            ),
            const SizedBox(height: 5),
            Text(
              role,
              style: AppStyles.bodyText.copyWith(color: AppColors.textLight),
            ),
            const SizedBox(height: 5),
            Text(
              company,
              style: AppStyles.bodyText.copyWith(color: AppColors.textLight),
            ),
            const SizedBox(height: 100),
            Column(
              children: [
                _customButton(
                  context: context,
                  text: "Şifre Değiştir",
                  icon: Icons.lock_open,
                  startColor: AppColors.info.withOpacity(0.9),
                  endColor: AppColors.info,
                  onPressed:
                      () => Navigator.pushNamed(context, '/change_password'),
                ),
                const SizedBox(height: 20),
                _customButton(
                  context: context,
                  text: "Çıkış Yap",
                  icon: Icons.logout,
                  startColor: AppColors.warning.withOpacity(0.9),
                  endColor: AppColors.warning,
                  onPressed:
                      () => Navigator.pushReplacementNamed(context, '/login'),
                ),
                const SizedBox(height: 20),
                _customButton(
                  context: context,
                  text: "Hesabı Sil",
                  icon: Icons.delete_forever,
                  startColor: AppColors.error.withOpacity(0.9),
                  endColor: AppColors.error,
                  onPressed:
                      () => Navigator.pushReplacementNamed(context, '/signup'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _customButton({
    required BuildContext context,
    required String text,
    required IconData icon,
    required Color startColor,
    required Color endColor,
    required VoidCallback onPressed,
  }) {
    return GestureDetector(
      onTap: () => _showConfirmationDialog(context, text, onPressed),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [startColor, endColor],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: AppColors.grey100, size: 25),
            const SizedBox(width: 10),
            Text(
              text,
              style: AppStyles.buttonText.copyWith(
                color: AppColors.grey100,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
