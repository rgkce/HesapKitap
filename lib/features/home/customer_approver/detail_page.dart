import 'package:flutter/material.dart';
import 'package:hesapkitap/core/theme/app_colors.dart';
import 'package:hesapkitap/core/theme/app_styles.dart';

class DetailPage extends StatelessWidget {
  final Map<String, dynamic> offer;

  const DetailPage({super.key, required this.offer});

  /// amount temizleme metodu
  double _parseAmount(String? rawAmount) {
    if (rawAmount == null) return 0.0;
    String cleaned = rawAmount.replaceAll(RegExp(r'[^0-9.]'), '');
    return double.tryParse(cleaned) ?? 0.0;
  }

  /// Reddetme popup'ı
  void _showRejectDialog(BuildContext context) {
    final TextEditingController reasonController = TextEditingController();
    final bool isDark = Theme.of(context).brightness == Brightness.dark;

    showDialog(
      context: context,
      builder: (ctx) {
        return AlertDialog(
          backgroundColor: isDark ? AppColors.grey800 : AppColors.grey100,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title: Text(
            "Teklifi Reddet",
            style: AppStyles.heading2.copyWith(
              color: isDark ? AppColors.grey200 : AppColors.grey800,
            ),
          ),
          content: TextField(
            controller: reasonController,
            maxLines: 3,
            decoration: InputDecoration(
              hintText: "Reddetme sebebinizi yazın...",
              hintStyle: TextStyle(
                color:
                    isDark
                        ? AppColors.grey200.withOpacity(0.7)
                        : AppColors.grey600,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              filled: true,
              fillColor:
                  isDark
                      ? AppColors.grey800.withOpacity(0.6)
                      : AppColors.grey200.withOpacity(0.3),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(ctx),
              child: Text(
                "İptal",
                style: AppStyles.bodyTextBold.copyWith(
                  color: AppColors.warning,
                ),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: AppColors.error),
              onPressed: () {
                final reason = reasonController.text.trim();
                Navigator.pop(ctx);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      reason.isNotEmpty
                          ? "Teklif reddedildi. Sebep: $reason"
                          : "Teklif reddedildi.",
                    ),
                  ),
                );
                // TODO: Burada backend'e reddetme sebebi gönderilebilir
              },
              child: Text(
                "Onayla",
                style: AppStyles.bodyTextBold.copyWith(
                  color: AppColors.grey100,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double parsedAmount = _parseAmount(offer["amount"]);

    return WillPopScope(
      onWillPop: () async => false,
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
                          Navigator.pop(context);
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
                        _buildInfoRow("Firma", offer["company"] ?? "-"),
                        const SizedBox(height: 12),
                        _buildInfoRow("Teklif No", offer["id"] ?? "-"),
                        const SizedBox(height: 12),
                        _buildInfoRow("Tarih", offer["date"] ?? "-"),
                        const SizedBox(height: 12),
                        _buildInfoRow(
                          "Miktar",
                          "${offer["amount"] ?? "-"} (≈ $parsedAmount)",
                        ),
                        const SizedBox(height: 12),
                        _buildInfoRow("Durum", offer["status"] ?? "-"),
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
                            _showRejectDialog(context);
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
