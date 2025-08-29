import 'package:flutter/material.dart';
import 'package:hesapkitap/core/theme/app_colors.dart';
import 'package:hesapkitap/core/theme/app_styles.dart';
import 'package:hesapkitap/features/navigation/navbar.dart';

class RoleSelectionPage extends StatelessWidget {
  final String name;
  final String email;

  const RoleSelectionPage({super.key, required this.name, required this.email});

  void _confirmRole(BuildContext context, String role) {
    showDialog(
      context: context,
      builder:
          (_) => AlertDialog(
            title: Text(
              "Onay",
              style: AppStyles.heading1.copyWith(color: AppColors.grey800),
            ),
            content: Text(
              "Seçtiğiniz rol '$role'. Devam etmek istiyor musunuz?",
              style: AppStyles.heading3.copyWith(
                color: AppColors.grey800,
                fontSize: 18,
              ),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text(
                  "Hayır",
                  style: AppStyles.buttonText.copyWith(color: AppColors.error),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder:
                          (_) => BottomNavWrapper(
                            role: role,
                            name: name,
                            email: email,
                          ),
                    ),
                  );
                },
                child: Text(
                  "Evet",
                  style: AppStyles.buttonText.copyWith(
                    color: AppColors.success,
                  ),
                ),
              ),
            ],
          ),
    );
  }

  Widget _roleCard(
    BuildContext context,
    String role,
    IconData icon,
    bool isDark,
  ) {
    return GestureDetector(
      onTap: () => _confirmRole(context, role),
      child: Container(
        width: 200,
        padding: const EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.primary, AppColors.accent],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              offset: const Offset(0, 5),
              blurRadius: 10,
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 40, color: AppColors.textLight),
            const SizedBox(height: 10),
            Text(
              role,
              style: AppStyles.buttonText.copyWith(
                color: AppColors.textLight,
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;

    return WillPopScope(
      onWillPop: () async => false,
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Rol Seçimi",
                style: AppStyles.heading1.copyWith(color: AppColors.textLight),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              _roleCard(context, "Admin", Icons.admin_panel_settings, isDark),
              const SizedBox(height: 20),
              _roleCard(context, "Onaycı", Icons.check_circle_outline, isDark),
              const SizedBox(height: 20),
              _roleCard(context, "Kullanıcı", Icons.person_outline, isDark),
            ],
          ),
        ),
      ),
    );
  }
}
