import 'package:flutter/material.dart';
import 'package:hesapkitap/core/theme/app_colors.dart';
import 'package:hesapkitap/core/theme/app_styles.dart';
import 'package:hesapkitap/features/navigation/approver_navbar.dart';

class ApproverRequestsPage extends StatelessWidget {
  const ApproverRequestsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;

    final List<Map<String, String>> requests = [
      {"id": "REQ-001", "desc": "Satın alma talebi - Laptop"},
      {"id": "REQ-002", "desc": "Ofis malzemesi - Kalem"},
      {"id": "REQ-003", "desc": "Yazılım lisansı"},
    ];

    return WillPopScope(
      onWillPop: () async => false,
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Onay Bekleyen Talepler",
                    style: AppStyles.heading1.copyWith(color: Colors.white),
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    child: ListView.builder(
                      itemCount: requests.length,
                      itemBuilder: (context, index) {
                        final req = requests[index];
                        return Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: ListTile(
                            title: Text(
                              req["desc"]!,
                              style: AppStyles.bodyText.copyWith(
                                color:
                                    isDark
                                        ? AppColors.grey100
                                        : AppColors.grey800,
                              ),
                            ),
                            subtitle: Text(
                              req["id"]!,
                              style: AppStyles.bodyText.copyWith(
                                color:
                                    isDark
                                        ? AppColors.grey100
                                        : AppColors.grey800,
                              ),
                            ),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  icon: const Icon(
                                    Icons.check_circle,
                                    color: AppColors.success,
                                  ),
                                  onPressed: () {
                                    // Onayla
                                  },
                                ),
                                IconButton(
                                  icon: const Icon(
                                    Icons.cancel,
                                    color: AppColors.error,
                                  ),
                                  onPressed: () {
                                    // Reddet
                                  },
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: const ApproverNavBar(currentIndex: 1),
      ),
    );
  }
}
