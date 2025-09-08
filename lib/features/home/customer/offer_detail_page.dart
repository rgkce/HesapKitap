import 'package:flutter/material.dart';
import 'package:hesapkitap/core/theme/app_colors.dart';
import 'package:hesapkitap/core/theme/app_styles.dart';

class OfferDetailPage extends StatelessWidget {
  final Map<String, String> offer;

  const OfferDetailPage({super.key, required this.offer});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false, // Telefon geri butonunu engelle
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [AppColors.primary.withOpacity(0.9), AppColors.accent],
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
                  /// Geri Butonu
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context); // kendi geri işlemini uygula
                        },
                        child: const Icon(
                          Icons.arrow_back_ios,
                          color: AppColors.textLight,
                          size: 24,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        "Teklif Detayı",
                        style: AppStyles.heading2.copyWith(
                          color: AppColors.textLight,
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),

                  /// Teklif Bilgileri Kartı
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: AppColors.grey800.withOpacity(0.6),
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildInfoRow("Firma", offer["company"]!),
                        const SizedBox(height: 12),
                        _buildInfoRow("Teklif No", offer["id"]!),
                        const SizedBox(height: 12),
                        _buildInfoRow("Tarih", offer["date"]!),
                        const SizedBox(height: 12),
                        _buildInfoRow("Miktar", offer["amount"]!),
                        const SizedBox(height: 12),
                        _buildInfoRow("Durum", offer["status"]!),
                      ],
                    ),
                  ),

                  const SizedBox(height: 30),

                  /// Açıklama / Notlar
                  Text(
                    "Açıklama / Notlar",
                    style: AppStyles.heading2.copyWith(
                      color: AppColors.textLight,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: AppColors.grey800.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: Text(
                      offer["note"] ?? "Detay yok",
                      style: AppStyles.bodyText.copyWith(
                        color: AppColors.textLight.withOpacity(0.8),
                        fontSize: 14,
                      ),
                    ),
                  ),

                  const Spacer(),

                  /// İşlem Butonları
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            // Kabul işlemi
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.success,
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14),
                            ),
                          ),
                          child: Text(
                            "Kabul Et",
                            style: AppStyles.bodyTextBold.copyWith(
                              color: AppColors.grey100,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            // Reddet işlemi
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.error,
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14),
                            ),
                          ),
                          child: Text(
                            "Reddet",
                            style: AppStyles.bodyTextBold.copyWith(
                              color: AppColors.grey100,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Bilgi satırı
  Widget _buildInfoRow(String label, String value) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: Text(
            "$label:",
            style: AppStyles.bodyTextBold.copyWith(
              color: AppColors.textLight.withOpacity(0.8),
            ),
          ),
        ),
        Expanded(
          flex: 5,
          child: Text(
            value,
            style: AppStyles.bodyText.copyWith(
              color: AppColors.textLight,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
