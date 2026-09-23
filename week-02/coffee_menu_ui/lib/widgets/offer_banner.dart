import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme.dart';

class OfferBanner extends StatelessWidget {
  const OfferBanner({super.key});

  @override
  Widget build(BuildContext context) {
    // 1. ClipRRect: تقليم الدوائر الزائدة لتبقى داخل الحدود المنحنية للبطاقة (radius 16)
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppTheme.primaryBrand, // اللون البني الأساسي (#6F4E37)
          borderRadius: BorderRadius.circular(16),
        ),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            // 2. Stack + Positioned: الدوائر الخفيفة خلف العناصر الممتدة للطرف الأيمن
            Positioned(
              right: -50,
              top: -40,
              child: Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white.withOpacity(0.07),
                ),
              ),
            ),
            Positioned(
              right: 45,
              bottom: -50,
              child: Container(
                width: 88,
                height: 88,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white.withOpacity(0.05),
                ),
              ),
            ),

            // المحتوى الرئيسي للبطاقة (النصوص والكبسولات)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                // 3. Text.rich + TextSpan: دمج النص العريض مع النص الخفيف على نفس الامتداد
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.55,
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'Save 50% ',
                          style: GoogleFonts.poppins(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                            height: 1.2,
                          ),
                        ),
                        TextSpan(
                          text: 'on your first\norder',
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.white.withOpacity(0.9),
                            height: 1.2,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 14),

                // 4. Wrap: الكبسولات الصغيرة التفافية لتفادي أي overflow
                const Wrap(
                  spacing: 8,
                  runSpacing: 6,
                  children: [
                    _OfferPill(label: 'Code AREISTO'),
                    _OfferPill(label: 'Today only'),
                  ],
                ),
              ],
            ),

            // 5. Transform.rotate: شارة الخصم المائلة (-50%) جهة اليمين
            Positioned(
              right: 12,
              top: 22,
              child: Transform.rotate(
                angle: -0.5, // إمالة بمقدار -5 درجات // إمالة بزاوية دائريّة دقيقة كما في التصميم
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: AppTheme.accentCaramel, // لون الكاراميل (#D9A066)
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.12),
                        blurRadius: 8,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Text(
                    '-50%',
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                      color: AppTheme.textPrimary,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// كبسولة معلومات العرض الفرعية
class _OfferPill extends StatelessWidget {
  final String label;

  const _OfferPill({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.18),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: GoogleFonts.poppins(
          fontSize: 11,
          fontWeight: FontWeight.w500,
          color: Colors.white,
        ),
      ),
    );
  }
}