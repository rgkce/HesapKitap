import 'package:flutter/material.dart';
import 'package:hesapkitap/core/theme/app_colors.dart';
import 'package:hesapkitap/core/theme/app_styles.dart';

class AdminHomePage extends StatelessWidget {
  const AdminHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;

    return WillPopScope(
      onWillPop: () async => false, // Geri gitmeyi engelle
      child: Scaffold(
        body: Container(
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
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Başlık
                  Text(
                    "Admin Paneli",
                    style: AppStyles.heading1.copyWith(
                      color: isDark ? AppColors.textLight : AppColors.textLight,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 30),

                  // Örnek kartlar / butonlar
                  Expanded(
                    child: GridView.count(
                      crossAxisCount: 2,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      children: [
                        _buildFeatureCard(
                          context,
                          title: "Kullanıcı Yönetimi",
                          icon: Icons.people,
                          onTap: () {},
                        ),
                        _buildFeatureCard(
                          context,
                          title: "Tedarikçi Yönetimi",
                          icon: Icons.store,
                          onTap: () {},
                        ),
                        _buildFeatureCard(
                          context,
                          title: "Satınalma Talepleri",
                          icon: Icons.request_page,
                          onTap: () {},
                        ),
                        _buildFeatureCard(
                          context,
                          title: "Raporlar & Analitik",
                          icon: Icons.bar_chart,
                          onTap: () {},
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFeatureCard(
    BuildContext context, {
    required String title,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: () => _showConfirmDialog(context, title, onTap),
      borderRadius: BorderRadius.circular(15),
      child: Ink(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.primary, AppColors.accent],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 5,
              offset: const Offset(2, 2),
            ),
          ],
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 50, color: AppColors.textLight),
              const SizedBox(height: 10),
              Text(
                title,
                style: AppStyles.heading3.copyWith(color: AppColors.textLight),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showConfirmDialog(
    BuildContext context,
    String title,
    VoidCallback onConfirm,
  ) {
    showDialog(
      context: context,
      builder:
          (_) => AlertDialog(
            title: Text("Emin misiniz?"),
            content: Text(
              "$title sayfasına gitmek istediğinizden emin misiniz?",
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("Hayır"),
              ),
              TextButton(
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
}
