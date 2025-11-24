import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // Primary Colors
  static const Color primary = Color(0xFF1B4D3E);
  static const Color primaryLight = Color(0xFF2E7D5E);
  static const Color primaryDark = Color(0xFF0D3B2E);

  // Background Colors
  static const Color background = Color(0xFFFFFFFF);
  static const Color backgroundDark = Color(0xFF1B4D3E);
  static const Color backgroundBlack = Color(0xFF000000);
  static const Color backgroundGrey = Color(0xFFF5F5F5);
  static const Color scaffoldBackground = Color(0xFFFFFFFF);

  // Splash Screen
  static const Color splashBackground = Color(0xFF08431D);

  // Surface Colors
  static const Color surface = Color(0xFFFFFFFF);
  static const Color surfaceVariant = Color(0xFFF5F5F5);

  // Text Colors
  static const Color textPrimary = Color(0xFF1B4D3E);
  static const Color textSecondary = Color(0xFF757575);
  static const Color textHint = Color(0xFF9E9E9E);
  static const Color textLight = Color(0xFFFFFFFF);
  static const Color textDark = Color(0xFF212121);

  // Button Colors
  static const Color buttonPrimary = Color(0xFF1B4D3E);
  static const Color buttonSecondary = Color(0xFFFFFFFF);
  static const Color buttonDanger = Color(0xFFE53935);
  static const Color buttonDisabled = Color(0xFFBDBDBD);

  // Input Field Colors
  static const Color inputBackground = Color(0xFFF5F5F5);
  static const Color inputBackgroundLight = Color(0xFFE8F5E9);
  static const Color inputBorder = Color(0xFFE0E0E0);
  static const Color inputBorderFocused = Color(0xFF1B4D3E);

  // Status Colors
  static const Color success = Color(0xFF4CAF50);
  static const Color successLight = Color(0xFFE8F5E9);
  static const Color error = Color(0xFFE53935);
  static const Color errorLight = Color(0xFFFFEBEE);
  static const Color warning = Color(0xFFFFC107);
  static const Color warningLight = Color(0xFFFFF8E1);
  static const Color info = Color(0xFF2196F3);
  static const Color infoLight = Color(0xFFE3F2FD);

  // Rating Colors
  static const Color ratingStar = Color(0xFFFFC107);
  static const Color ratingStarEmpty = Color(0xFFE0E0E0);

  // Border & Divider Colors
  static const Color border = Color(0xFFE0E0E0);
  static const Color divider = Color(0xFFEEEEEE);

  // Chip Colors
  static const Color chipSelected = Color(0xFF1B4D3E);
  static const Color chipUnselected = Color(0xFFFFFFFF);
  static const Color chipBorder = Color(0xFFE0E0E0);

  // Card Colors
  static const Color cardBackground = Color(0xFFFFFFFF);
  static const Color cardShadow = Color(0x1A000000);

  // Icon Colors
  static const Color iconPrimary = Color(0xFF1B4D3E);
  static const Color iconSecondary = Color(0xFF757575);
  static const Color iconLight = Color(0xFFFFFFFF);

  // Overlay Colors
  static const Color overlay = Color(0x80000000);
  static const Color overlayLight = Color(0x1A000000);

  // Bottom Navigation Colors
  static const Color navBarBackground = Color(0xFFFFFFFF);
  static const Color navBarSelected = Color(0xFF1B4D3E);
  static const Color navBarUnselected = Color(0xFF757575);

  // Quantity Button Colors
  static const Color quantityButtonBackground = Color(0xFF1B4D3E);
  static const Color quantityButtonText = Color(0xFFFFFFFF);

  // Payment Method Colors
  static const Color paymentSelected = Color(0xFF1B4D3E);
  static const Color paymentUnselected = Color(0xFFFFFFFF);
  static const Color paymentBorder = Color(0xFFE0E0E0);

  // Spicy Slider Colors
  static const Color sliderActive = Color(0xFF1B4D3E);
  static const Color sliderInactive = Color(0xFFE0E0E0);
  static const Color sliderThumb = Color(0xFF1B4D3E);
}

/// Extension for color opacity variations
extension AppColorExtension on Color {
  Color get withOpacity10 => withValues(alpha: 0.1);
  Color get withOpacity20 => withValues(alpha: 0.2);
  Color get withOpacity30 => withValues(alpha: 0.3);
  Color get withOpacity40 => withValues(alpha: 0.4);
  Color get withOpacity50 => withValues(alpha: 0.5);
  Color get withOpacity60 => withValues(alpha: 0.6);
  Color get withOpacity70 => withValues(alpha: 0.7);
  Color get withOpacity80 => withValues(alpha: 0.8);
  Color get withOpacity90 => withValues(alpha: 0.9);
}
