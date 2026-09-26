import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Colors
  static const Color pageBackground = Color(0xFFFDFBF9);
  static const Color surfaceCard = Color(0xFFFFFFFF);
  static const Color primaryBrand = Color(0xFF6F4E37);
  static const Color accentCaramel = Color(0xFFD9A066);
  static const Color textPrimary = Color(0xFF2B2118);
  static const Color textSecondary = Color(0xFF6F6156);
  static const Color chipUnselected = Color(0xFFF1EAE4);
  static const Color onBrand = Colors.white;

  // Shadows and offer colors
static final Color cardShadow = Colors.black.withValues(alpha: 0.06);
static final Color offerCircleStrong = Colors.white.withValues(alpha: 0.07);
static final Color offerCircleSoft = Colors.white.withValues(alpha: 0.05);
static final Color offerSubtitleColor = Colors.white.withValues(alpha: 0.9);
static final Color offerPillBackground = Colors.white.withValues(alpha: 0.18);
static final Color offerBadgeShadow = Colors.black.withValues(alpha: 0.12);
  // Offer text styles
  static final TextStyle offerHeadlineStyle = GoogleFonts.poppins(
    fontSize: 20,
    fontWeight: FontWeight.w700,
    color: onBrand,
    height: 1.2,
  );

  static final TextStyle offerSubtitleStyle = GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: offerSubtitleColor,
    height: 1.2,
  );

  static final TextStyle offerBadgeStyle = GoogleFonts.poppins(
    fontSize: 18,
    fontWeight: FontWeight.w800,
    color: textPrimary,
  );

  static final TextStyle offerPillStyle = GoogleFonts.poppins(
    fontSize: 11,
    fontWeight: FontWeight.w500,
    color: onBrand,
  );

  static ThemeData get lightTheme {
    return ThemeData(
      scaffoldBackgroundColor: pageBackground,
      primaryColor: primaryBrand,
      colorScheme: const ColorScheme.light(
        primary: primaryBrand,
        secondary: accentCaramel,
        surface: surfaceCard,
        onSurface: textPrimary,
      ),
      textTheme: TextTheme(
        // "Good morning" / Search placeholder
        bodyMedium: GoogleFonts.poppins(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: textSecondary,
        ),

        // Greeting name
        headlineMedium: GoogleFonts.poppins(
          fontSize: 22,
          fontWeight: FontWeight.w600,
          color: textPrimary,
        ),

        // Section title ("Popular")
        titleLarge: GoogleFonts.poppins(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: textPrimary,
        ),

        // Drink name
        titleMedium: GoogleFonts.poppins(
          fontSize: 15,
          fontWeight: FontWeight.w600,
          color: textPrimary,
        ),

        // "See all" / Chip labels
        labelLarge: GoogleFonts.poppins(
          fontSize: 13,
          fontWeight: FontWeight.w500,
          color: primaryBrand,
        ),

        // Price
        bodyLarge: GoogleFonts.poppins(
          fontSize: 16,
          fontWeight: FontWeight.w700,
          color: primaryBrand,
        ),

        // Drink subtitle
        bodySmall: GoogleFonts.poppins(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: textSecondary,
        ),
      ),
    );
  }
}