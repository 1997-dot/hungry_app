import 'package:flutter/material.dart';

class AppFonts {
  AppFonts._();

  // Font Family
  static const String fontFamily = 'Montserrat';

  // Font Weights
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight semiBold = FontWeight.w600;
  static const FontWeight bold = FontWeight.w700;

  // Font Sizes
  static const double size10 = 10.0;
  static const double size12 = 12.0;
  static const double size14 = 14.0;
  static const double size16 = 16.0;
  static const double size18 = 18.0;
  static const double size20 = 20.0;
  static const double size24 = 24.0;
  static const double size28 = 28.0;
  static const double size32 = 32.0;
  static const double size36 = 36.0;
  static const double size40 = 40.0;

  // Line Heights
  static const double lineHeight1_2 = 1.2;
  static const double lineHeight1_4 = 1.4;
  static const double lineHeight1_5 = 1.5;
  static const double lineHeight1_6 = 1.6;

  // Letter Spacing
  static const double letterSpacingTight = -0.5;
  static const double letterSpacingNormal = 0.0;
  static const double letterSpacingWide = 0.5;
}

class AppTextStyles {
  AppTextStyles._();

  // Headings
  static const TextStyle h1 = TextStyle(
    fontFamily: AppFonts.fontFamily,
    fontSize: AppFonts.size32,
    fontWeight: AppFonts.bold,
    height: AppFonts.lineHeight1_2,
  );

  static const TextStyle h2 = TextStyle(
    fontFamily: AppFonts.fontFamily,
    fontSize: AppFonts.size28,
    fontWeight: AppFonts.bold,
    height: AppFonts.lineHeight1_2,
  );

  static const TextStyle h3 = TextStyle(
    fontFamily: AppFonts.fontFamily,
    fontSize: AppFonts.size24,
    fontWeight: AppFonts.bold,
    height: AppFonts.lineHeight1_2,
  );

  static const TextStyle h4 = TextStyle(
    fontFamily: AppFonts.fontFamily,
    fontSize: AppFonts.size20,
    fontWeight: AppFonts.semiBold,
    height: AppFonts.lineHeight1_4,
  );

  static const TextStyle h5 = TextStyle(
    fontFamily: AppFonts.fontFamily,
    fontSize: AppFonts.size18,
    fontWeight: AppFonts.semiBold,
    height: AppFonts.lineHeight1_4,
  );

  static const TextStyle h6 = TextStyle(
    fontFamily: AppFonts.fontFamily,
    fontSize: AppFonts.size16,
    fontWeight: AppFonts.semiBold,
    height: AppFonts.lineHeight1_4,
  );

  // Body Text
  static const TextStyle bodyLarge = TextStyle(
    fontFamily: AppFonts.fontFamily,
    fontSize: AppFonts.size16,
    fontWeight: AppFonts.regular,
    height: AppFonts.lineHeight1_5,
  );

  static const TextStyle bodyMedium = TextStyle(
    fontFamily: AppFonts.fontFamily,
    fontSize: AppFonts.size14,
    fontWeight: AppFonts.regular,
    height: AppFonts.lineHeight1_5,
  );

  static const TextStyle bodySmall = TextStyle(
    fontFamily: AppFonts.fontFamily,
    fontSize: AppFonts.size12,
    fontWeight: AppFonts.regular,
    height: AppFonts.lineHeight1_5,
  );

  // Labels
  static const TextStyle labelLarge = TextStyle(
    fontFamily: AppFonts.fontFamily,
    fontSize: AppFonts.size14,
    fontWeight: AppFonts.medium,
    height: AppFonts.lineHeight1_4,
  );

  static const TextStyle labelMedium = TextStyle(
    fontFamily: AppFonts.fontFamily,
    fontSize: AppFonts.size12,
    fontWeight: AppFonts.medium,
    height: AppFonts.lineHeight1_4,
  );

  static const TextStyle labelSmall = TextStyle(
    fontFamily: AppFonts.fontFamily,
    fontSize: AppFonts.size10,
    fontWeight: AppFonts.medium,
    height: AppFonts.lineHeight1_4,
  );

  // Button Text
  static const TextStyle buttonLarge = TextStyle(
    fontFamily: AppFonts.fontFamily,
    fontSize: AppFonts.size16,
    fontWeight: AppFonts.semiBold,
    height: AppFonts.lineHeight1_4,
  );

  static const TextStyle buttonMedium = TextStyle(
    fontFamily: AppFonts.fontFamily,
    fontSize: AppFonts.size14,
    fontWeight: AppFonts.semiBold,
    height: AppFonts.lineHeight1_4,
  );

  static const TextStyle buttonSmall = TextStyle(
    fontFamily: AppFonts.fontFamily,
    fontSize: AppFonts.size12,
    fontWeight: AppFonts.semiBold,
    height: AppFonts.lineHeight1_4,
  );

  // Caption & Overline
  static const TextStyle caption = TextStyle(
    fontFamily: AppFonts.fontFamily,
    fontSize: AppFonts.size12,
    fontWeight: AppFonts.regular,
    height: AppFonts.lineHeight1_4,
  );

  static const TextStyle overline = TextStyle(
    fontFamily: AppFonts.fontFamily,
    fontSize: AppFonts.size10,
    fontWeight: AppFonts.medium,
    height: AppFonts.lineHeight1_4,
    letterSpacing: AppFonts.letterSpacingWide,
  );

  // Special Styles - App Specific

  // Logo/Brand Text (HUNGRY?)
  static const TextStyle brand = TextStyle(
    fontFamily: AppFonts.fontFamily,
    fontSize: AppFonts.size40,
    fontWeight: AppFonts.bold,
    height: AppFonts.lineHeight1_2,
  );

  // Greeting Text (Hello, Rich Sonic)
  static const TextStyle greeting = TextStyle(
    fontFamily: AppFonts.fontFamily,
    fontSize: AppFonts.size18,
    fontWeight: AppFonts.medium,
    height: AppFonts.lineHeight1_4,
  );

  // Product Title
  static const TextStyle productTitle = TextStyle(
    fontFamily: AppFonts.fontFamily,
    fontSize: AppFonts.size14,
    fontWeight: AppFonts.semiBold,
    height: AppFonts.lineHeight1_4,
  );

  // Product Subtitle (Restaurant name)
  static const TextStyle productSubtitle = TextStyle(
    fontFamily: AppFonts.fontFamily,
    fontSize: AppFonts.size12,
    fontWeight: AppFonts.regular,
    height: AppFonts.lineHeight1_4,
  );

  // Price Text
  static const TextStyle priceLarge = TextStyle(
    fontFamily: AppFonts.fontFamily,
    fontSize: AppFonts.size20,
    fontWeight: AppFonts.bold,
    height: AppFonts.lineHeight1_2,
  );

  static const TextStyle priceMedium = TextStyle(
    fontFamily: AppFonts.fontFamily,
    fontSize: AppFonts.size16,
    fontWeight: AppFonts.bold,
    height: AppFonts.lineHeight1_2,
  );

  static const TextStyle priceSmall = TextStyle(
    fontFamily: AppFonts.fontFamily,
    fontSize: AppFonts.size14,
    fontWeight: AppFonts.semiBold,
    height: AppFonts.lineHeight1_2,
  );

  // Rating Text
  static const TextStyle rating = TextStyle(
    fontFamily: AppFonts.fontFamily,
    fontSize: AppFonts.size12,
    fontWeight: AppFonts.medium,
    height: AppFonts.lineHeight1_4,
  );

  // Chip/Category Text
  static const TextStyle chip = TextStyle(
    fontFamily: AppFonts.fontFamily,
    fontSize: AppFonts.size12,
    fontWeight: AppFonts.medium,
    height: AppFonts.lineHeight1_4,
  );

  // Input Field Text
  static const TextStyle input = TextStyle(
    fontFamily: AppFonts.fontFamily,
    fontSize: AppFonts.size14,
    fontWeight: AppFonts.regular,
    height: AppFonts.lineHeight1_5,
  );

  // Input Hint Text
  static const TextStyle inputHint = TextStyle(
    fontFamily: AppFonts.fontFamily,
    fontSize: AppFonts.size14,
    fontWeight: AppFonts.regular,
    height: AppFonts.lineHeight1_5,
  );

  // Input Label Text
  static const TextStyle inputLabel = TextStyle(
    fontFamily: AppFonts.fontFamily,
    fontSize: AppFonts.size12,
    fontWeight: AppFonts.medium,
    height: AppFonts.lineHeight1_4,
  );

  // Section Title
  static const TextStyle sectionTitle = TextStyle(
    fontFamily: AppFonts.fontFamily,
    fontSize: AppFonts.size16,
    fontWeight: AppFonts.semiBold,
    height: AppFonts.lineHeight1_4,
  );

  // Success Message
  static const TextStyle success = TextStyle(
    fontFamily: AppFonts.fontFamily,
    fontSize: AppFonts.size24,
    fontWeight: AppFonts.bold,
    height: AppFonts.lineHeight1_2,
  );
}

/// Extension for TextStyle modifications
extension TextStyleExtension on TextStyle {
  TextStyle get withPrimaryColor => copyWith(color: const Color(0xFF1B4D3E));
  TextStyle get withSecondaryColor => copyWith(color: const Color(0xFF757575));
  TextStyle get withWhiteColor => copyWith(color: const Color(0xFFFFFFFF));
  TextStyle get withErrorColor => copyWith(color: const Color(0xFFE53935));
  TextStyle get withSuccessColor => copyWith(color: const Color(0xFF4CAF50));

  TextStyle withColor(Color color) => copyWith(color: color);
  TextStyle withSize(double size) => copyWith(fontSize: size);
  TextStyle withWeight(FontWeight weight) => copyWith(fontWeight: weight);
}
