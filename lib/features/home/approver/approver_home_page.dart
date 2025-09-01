import 'package:flutter/material.dart';
import 'package:hesapkitap/core/theme/app_colors.dart';
import 'package:hesapkitap/core/theme/app_styles.dart';
import 'package:hesapkitap/features/navigation/approver_navbar.dart';

class ApproverHomePage extends StatelessWidget {
  const ApproverHomePage({super.key});

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
                  "Hoşgeldiniz, Onaycı!",
                  style: AppStyles.heading2.copyWith(
                    color: AppColors.textLight,
                  ),
                ),
              ),
            ),
            ApproverNavBar(currentIndex: 1),
          ],
        ),
      ),
    );
  }
}
