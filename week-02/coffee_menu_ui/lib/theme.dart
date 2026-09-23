import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Hex Colors
  static const Color pageBackground = Color(0xFFFDFBF9);
  static const Color surfaceCard = Color(0xFFFFFFFF);
  static const Color primaryBrand = Color(0xFF6F4E37);
  static const Color accentCaramel = Color(0xFFD9A066);
  static const Color textPrimary = Color(0xFF2B2118);
  static const Color textSecondary = Color(0xFF6F6156);
  static const Color chipUnselected = Color(0xFFF1EAE4);

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
        // "Good morning" / Search placeholder / Drink subtitle
        bodyMedium: GoogleFonts.poppins(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: textSecondary,
        ),
        // "Sara"
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
        // Drink Subtitle
        bodySmall: GoogleFonts.poppins(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: textSecondary,
        ),
      ),
    );
  }
}
