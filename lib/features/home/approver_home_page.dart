import 'package:flutter/material.dart';
import 'package:hesapkitap/core/theme/app_colors.dart';
import 'package:hesapkitap/core/theme/app_styles.dart';

class ApproverHomePage extends StatelessWidget {
  const ApproverHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Onaycı Paneli"),
        backgroundColor: AppColors.primary,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => Navigator.pushReplacementNamed(context, '/login'),
          ),
        ],
      ),
      body: Center(
        child: Text(
          "Hoşgeldiniz, Onaycı!",
          style: AppStyles.heading2.copyWith(
            color: isDark ? AppColors.textLight : AppColors.textDark,
          ),
        ),
      ),
    );
  }
}
