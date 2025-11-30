import 'package:flutter/material.dart';
import 'app_colors.dart';

/// AppFonts - Typography system for the Hungry app
///
/// This file completes the design system along with app_colors.dart and app_theme.dart.
/// It defines the single source of truth for all text styles in the application.
///
/// Structure:
/// - Font families
/// - Font weights
/// - Font sizes (design tokens)
/// - Line heights
/// - Letter spacing
/// - Base text style
/// - Semantic text styles (Material Design compliant)
/// - App-specific text styles
/// - Text theme exports for app_theme.dart
/// - Utility extensions

// ==============================================================================
// FONT CONFIGURATION
// ==============================================================================

/// Font family constants
class AppFontFamily {
  AppFontFamily._();

  /// Primary font family - Montserrat
  /// Used throughout the entire application
  static const String primary = 'Montserrat';

  /// You can add secondary font families here if needed
  /// static const String secondary = 'Roboto';
}

/// Font weight constants
class AppFontWeight {
  AppFontWeight._();

  /// Light weight (300)
  static const FontWeight light = FontWeight.w300;

  /// Regular weight (400)
  static const FontWeight regular = FontWeight.w400;

  /// Medium weight (500)
  static const FontWeight medium = FontWeight.w500;

  /// Semi-bold weight (600)
  static const FontWeight semiBold = FontWeight.w600;

  /// Bold weight (700)
  static const FontWeight bold = FontWeight.w700;

  /// Extra bold weight (800)
  static const FontWeight extraBold = FontWeight.w800;
}

/// Font size constants (design tokens)
class AppFontSize {
  AppFontSize._();

  /// 10px - Very small text (tags, overlines)
  static const double size10 = 10.0;

  /// 12px - Small text (captions, labels, ratings)
  static const double size12 = 12.0;

  /// 14px - Body text, input fields, product descriptions
  static const double size14 = 14.0;

  /// 16px - Body text large, button text, section titles
  static const double size16 = 16.0;

  /// 18px - Headings, greeting text
  static const double size18 = 18.0;

  /// 20px - Large headings, prices
  static const double size20 = 20.0;

  /// 24px - Page titles, success messages
  static const double size24 = 24.0;

  /// 28px - Large page titles
  static const double size28 = 28.0;

  /// 32px - Extra large headings
  static const double size32 = 32.0;

  /// 36px - Hero text
  static const double size36 = 36.0;

  /// 40px - Brand logo text (HUNGRY?)
  static const double size40 = 40.0;
}

/// Line height constants
class AppLineHeight {
  AppLineHeight._();

  /// Tight line height (1.2) - For headings, prices
  static const double tight = 1.2;

  /// Normal line height (1.4) - For labels, buttons
  static const double normal = 1.4;

  /// Comfortable line height (1.5) - For body text, paragraphs
  static const double comfortable = 1.5;

  /// Relaxed line height (1.6) - For long-form content
  static const double relaxed = 1.6;
}

/// Letter spacing constants
class AppLetterSpacing {
  AppLetterSpacing._();

  /// Tight letter spacing (-0.5)
  static const double tight = -0.5;

  /// Normal letter spacing (0.0)
  static const double normal = 0.0;

  /// Wide letter spacing (0.5) - For buttons, labels
  static const double wide = 0.5;

  /// Extra wide letter spacing (1.0) - For special emphasis
  static const double extraWide = 1.0;
}

// ==============================================================================
// LEGACY SUPPORT (for existing code compatibility)
// ==============================================================================

/// Legacy font constants (for backward compatibility)
/// Delegates to the new organized classes above
class AppFonts {
  AppFonts._();

  // Font Family
  static const String fontFamily = AppFontFamily.primary;

  // Font Weights
  static const FontWeight light = AppFontWeight.light;
  static const FontWeight regular = AppFontWeight.regular;
  static const FontWeight medium = AppFontWeight.medium;
  static const FontWeight semiBold = AppFontWeight.semiBold;
  static const FontWeight bold = AppFontWeight.bold;
  static const FontWeight extraBold = AppFontWeight.extraBold;

  // Font Sizes
  static const double size10 = AppFontSize.size10;
  static const double size12 = AppFontSize.size12;
  static const double size14 = AppFontSize.size14;
  static const double size16 = AppFontSize.size16;
  static const double size18 = AppFontSize.size18;
  static const double size20 = AppFontSize.size20;
  static const double size24 = AppFontSize.size24;
  static const double size28 = AppFontSize.size28;
  static const double size32 = AppFontSize.size32;
  static const double size36 = AppFontSize.size36;
  static const double size40 = AppFontSize.size40;

  // Line Heights
  static const double lineHeight1_2 = AppLineHeight.tight;
  static const double lineHeight1_4 = AppLineHeight.normal;
  static const double lineHeight1_5 = AppLineHeight.comfortable;
  static const double lineHeight1_6 = AppLineHeight.relaxed;

  // Letter Spacing
  static const double letterSpacingTight = AppLetterSpacing.tight;
  static const double letterSpacingNormal = AppLetterSpacing.normal;
  static const double letterSpacingWide = AppLetterSpacing.wide;
}

// ==============================================================================
// BASE TEXT STYLE
// ==============================================================================

/// Base text style that all other styles build upon
class AppTextStyleBase {
  AppTextStyleBase._();

  /// Base text style with primary font family and default text color
  static const TextStyle base = TextStyle(
    fontFamily: AppFontFamily.primary,
    color: AppColors.textPrimary,
    fontWeight: AppFontWeight.regular,
    letterSpacing: AppLetterSpacing.normal,
  );

  /// Base text style for light text (on dark backgrounds)
  static const TextStyle light = TextStyle(
    fontFamily: AppFontFamily.primary,
    color: AppColors.textLight,
    fontWeight: AppFontWeight.regular,
    letterSpacing: AppLetterSpacing.normal,
  );

  /// Base text style for dark text (on light backgrounds)
  static const TextStyle dark = TextStyle(
    fontFamily: AppFontFamily.primary,
    color: AppColors.textDark,
    fontWeight: AppFontWeight.regular,
    letterSpacing: AppLetterSpacing.normal,
  );
}

// ==============================================================================
// SEMANTIC TEXT STYLES (Material Design Compliant)
// ==============================================================================

/// Semantic text styles following Material Design typography system
/// These are used in app_theme.dart to build the TextTheme
class AppTextStyles {
  AppTextStyles._();

  // ==========================================================================
  // DISPLAY STYLES (Largest text - h1, h2, h3)
  // ==========================================================================

  /// Display Large (h1) - 32px, bold
  /// Usage: Extra large page titles
  static const TextStyle h1 = TextStyle(
    fontFamily: AppFontFamily.primary,
    fontSize: AppFontSize.size32,
    fontWeight: AppFontWeight.bold,
    height: AppLineHeight.tight,
    color: AppColors.textPrimary,
    letterSpacing: AppLetterSpacing.tight,
  );

  /// Display Medium (h2) - 28px, bold
  /// Usage: Large page titles
  static const TextStyle h2 = TextStyle(
    fontFamily: AppFontFamily.primary,
    fontSize: AppFontSize.size28,
    fontWeight: AppFontWeight.bold,
    height: AppLineHeight.tight,
    color: AppColors.textPrimary,
    letterSpacing: AppLetterSpacing.tight,
  );

  /// Display Small (h3) - 24px, bold
  /// Usage: Section headers, page titles
  static const TextStyle h3 = TextStyle(
    fontFamily: AppFontFamily.primary,
    fontSize: AppFontSize.size24,
    fontWeight: AppFontWeight.bold,
    height: AppLineHeight.tight,
    color: AppColors.textPrimary,
  );

  // ==========================================================================
  // HEADLINE STYLES (h4, h5, h6)
  // ==========================================================================

  /// Headline Large (h4) - 20px, semi-bold
  /// Usage: Card titles, important headings
  static const TextStyle h4 = TextStyle(
    fontFamily: AppFontFamily.primary,
    fontSize: AppFontSize.size20,
    fontWeight: AppFontWeight.semiBold,
    height: AppLineHeight.normal,
    color: AppColors.textPrimary,
  );

  /// Headline Medium (h5) - 18px, semi-bold
  /// Usage: Subsection titles, greeting text
  static const TextStyle h5 = TextStyle(
    fontFamily: AppFontFamily.primary,
    fontSize: AppFontSize.size18,
    fontWeight: AppFontWeight.semiBold,
    height: AppLineHeight.normal,
    color: AppColors.textPrimary,
  );

  /// Headline Small (h6) - 16px, semi-bold
  /// Usage: Small headers, emphasized text
  static const TextStyle h6 = TextStyle(
    fontFamily: AppFontFamily.primary,
    fontSize: AppFontSize.size16,
    fontWeight: AppFontWeight.semiBold,
    height: AppLineHeight.normal,
    color: AppColors.textPrimary,
  );

  // ==========================================================================
  // BODY STYLES (Most common text)
  // ==========================================================================

  /// Body Large - 16px, regular
  /// Usage: Main body text, descriptions
  static const TextStyle bodyLarge = TextStyle(
    fontFamily: AppFontFamily.primary,
    fontSize: AppFontSize.size16,
    fontWeight: AppFontWeight.regular,
    height: AppLineHeight.comfortable,
    color: AppColors.textPrimary,
  );

  /// Body Medium - 14px, regular
  /// Usage: Body text, product descriptions, input fields
  static const TextStyle bodyMedium = TextStyle(
    fontFamily: AppFontFamily.primary,
    fontSize: AppFontSize.size14,
    fontWeight: AppFontWeight.regular,
    height: AppLineHeight.comfortable,
    color: AppColors.textPrimary,
  );

  /// Body Small - 12px, regular
  /// Usage: Small body text, secondary information
  static const TextStyle bodySmall = TextStyle(
    fontFamily: AppFontFamily.primary,
    fontSize: AppFontSize.size12,
    fontWeight: AppFontWeight.regular,
    height: AppLineHeight.comfortable,
    color: AppColors.textSecondary,
  );

  // ==========================================================================
  // LABEL STYLES (Buttons, chips, tags)
  // ==========================================================================

  /// Label Large - 14px, medium
  /// Usage: Button text, emphasized labels
  static const TextStyle labelLarge = TextStyle(
    fontFamily: AppFontFamily.primary,
    fontSize: AppFontSize.size14,
    fontWeight: AppFontWeight.medium,
    height: AppLineHeight.normal,
    color: AppColors.textPrimary,
  );

  /// Label Medium - 12px, medium
  /// Usage: Chips, category labels, ratings
  static const TextStyle labelMedium = TextStyle(
    fontFamily: AppFontFamily.primary,
    fontSize: AppFontSize.size12,
    fontWeight: AppFontWeight.medium,
    height: AppLineHeight.normal,
    color: AppColors.textPrimary,
  );

  /// Label Small - 10px, medium
  /// Usage: Tags, badges, tiny labels
  static const TextStyle labelSmall = TextStyle(
    fontFamily: AppFontFamily.primary,
    fontSize: AppFontSize.size10,
    fontWeight: AppFontWeight.medium,
    height: AppLineHeight.normal,
    color: AppColors.textSecondary,
  );

  // ==========================================================================
  // CAPTION & OVERLINE
  // ==========================================================================

  /// Caption - 12px, regular
  /// Usage: Image captions, helper text
  static const TextStyle caption = TextStyle(
    fontFamily: AppFontFamily.primary,
    fontSize: AppFontSize.size12,
    fontWeight: AppFontWeight.regular,
    height: AppLineHeight.normal,
    color: AppColors.textSecondary,
  );

  /// Overline - 10px, medium, wide spacing
  /// Usage: Category labels, section labels
  static const TextStyle overline = TextStyle(
    fontFamily: AppFontFamily.primary,
    fontSize: AppFontSize.size10,
    fontWeight: AppFontWeight.medium,
    height: AppLineHeight.normal,
    color: AppColors.textSecondary,
    letterSpacing: AppLetterSpacing.wide,
  );
}

// ==============================================================================
// APP-SPECIFIC TEXT STYLES
// ==============================================================================

/// Application-specific text styles for the Hungry app
/// These are custom styles tailored to specific UI components
class AppSpecificTextStyles {
  AppSpecificTextStyles._();

  // ==========================================================================
  // BRANDING & IDENTITY
  // ==========================================================================

  /// Brand/Logo text - HUNGRY?
  /// Usage: Splash screen, app logo
  static const TextStyle brand = TextStyle(
    fontFamily: AppFontFamily.primary,
    fontSize: AppFontSize.size40,
    fontWeight: AppFontWeight.bold,
    height: AppLineHeight.tight,
    color: AppColors.splashText,
    letterSpacing: AppLetterSpacing.tight,
  );

  /// Greeting text - Hello, Rich Sonic
  /// Usage: Home screen greeting
  static const TextStyle greeting = TextStyle(
    fontFamily: AppFontFamily.primary,
    fontSize: AppFontSize.size18,
    fontWeight: AppFontWeight.medium,
    height: AppLineHeight.normal,
    color: AppColors.textTertiary,
  );

  // ==========================================================================
  // PRODUCT STYLES
  // ==========================================================================

  /// Product title - Hamburger, Cheeseburger
  /// Usage: Product cards, product details
  static const TextStyle productTitle = TextStyle(
    fontFamily: AppFontFamily.primary,
    fontSize: AppFontSize.size14,
    fontWeight: AppFontWeight.semiBold,
    height: AppLineHeight.normal,
    color: AppColors.textPrimary,
  );

  /// Product subtitle - Restaurant name, Wendy's Burger
  /// Usage: Product cards, below product title
  static const TextStyle productSubtitle = TextStyle(
    fontFamily: AppFontFamily.primary,
    fontSize: AppFontSize.size12,
    fontWeight: AppFontWeight.regular,
    height: AppLineHeight.normal,
    color: AppColors.textSecondary,
  );

  /// Product description
  /// Usage: Product details screen
  static const TextStyle productDescription = TextStyle(
    fontFamily: AppFontFamily.primary,
    fontSize: AppFontSize.size14,
    fontWeight: AppFontWeight.regular,
    height: AppLineHeight.comfortable,
    color: AppColors.textSecondary,
  );

  // ==========================================================================
  // PRICE STYLES
  // ==========================================================================

  /// Large price - $18.19
  /// Usage: Checkout total, cart total
  static const TextStyle priceLarge = TextStyle(
    fontFamily: AppFontFamily.primary,
    fontSize: AppFontSize.size20,
    fontWeight: AppFontWeight.bold,
    height: AppLineHeight.tight,
    color: AppColors.textPrimary,
  );

  /// Medium price - $16.48
  /// Usage: Product details, order summary
  static const TextStyle priceMedium = TextStyle(
    fontFamily: AppFontFamily.primary,
    fontSize: AppFontSize.size16,
    fontWeight: AppFontWeight.bold,
    height: AppLineHeight.tight,
    color: AppColors.textPrimary,
  );

  /// Small price - $4.5
  /// Usage: Product cards, small items
  static const TextStyle priceSmall = TextStyle(
    fontFamily: AppFontFamily.primary,
    fontSize: AppFontSize.size14,
    fontWeight: AppFontWeight.semiBold,
    height: AppLineHeight.tight,
    color: AppColors.textPrimary,
  );

  // ==========================================================================
  // UI COMPONENT STYLES
  // ==========================================================================

  /// Rating text - 4.5
  /// Usage: Product cards, ratings display
  static const TextStyle rating = TextStyle(
    fontFamily: AppFontFamily.primary,
    fontSize: AppFontSize.size12,
    fontWeight: AppFontWeight.medium,
    height: AppLineHeight.normal,
    color: AppColors.textPrimary,
  );

  /// Chip/Category text - All, Combos, Sliders
  /// Usage: Category selection chips
  static const TextStyle chip = TextStyle(
    fontFamily: AppFontFamily.primary,
    fontSize: AppFontSize.size14,
    fontWeight: AppFontWeight.medium,
    height: AppLineHeight.normal,
    color: AppColors.chipUnselectedText,
  );

  /// Chip selected text
  /// Usage: Selected category chip
  static const TextStyle chipSelected = TextStyle(
    fontFamily: AppFontFamily.primary,
    fontSize: AppFontSize.size14,
    fontWeight: AppFontWeight.semiBold,
    height: AppLineHeight.normal,
    color: AppColors.chipSelectedText,
  );

  // ==========================================================================
  // BUTTON STYLES
  // ==========================================================================

  /// Large button text - Add To Cart, Checkout
  /// Usage: Primary action buttons
  static const TextStyle buttonLarge = TextStyle(
    fontFamily: AppFontFamily.primary,
    fontSize: AppFontSize.size16,
    fontWeight: AppFontWeight.bold,
    height: AppLineHeight.normal,
    color: AppColors.buttonPrimaryText,
    letterSpacing: AppLetterSpacing.wide,
  );

  /// Medium button text - Remove, Edit Profile
  /// Usage: Secondary buttons
  static const TextStyle buttonMedium = TextStyle(
    fontFamily: AppFontFamily.primary,
    fontSize: AppFontSize.size14,
    fontWeight: AppFontWeight.semiBold,
    height: AppLineHeight.normal,
    color: AppColors.buttonPrimaryText,
  );

  /// Small button text - Go Back
  /// Usage: Small action buttons
  static const TextStyle buttonSmall = TextStyle(
    fontFamily: AppFontFamily.primary,
    fontSize: AppFontSize.size12,
    fontWeight: AppFontWeight.semiBold,
    height: AppLineHeight.normal,
    color: AppColors.buttonPrimaryText,
  );

  // ==========================================================================
  // INPUT FIELD STYLES
  // ==========================================================================

  /// Input field text
  /// Usage: Text inside input fields
  static const TextStyle input = TextStyle(
    fontFamily: AppFontFamily.primary,
    fontSize: AppFontSize.size14,
    fontWeight: AppFontWeight.regular,
    height: AppLineHeight.comfortable,
    color: AppColors.inputText,
  );

  /// Input hint text - Search, Enter name
  /// Usage: Placeholder text in inputs
  static const TextStyle inputHint = TextStyle(
    fontFamily: AppFontFamily.primary,
    fontSize: AppFontSize.size14,
    fontWeight: AppFontWeight.regular,
    height: AppLineHeight.comfortable,
    color: AppColors.textHint,
  );

  /// Input label text - Name, Email, Password
  /// Usage: Input field labels
  static const TextStyle inputLabel = TextStyle(
    fontFamily: AppFontFamily.primary,
    fontSize: AppFontSize.size12,
    fontWeight: AppFontWeight.medium,
    height: AppLineHeight.normal,
    color: AppColors.textSecondary,
  );

  // ==========================================================================
  // SECTION & NAVIGATION STYLES
  // ==========================================================================

  /// Section title - Toppings, Side options, Payment methods
  /// Usage: Section headers throughout the app
  static const TextStyle sectionTitle = TextStyle(
    fontFamily: AppFontFamily.primary,
    fontSize: AppFontSize.size16,
    fontWeight: AppFontWeight.semiBold,
    height: AppLineHeight.normal,
    color: AppColors.textPrimary,
  );

  /// Navigation bar label
  /// Usage: Bottom navigation labels
  static const TextStyle navLabel = TextStyle(
    fontFamily: AppFontFamily.primary,
    fontSize: AppFontSize.size12,
    fontWeight: AppFontWeight.medium,
    height: AppLineHeight.normal,
    color: AppColors.navBarSelected,
  );

  // ==========================================================================
  // FEEDBACK & STATUS STYLES
  // ==========================================================================

  /// Success message - Success !
  /// Usage: Success screen, confirmation messages
  static const TextStyle success = TextStyle(
    fontFamily: AppFontFamily.primary,
    fontSize: AppFontSize.size24,
    fontWeight: AppFontWeight.bold,
    height: AppLineHeight.tight,
    color: AppColors.textPrimary,
  );

  /// Error message
  /// Usage: Error displays, validation messages
  static const TextStyle error = TextStyle(
    fontFamily: AppFontFamily.primary,
    fontSize: AppFontSize.size14,
    fontWeight: AppFontWeight.regular,
    height: AppLineHeight.comfortable,
    color: AppColors.error,
  );

  /// Warning message
  /// Usage: Warning displays
  static const TextStyle warning = TextStyle(
    fontFamily: AppFontFamily.primary,
    fontSize: AppFontSize.size14,
    fontWeight: AppFontWeight.regular,
    height: AppLineHeight.comfortable,
    color: AppColors.warning,
  );

  /// Info message
  /// Usage: Information displays
  static const TextStyle info = TextStyle(
    fontFamily: AppFontFamily.primary,
    fontSize: AppFontSize.size14,
    fontWeight: AppFontWeight.regular,
    height: AppLineHeight.comfortable,
    color: AppColors.info,
  );
}

// ==============================================================================
// TEXT THEME EXPORTS (For app_theme.dart)
// ==============================================================================

/// Text theme configurations for light and dark modes
/// Used in app_theme.dart to build the app's TextTheme
class AppTextTheme {
  AppTextTheme._();

  /// Light text theme (primary theme for the app)
  static const TextTheme light = TextTheme(
    // Display styles (largest text)
    displayLarge: AppTextStyles.h1,
    displayMedium: AppTextStyles.h2,
    displaySmall: AppTextStyles.h3,

    // Headline styles
    headlineLarge: AppTextStyles.h3,
    headlineMedium: AppTextStyles.h4,
    headlineSmall: AppTextStyles.h5,

    // Title styles
    titleLarge: AppTextStyles.h5,
    titleMedium: AppTextStyles.h6,
    titleSmall: AppTextStyles.labelLarge,

    // Body styles (most common text)
    bodyLarge: AppTextStyles.bodyLarge,
    bodyMedium: AppTextStyles.bodyMedium,
    bodySmall: AppTextStyles.bodySmall,

    // Label styles (buttons, chips, small text)
    labelLarge: AppTextStyles.labelLarge,
    labelMedium: AppTextStyles.labelMedium,
    labelSmall: AppTextStyles.labelSmall,
  );

  /// Dark text theme (for future dark mode support)
  /// Applies light text color to all text styles
  static TextTheme dark = light.apply(
    bodyColor: AppColors.textLight,
    displayColor: AppColors.textLight,
  );
}

// ==============================================================================
// UTILITY EXTENSIONS
// ==============================================================================

/// Extension methods for TextStyle to easily apply common modifications
/// Now properly uses AppColors constants instead of hard-coded values
extension AppTextStyleExtension on TextStyle {
  // ==========================================================================
  // COLOR MODIFICATIONS
  // ==========================================================================

  /// Apply primary brand color
  TextStyle get withPrimaryColor => copyWith(color: AppColors.primary);

  /// Apply secondary text color
  TextStyle get withSecondaryColor => copyWith(color: AppColors.textSecondary);

  /// Apply white color (for dark backgrounds)
  TextStyle get withWhiteColor => copyWith(color: AppColors.textLight);

  /// Apply black color
  TextStyle get withBlackColor => copyWith(color: AppColors.textDark);

  /// Apply error color
  TextStyle get withErrorColor => copyWith(color: AppColors.error);

  /// Apply success color
  TextStyle get withSuccessColor => copyWith(color: AppColors.success);

  /// Apply warning color
  TextStyle get withWarningColor => copyWith(color: AppColors.warning);

  /// Apply info color
  TextStyle get withInfoColor => copyWith(color: AppColors.info);

  /// Apply brand green color
  TextStyle get withBrandColor => copyWith(color: AppColors.textBrand);

  /// Apply custom color
  TextStyle withColor(Color color) => copyWith(color: color);

  // ==========================================================================
  // SIZE MODIFICATIONS
  // ==========================================================================

  /// Apply custom font size
  TextStyle withSize(double size) => copyWith(fontSize: size);

  // ==========================================================================
  // WEIGHT MODIFICATIONS
  // ==========================================================================

  /// Apply custom font weight
  TextStyle withWeight(FontWeight weight) => copyWith(fontWeight: weight);

  /// Apply light weight
  TextStyle get asLight => copyWith(fontWeight: AppFontWeight.light);

  /// Apply regular weight
  TextStyle get asRegular => copyWith(fontWeight: AppFontWeight.regular);

  /// Apply medium weight
  TextStyle get asMedium => copyWith(fontWeight: AppFontWeight.medium);

  /// Apply semi-bold weight
  TextStyle get asSemiBold => copyWith(fontWeight: AppFontWeight.semiBold);

  /// Apply bold weight
  TextStyle get asBold => copyWith(fontWeight: AppFontWeight.bold);

  // ==========================================================================
  // SPACING MODIFICATIONS
  // ==========================================================================

  /// Apply custom letter spacing
  TextStyle withLetterSpacing(double spacing) =>
      copyWith(letterSpacing: spacing);

  /// Apply tight letter spacing
  TextStyle get withTightSpacing =>
      copyWith(letterSpacing: AppLetterSpacing.tight);

  /// Apply normal letter spacing
  TextStyle get withNormalSpacing =>
      copyWith(letterSpacing: AppLetterSpacing.normal);

  /// Apply wide letter spacing
  TextStyle get withWideSpacing =>
      copyWith(letterSpacing: AppLetterSpacing.wide);

  // ==========================================================================
  // LINE HEIGHT MODIFICATIONS
  // ==========================================================================

  /// Apply custom line height
  TextStyle withLineHeight(double height) => copyWith(height: height);

  /// Apply tight line height
  TextStyle get withTightLineHeight => copyWith(height: AppLineHeight.tight);

  /// Apply normal line height
  TextStyle get withNormalLineHeight => copyWith(height: AppLineHeight.normal);

  /// Apply comfortable line height
  TextStyle get withComfortableLineHeight =>
      copyWith(height: AppLineHeight.comfortable);
}
