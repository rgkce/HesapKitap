import 'package:flutter/material.dart';
import 'package:hesapkitap/core/theme/app_colors.dart';
import 'package:hesapkitap/core/theme/app_styles.dart';
import 'package:hesapkitap/features/navigation/custom_navbar.dart';

class CustomerHomePage extends StatelessWidget {
  const CustomerHomePage({super.key});

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
                  "Hoşgeldiniz, Müşteri!",
                  style: AppStyles.heading2.copyWith(
                    color: AppColors.textLight,
                  ),
                ),
              ),
            ),
            CustomerNavBar(currentIndex: 3),
          ],
        ),
      ),
    );
  }
}
