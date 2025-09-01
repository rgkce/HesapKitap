import 'package:flutter/material.dart';
import 'package:hesapkitap/core/theme/app_colors.dart';
import 'package:hesapkitap/core/theme/app_styles.dart';
import 'package:hesapkitap/features/navigation/admin_navbar.dart';

class AdminUsersPage extends StatelessWidget {
  const AdminUsersPage({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;

    return WillPopScope(
      onWillPop: () async => false, // Geri gitmeyi engelle
      child: Scaffold(
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
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Center(
                    child: Text(
                      "Kullanıcı Yönetimi",
                      style: AppStyles.heading1.copyWith(
                        color: AppColors.textLight,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Arama alanı
                  TextField(
                    style: AppStyles.bodyText.copyWith(
                      color: AppColors.textLight,
                    ),
                    decoration: InputDecoration(
                      hintText: "Kullanıcı Ara",
                      hintStyle: AppStyles.bodyText.copyWith(
                        color: AppColors.grey400,
                      ),
                      prefixIcon: const Icon(
                        Icons.search,
                        color: AppColors.textLight,
                      ),
                      filled: true,
                      fillColor: AppColors.grey800.withOpacity(0.3),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    child: ListView(
                      children: [
                        _buildUserCard(
                          "Ahmet Yılmaz",
                          "ahmet@example.com",
                          "Admin",
                        ),
                        _buildUserCard(
                          "Mehmet Can",
                          "mehmet@example.com",
                          "Satınalma",
                        ),
                        _buildUserCard(
                          "Ayşe Demir",
                          "ayse@example.com",
                          "Müşteri",
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton.icon(
                    onPressed: () {
                      // Kullanıcı ekleme sayfasına yönlendirme
                    },
                    icon: const Icon(
                      Icons.person_add,
                      color: AppColors.grey100,
                    ),
                    label: Text(
                      "Yeni Kullanıcı Ekle",
                      style: AppStyles.buttonText.copyWith(
                        color: AppColors.grey100,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.info,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 15,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: const AdminNavBar(currentIndex: 1),
      ),
    );
  }

  Widget _buildUserCard(String name, String email, String role) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: AppColors.grey800.withOpacity(0.4),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: AppStyles.bodyTextBold.copyWith(
                  color: AppColors.textLight,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                email,
                style: AppStyles.bodyText.copyWith(color: AppColors.textLight),
              ),
            ],
          ),
          Text(
            role,
            style: AppStyles.bodyTextBold.copyWith(color: AppColors.secondary),
          ),
        ],
      ),
    );
  }
}
