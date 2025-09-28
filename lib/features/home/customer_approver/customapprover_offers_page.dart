import 'package:flutter/material.dart';
import 'package:hesapkitap/core/theme/app_colors.dart';
import 'package:hesapkitap/core/theme/app_styles.dart';
import 'package:hesapkitap/features/home/customer_approver/detail_page.dart';
import 'package:hesapkitap/features/navigation/customerapprover_navbar.dart';

class CustomApproverOffersPage extends StatefulWidget {
  const CustomApproverOffersPage({super.key});

  @override
  State<CustomApproverOffersPage> createState() =>
      _CustomApproverOffersPageState();
}

class _CustomApproverOffersPageState extends State<CustomApproverOffersPage> {
  String selectedPeriod = "Son 7 gün";
  String selectedStatus = "Tümü";

  final List<Map<String, dynamic>> offers = [
    {
      "id": "T001",
      "company": "ABC Ltd.",
      "amount": "25000",
      "date": "01.09.2025",
      "status": "Kabul",
    },
    {
      "id": "T002",
      "company": "XYZ A.Ş.",
      "amount": "12500",
      "date": "05.09.2025",
      "status": "Bekliyor",
    },
    {
      "id": "T003",
      "company": "Delta Corp.",
      "amount": "8000",
      "date": "07.09.2025",
      "status": "Reddedildi",
    },
  ];

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;

    // 🔹 En iyi teklifi bul (minimum fiyat)
    double minAmount = offers
        .map((e) => double.tryParse(e["amount"].toString()) ?? double.infinity)
        .reduce((a, b) => a < b ? a : b);

    Map<String, dynamic> bestOffer = offers.firstWhere(
      (e) => double.parse(e["amount"]) == minAmount,
    );

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors:
                  isDark
                      ? [AppColors.grey800, AppColors.primary.withOpacity(0.8)]
                      : [AppColors.primary.withOpacity(0.8), AppColors.accent],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Başlık
                  Center(
                    child: Text(
                      "Teklifler",
                      style: AppStyles.heading1.copyWith(
                        color: AppColors.textLight,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  /// Filtreler
                  Row(
                    children: [
                      _buildDropdown(
                        value: selectedPeriod,
                        items: ["Son 7 gün", "Son 1 ay", "Tüm Teklifler"],
                        onChanged: (v) => setState(() => selectedPeriod = v!),
                      ),
                      const SizedBox(width: 12),
                      _buildDropdown(
                        value: selectedStatus,
                        items: ["Tümü", "Kabul", "Reddedildi", "Bekliyor"],
                        onChanged: (v) => setState(() => selectedStatus = v!),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),

                  /// Özet Kartlar
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildSummaryCard("Kabul", "15", [
                        AppColors.success,
                        AppColors.info,
                      ]),
                      _buildSummaryCard("Reddedildi", "6", [
                        AppColors.error,
                        AppColors.warning,
                      ]),
                      _buildSummaryCard("Bekleyen", "9", [
                        AppColors.warning,
                        AppColors.secondary,
                      ]),
                    ],
                  ),

                  const SizedBox(height: 20),

                  /// Teklif Listesi
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: AppColors.grey800.withOpacity(0.6),
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: ListView(
                        children: [
                          /// Teklif listesi
                          ...offers.map((offer) {
                            Color statusColor =
                                offer["status"] == "Kabul"
                                    ? AppColors.success
                                    : offer["status"] == "Reddedildi"
                                    ? AppColors.error
                                    : AppColors.warning;

                            return Container(
                              margin: const EdgeInsets.only(bottom: 10),
                              padding: const EdgeInsets.symmetric(
                                vertical: 8,
                                horizontal: 12,
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.grey600.withOpacity(0.4),
                                borderRadius: BorderRadius.circular(14),
                              ),
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    backgroundColor: AppColors.accent
                                        .withOpacity(0.2),
                                    child: const Icon(
                                      Icons.description,
                                      color: AppColors.accent,
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "${offer["company"]} - ${offer["amount"]} ₺",
                                          style: AppStyles.bodyTextBold
                                              .copyWith(
                                                color: AppColors.textLight,
                                                fontSize: 15,
                                              ),
                                        ),
                                        const SizedBox(height: 4),
                                        Text(
                                          "No: ${offer["id"]} • ${offer["date"]}",
                                          style: AppStyles.bodyText.copyWith(
                                            color: AppColors.textLight
                                                .withOpacity(0.7),
                                            fontSize: 12,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 4,
                                      horizontal: 10,
                                    ),
                                    decoration: BoxDecoration(
                                      color: statusColor.withOpacity(0.15),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Text(
                                      offer["status"],
                                      style: TextStyle(
                                        color: statusColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  IconButton(
                                    icon: const Icon(Icons.info_outline),
                                    color: AppColors.info,
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder:
                                              (_) => DetailPage(offer: offer),
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              ),
                            );
                          }),

                          const SizedBox(height: 20),

                          /// Teklif Karşılaştırma Bölümü
                          Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: AppColors.grey800.withOpacity(0.6),
                              borderRadius: BorderRadius.circular(18),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Teklif Karşılaştırma",
                                  style: AppStyles.heading2.copyWith(
                                    color: AppColors.textLight,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 12),
                                ...offers.map((offer) {
                                  bool isBest =
                                      double.parse(offer["amount"]) ==
                                      minAmount;
                                  return Container(
                                    margin: const EdgeInsets.symmetric(
                                      vertical: 6,
                                    ),
                                    padding: const EdgeInsets.all(12),
                                    decoration: BoxDecoration(
                                      color:
                                          isBest
                                              ? AppColors.success.withOpacity(
                                                0.2,
                                              )
                                              : AppColors.grey600.withOpacity(
                                                0.3,
                                              ),
                                      borderRadius: BorderRadius.circular(14),
                                      border:
                                          isBest
                                              ? Border.all(
                                                color: AppColors.success,
                                                width: 2,
                                              )
                                              : null,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          offer["company"],
                                          style: AppStyles.bodyTextBold
                                              .copyWith(
                                                color: AppColors.textLight,
                                              ),
                                        ),
                                        Text(
                                          "${offer["amount"]} ₺",
                                          style: AppStyles.bodyText.copyWith(
                                            color:
                                                isBest
                                                    ? AppColors.success
                                                    : AppColors.textLight,
                                            fontWeight:
                                                isBest
                                                    ? FontWeight.bold
                                                    : FontWeight.normal,
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                }).toList(),
                                const SizedBox(height: 12),
                                Text(
                                  "En İyi Teklif: ${bestOffer["company"]} (${bestOffer["amount"]} ₺)",
                                  style: AppStyles.bodyTextBold.copyWith(
                                    color: AppColors.success,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: const CustomApproverNavBar(currentIndex: 1),
      ),
    );
  }

  /// 📌 Özet Kart
  Widget _buildSummaryCard(
    String title,
    String value,
    List<Color> gradientColors,
  ) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 6),
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: gradientColors,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
              color: gradientColors.last.withOpacity(0.4),
              blurRadius: 10,
              offset: const Offset(2, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: AppStyles.bodyTextBold.copyWith(
                color: AppColors.textLight,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              value,
              style: AppStyles.heading2.copyWith(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// 📌 Dropdown
  Widget _buildDropdown({
    required String value,
    required List<String> items,
    required void Function(String?) onChanged,
  }) {
    return DropdownButton<String>(
      value: value,
      dropdownColor: AppColors.grey800,
      items:
          items
              .map(
                (e) => DropdownMenuItem(
                  value: e,
                  child: Text(
                    e,
                    style: AppStyles.bodyText.copyWith(
                      color: AppColors.textLight,
                    ),
                  ),
                ),
              )
              .toList(),
      onChanged: onChanged,
    );
  }
}
