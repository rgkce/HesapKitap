import 'package:flutter/material.dart';
import 'package:hesapkitap/core/theme/app_colors.dart';
import 'package:hesapkitap/core/theme/app_styles.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({super.key});

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  final _oldPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool _obscureOld = true;
  bool _obscureNew = true;
  bool _obscureConfirm = true;
  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      body: Container(
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
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset("assets/hk-logo.png", height: 200, width: 200),
                // Title
                Text(
                  "Şifreyi Değiştir",
                  style: AppStyles.heading1.copyWith(
                    color: isDark ? AppColors.secondary : AppColors.textLight,
                  ),
                ),
                const SizedBox(height: 30),
                // Old Password
                TextField(
                  controller: _oldPasswordController,
                  obscureText: _obscureOld,
                  style: AppStyles.buttonText.copyWith(
                    color: isDark ? AppColors.textLight : AppColors.textDark,
                  ),
                  decoration: InputDecoration(
                    hintText: "Mevcut Şifre",
                    hintStyle: AppStyles.buttonText.copyWith(
                      color: isDark ? AppColors.grey400 : AppColors.grey600,
                    ),
                    filled: true,
                    fillColor:
                        isDark
                            ? AppColors.grey800.withOpacity(0.3)
                            : AppColors.textLight.withOpacity(0.8),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide.none,
                    ),
                    prefixIcon: Icon(
                      Icons.email,
                      color: isDark ? AppColors.textLight : AppColors.primary,
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscureOld ? Icons.visibility_off : Icons.visibility,
                        color: isDark ? AppColors.textLight : AppColors.primary,
                      ),
                      onPressed:
                          () => setState(() => _obscureOld = !_obscureOld),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                // New Password
                TextField(
                  controller: _newPasswordController,
                  obscureText: _obscureNew,
                  style: AppStyles.buttonText.copyWith(
                    color: isDark ? AppColors.textLight : AppColors.textDark,
                  ),
                  decoration: InputDecoration(
                    hintText: "Yeni Şifre",
                    hintStyle: AppStyles.buttonText.copyWith(
                      color: isDark ? AppColors.grey400 : AppColors.grey600,
                    ),
                    filled: true,
                    fillColor:
                        isDark
                            ? AppColors.grey800.withOpacity(0.3)
                            : AppColors.textLight.withOpacity(0.8),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide.none,
                    ),
                    prefixIcon: Icon(
                      Icons.lock_outline,
                      color: isDark ? AppColors.textLight : AppColors.primary,
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscureNew ? Icons.visibility_off : Icons.visibility,
                        color: isDark ? AppColors.textLight : AppColors.primary,
                      ),
                      onPressed:
                          () => setState(() => _obscureNew = !_obscureNew),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                // Confirm Password
                TextField(
                  controller: _confirmPasswordController,
                  obscureText: _obscureConfirm,
                  style: AppStyles.buttonText.copyWith(
                    color: isDark ? AppColors.textLight : AppColors.textDark,
                  ),
                  decoration: InputDecoration(
                    hintText: "Yeni Şifre (Tekrar)",
                    hintStyle: AppStyles.buttonText.copyWith(
                      color: isDark ? AppColors.grey400 : AppColors.grey600,
                    ),
                    filled: true,
                    fillColor:
                        isDark
                            ? AppColors.grey800.withOpacity(0.3)
                            : AppColors.textLight.withOpacity(0.8),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide.none,
                    ),
                    prefixIcon: Icon(
                      Icons.lock_reset,
                      color: isDark ? AppColors.textLight : AppColors.primary,
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscureConfirm
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: isDark ? AppColors.textLight : AppColors.primary,
                      ),
                      onPressed:
                          () => setState(
                            () => _obscureConfirm = !_obscureConfirm,
                          ),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                // Update Button
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      elevation: 5,
                    ),
                    child: Ink(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [AppColors.primary, AppColors.accent],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Container(
                        alignment: Alignment.center,
                        child: Text(
                          "Şifreyi Güncelle",
                          textAlign: TextAlign.center,
                          style: AppStyles.buttonText.copyWith(fontSize: 16),
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 16),
                // Back to Profile Link
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Geri Dön",
                    style: TextStyle(
                      color: AppColors.textLight.withOpacity(0.9),
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
