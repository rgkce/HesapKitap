import 'package:flutter/material.dart';
import 'package:hesapkitap/core/theme/app_colors.dart';
import 'package:hesapkitap/core/theme/app_styles.dart';
import 'package:hesapkitap/features/navigation/user_navbar.dart';

class UserHomePage extends StatelessWidget {
  const UserHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.primary, AppColors.accent],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: Text(
                  "Hoşgeldiniz, Kullanıcı!",
                  style: AppStyles.heading2.copyWith(
                    color: AppColors.textLight,
                  ),
                ),
              ),
            ),
            UserNavBar(currentIndex: 2),
          ],
        ),
      ),
    );
  }
}
