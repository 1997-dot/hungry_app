import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'app_colors.dart';
import 'app_fonts.dart';

/// AppTheme - The brain of all visual styling in the Hungry app
///
/// This class defines ThemeData for the entire application.
/// It teaches Flutter how to use the color palette (from app_colors.dart)
/// and typography (from app_fonts.dart) across all screens and components.
///
/// Any screen anywhere will automatically follow these rules, ensuring:
/// - Consistent UI across the app
/// - Easy global styling changes
/// - Clean, maintainable code
/// - Scalable design system
class AppTheme {
  AppTheme._(); // Private constructor to prevent instantiation

  // ==========================================================================
  // LIGHT THEME (Primary theme for the app)
  // ==========================================================================

  /// Light theme configuration
  /// This is the main theme used throughout the Hungry app
  static ThemeData get lightTheme {
    return ThemeData(
      // ========================================================================
      // CORE CONFIGURATION
      // ========================================================================

      useMaterial3: true,
      brightness: Brightness.light,
      fontFamily: AppFonts.fontFamily,

      // ========================================================================
      // COLOR SCHEME
      // ========================================================================

      colorScheme: const ColorScheme.light(
        // Primary brand color - Dark Green
        primary: AppColors.primary,
        primaryContainer: AppColors.primaryLight,

        // Secondary color (same as primary for this app)
        secondary: AppColors.primary,
        secondaryContainer: AppColors.primaryLight,

        // Surface colors
        surface: AppColors.background,
        surfaceContainerHighest: AppColors.backgroundGrey,

        // Error color
        error: AppColors.error,
        errorContainer: AppColors.errorLight,

        // On-colors (text/icons on colored backgrounds)
        onPrimary: AppColors.textLight,
        onSecondary: AppColors.textLight,
        onSurface: AppColors.textPrimary,
        onError: AppColors.textLight,

        // Outline colors
        outline: AppColors.border,
        outlineVariant: AppColors.divider,
      ),

      // ========================================================================
      // SCAFFOLD
      // ========================================================================

      scaffoldBackgroundColor: AppColors.scaffoldBackground,

      // ========================================================================
      // APPBAR THEME
      // ========================================================================

      appBarTheme: const AppBarTheme(
        elevation: 0,
        centerTitle: false,
        backgroundColor: AppColors.background,
        foregroundColor: AppColors.textPrimary,
        surfaceTintColor: Colors.transparent,

        // Status bar styling
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light,
        ),

        // AppBar title text style
        titleTextStyle: TextStyle(
          fontFamily: AppFonts.fontFamily,
          fontSize: AppFonts.size20,
          fontWeight: AppFonts.bold,
          color: AppColors.textPrimary,
          letterSpacing: -0.5,
        ),

        // AppBar icon theme
        iconTheme: IconThemeData(
          color: AppColors.iconDark,
          size: 24,
        ),

        // AppBar action icons
        actionsIconTheme: IconThemeData(
          color: AppColors.iconDark,
          size: 24,
        ),
      ),

      // ========================================================================
      // BOTTOM NAVIGATION BAR THEME
      // ========================================================================

      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: AppColors.navBarBackground,
        selectedItemColor: AppColors.navBarSelected,
        unselectedItemColor: AppColors.navBarUnselected,
        type: BottomNavigationBarType.fixed,
        elevation: 8,
        showSelectedLabels: true,
        showUnselectedLabels: true,

        selectedLabelStyle: TextStyle(
          fontFamily: AppFonts.fontFamily,
          fontSize: AppFonts.size12,
          fontWeight: AppFonts.semiBold,
        ),

        unselectedLabelStyle: TextStyle(
          fontFamily: AppFonts.fontFamily,
          fontSize: AppFonts.size12,
          fontWeight: AppFonts.regular,
        ),

        selectedIconTheme: IconThemeData(
          size: 24,
          color: AppColors.navBarSelected,
        ),

        unselectedIconTheme: IconThemeData(
          size: 24,
          color: AppColors.navBarUnselected,
        ),
      ),

      // ========================================================================
      // BUTTON THEMES
      // ========================================================================

      // Elevated Button (Primary buttons: Add to Cart, Checkout, Pay Now)
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.buttonPrimary,
          foregroundColor: AppColors.buttonPrimaryText,
          elevation: 0,
          shadowColor: Colors.transparent,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          minimumSize: const Size(120, 50),

          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),

          textStyle: const TextStyle(
            fontFamily: AppFonts.fontFamily,
            fontSize: AppFonts.size16,
            fontWeight: AppFonts.bold,
            letterSpacing: 0.2,
          ),

          // Disabled state
          disabledBackgroundColor: AppColors.buttonDisabled,
          disabledForegroundColor: AppColors.textLight,
        ),
      ),

      // Outlined Button (Secondary buttons: Edit Profile, Cancel)
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.buttonSecondaryText,
          backgroundColor: AppColors.buttonSecondary,
          side: const BorderSide(
            color: AppColors.buttonSecondaryText,
            width: 1.5,
          ),
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          minimumSize: const Size(120, 50),

          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),

          textStyle: const TextStyle(
            fontFamily: AppFonts.fontFamily,
            fontSize: AppFonts.size16,
            fontWeight: AppFonts.semiBold,
            letterSpacing: 0.2,
          ),
        ),
      ),

      // Text Button (Remove, Back buttons)
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColors.primary,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),

          textStyle: const TextStyle(
            fontFamily: AppFonts.fontFamily,
            fontSize: AppFonts.size14,
            fontWeight: AppFonts.semiBold,
          ),

          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),

      // Icon Button Theme
      iconButtonTheme: IconButtonThemeData(
        style: IconButton.styleFrom(
          foregroundColor: AppColors.iconSecondary,
          padding: const EdgeInsets.all(8),
          minimumSize: const Size(40, 40),
        ),
      ),

      // ========================================================================
      // INPUT DECORATION THEME (Search bars, text fields)
      // ========================================================================

      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.inputBackground,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),

        // Default border (no border for search bars)
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),

        // Enabled border
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),

        // Focused border (dark green)
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: AppColors.inputBorderFocused,
            width: 2,
          ),
        ),

        // Error border
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: AppColors.error,
            width: 2,
          ),
        ),

        // Focused error border
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: AppColors.error,
            width: 2,
          ),
        ),

        // Text styles
        hintStyle: const TextStyle(
          fontFamily: AppFonts.fontFamily,
          fontSize: AppFonts.size14,
          fontWeight: AppFonts.regular,
          color: AppColors.searchHint,
        ),

        labelStyle: const TextStyle(
          fontFamily: AppFonts.fontFamily,
          fontSize: AppFonts.size14,
          fontWeight: AppFonts.medium,
          color: AppColors.textSecondary,
        ),

        floatingLabelStyle: const TextStyle(
          fontFamily: AppFonts.fontFamily,
          fontSize: AppFonts.size14,
          fontWeight: AppFonts.medium,
          color: AppColors.primary,
        ),

        errorStyle: const TextStyle(
          fontFamily: AppFonts.fontFamily,
          fontSize: AppFonts.size12,
          fontWeight: AppFonts.regular,
          color: AppColors.error,
        ),

        // Icon theme
        prefixIconColor: AppColors.iconSecondary,
        suffixIconColor: AppColors.iconSecondary,
      ),

      // ========================================================================
      // CARD THEME (Product cards, topping cards, order summary)
      // ========================================================================

      cardTheme: CardThemeData(
        color: AppColors.cardBackground,
        elevation: 0,
        shadowColor: AppColors.cardShadow,
        surfaceTintColor: Colors.transparent,

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: const BorderSide(
            color: AppColors.cardBorder,
            width: 1,
          ),
        ),

        margin: const EdgeInsets.all(8),
      ),

      // ========================================================================
      // CHIP THEME (Category selection chips)
      // ========================================================================

      chipTheme: ChipThemeData(
        backgroundColor: AppColors.chipUnselected,
        selectedColor: AppColors.chipSelected,
        disabledColor: AppColors.buttonDisabled,
        deleteIconColor: AppColors.iconSecondary,

        labelStyle: const TextStyle(
          fontFamily: AppFonts.fontFamily,
          fontSize: AppFonts.size14,
          fontWeight: AppFonts.medium,
          color: AppColors.chipUnselectedText,
        ),

        secondaryLabelStyle: const TextStyle(
          fontFamily: AppFonts.fontFamily,
          fontSize: AppFonts.size14,
          fontWeight: AppFonts.semiBold,
          color: AppColors.chipSelectedText,
        ),

        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        labelPadding: EdgeInsets.zero,

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: const BorderSide(
            color: AppColors.chipBorder,
            width: 1,
          ),
        ),

        secondarySelectedColor: AppColors.chipSelected,
        brightness: Brightness.light,
        elevation: 0,
        pressElevation: 0,
      ),

      // ========================================================================
      // SLIDER THEME (Spicy level slider)
      // ========================================================================

      sliderTheme: SliderThemeData(
        activeTrackColor: AppColors.sliderActive,
        inactiveTrackColor: AppColors.sliderInactive,
        thumbColor: AppColors.sliderThumb,
        overlayColor: AppColors.sliderActive.withValues(alpha: 0.2),

        trackHeight: 6,
        thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 12),
        overlayShape: const RoundSliderOverlayShape(overlayRadius: 24),
        trackShape: const RoundedRectSliderTrackShape(),

        valueIndicatorColor: AppColors.sliderThumb,
        valueIndicatorTextStyle: const TextStyle(
          fontFamily: AppFonts.fontFamily,
          fontSize: AppFonts.size12,
          fontWeight: AppFonts.semiBold,
          color: AppColors.textLight,
        ),
      ),

      // ========================================================================
      // DIVIDER THEME
      // ========================================================================

      dividerTheme: const DividerThemeData(
        color: AppColors.divider,
        thickness: 1,
        space: 1,
      ),

      // ========================================================================
      // ICON THEME
      // ========================================================================

      iconTheme: const IconThemeData(
        color: AppColors.iconSecondary,
        size: 24,
      ),

      primaryIconTheme: const IconThemeData(
        color: AppColors.iconPrimary,
        size: 24,
      ),

      // ========================================================================
      // TEXT THEME
      // ========================================================================

      textTheme: const TextTheme(
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
      ),

      // ========================================================================
      // SNACKBAR THEME
      // ========================================================================

      snackBarTheme: SnackBarThemeData(
        backgroundColor: AppColors.textDark,
        contentTextStyle: const TextStyle(
          fontFamily: AppFonts.fontFamily,
          fontSize: AppFonts.size14,
          fontWeight: AppFonts.regular,
          color: AppColors.textLight,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        behavior: SnackBarBehavior.floating,
        elevation: 4,
        actionTextColor: AppColors.primary,
      ),

      // ========================================================================
      // DIALOG THEME (Success dialog, confirmation dialogs)
      // ========================================================================

      dialogTheme: DialogThemeData(
        backgroundColor: AppColors.successDialogBackground,
        surfaceTintColor: Colors.transparent,
        elevation: 8,

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),

        titleTextStyle: const TextStyle(
          fontFamily: AppFonts.fontFamily,
          fontSize: AppFonts.size20,
          fontWeight: AppFonts.bold,
          color: AppColors.textPrimary,
        ),

        contentTextStyle: const TextStyle(
          fontFamily: AppFonts.fontFamily,
          fontSize: AppFonts.size14,
          fontWeight: AppFonts.regular,
          color: AppColors.textSecondary,
          height: 1.5,
        ),

        actionsPadding: const EdgeInsets.all(16),
      ),

      // ========================================================================
      // BOTTOM SHEET THEME
      // ========================================================================

      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: AppColors.background,
        surfaceTintColor: Colors.transparent,
        elevation: 8,
        modalElevation: 8,

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(24),
          ),
        ),

        modalBarrierColor: AppColors.overlay,
      ),

      // ========================================================================
      // FLOATING ACTION BUTTON THEME
      // ========================================================================

      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.iconLight,
        elevation: 4,
        highlightElevation: 8,
        shape: CircleBorder(),
      ),

      // ========================================================================
      // CHECKBOX THEME (Save card checkbox)
      // ========================================================================

      checkboxTheme: CheckboxThemeData(
        fillColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return AppColors.saveCardCheckbox;
          }
          return Colors.transparent;
        }),

        checkColor: WidgetStateProperty.all(AppColors.textLight),

        side: const BorderSide(
          color: AppColors.border,
          width: 2,
        ),

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
      ),

      // ========================================================================
      // RADIO THEME (Payment method selection)
      // ========================================================================

      radioTheme: RadioThemeData(
        fillColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return AppColors.primary;
          }
          return AppColors.iconSecondary;
        }),
      ),

      // ========================================================================
      // SWITCH THEME
      // ========================================================================

      switchTheme: SwitchThemeData(
        thumbColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return AppColors.primary;
          }
          return AppColors.background;
        }),

        trackColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return AppColors.primaryLight;
          }
          return AppColors.border;
        }),

        trackOutlineColor: WidgetStateProperty.all(Colors.transparent),
      ),

      // ========================================================================
      // PROGRESS INDICATOR THEME (Loading spinners)
      // ========================================================================

      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: AppColors.primary,
        linearTrackColor: AppColors.backgroundGrey,
        circularTrackColor: AppColors.backgroundGrey,
        refreshBackgroundColor: AppColors.background,
      ),

      // ========================================================================
      // LIST TILE THEME
      // ========================================================================

      listTileTheme: const ListTileThemeData(
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        minLeadingWidth: 40,
        iconColor: AppColors.iconSecondary,
        textColor: AppColors.textPrimary,

        titleTextStyle: TextStyle(
          fontFamily: AppFonts.fontFamily,
          fontSize: AppFonts.size16,
          fontWeight: AppFonts.medium,
          color: AppColors.textPrimary,
        ),

        subtitleTextStyle: TextStyle(
          fontFamily: AppFonts.fontFamily,
          fontSize: AppFonts.size14,
          fontWeight: AppFonts.regular,
          color: AppColors.textSecondary,
        ),
      ),

      // ========================================================================
      // TAB BAR THEME
      // ========================================================================

      tabBarTheme: const TabBarThemeData(
        indicatorColor: AppColors.primary,
        labelColor: AppColors.primary,
        unselectedLabelColor: AppColors.textSecondary,

        labelStyle: TextStyle(
          fontFamily: AppFonts.fontFamily,
          fontSize: AppFonts.size14,
          fontWeight: AppFonts.semiBold,
        ),

        unselectedLabelStyle: TextStyle(
          fontFamily: AppFonts.fontFamily,
          fontSize: AppFonts.size14,
          fontWeight: AppFonts.regular,
        ),

        indicatorSize: TabBarIndicatorSize.tab,
      ),

      // ========================================================================
      // TOOLTIP THEME
      // ========================================================================

      tooltipTheme: TooltipThemeData(
        decoration: BoxDecoration(
          color: AppColors.textDark.withValues(alpha: 0.9),
          borderRadius: BorderRadius.circular(8),
        ),

        textStyle: const TextStyle(
          fontFamily: AppFonts.fontFamily,
          fontSize: AppFonts.size12,
          fontWeight: AppFonts.regular,
          color: AppColors.textLight,
        ),

        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        waitDuration: const Duration(milliseconds: 500),
      ),

      // ========================================================================
      // BANNER THEME
      // ========================================================================

      bannerTheme: const MaterialBannerThemeData(
        backgroundColor: AppColors.backgroundGrey,
        contentTextStyle: TextStyle(
          fontFamily: AppFonts.fontFamily,
          fontSize: AppFonts.size14,
          fontWeight: AppFonts.regular,
          color: AppColors.textPrimary,
        ),
      ),

      // ========================================================================
      // EXPANSION TILE THEME
      // ========================================================================

      expansionTileTheme: const ExpansionTileThemeData(
        backgroundColor: AppColors.background,
        collapsedBackgroundColor: AppColors.background,
        iconColor: AppColors.iconSecondary,
        collapsedIconColor: AppColors.iconSecondary,
        textColor: AppColors.textPrimary,
        collapsedTextColor: AppColors.textPrimary,
      ),
    );
  }

  // ==========================================================================
  // DARK THEME (Optional - for future use)
  // ==========================================================================

  /// Dark theme configuration
  /// Currently minimal - can be expanded when dark mode is needed
  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      fontFamily: AppFonts.fontFamily,

      colorScheme: const ColorScheme.dark(
        primary: AppColors.primary,
        secondary: AppColors.primaryLight,
        surface: Color(0xFF1E1E1E),
        error: AppColors.error,
        onPrimary: AppColors.textLight,
        onSecondary: AppColors.textLight,
        onSurface: AppColors.textLight,
        onError: AppColors.textLight,
      ),

      scaffoldBackgroundColor: const Color(0xFF121212),

      // Add more dark theme configurations as needed
      textTheme: const TextTheme(
        bodyLarge: TextStyle(color: AppColors.textLight),
        bodyMedium: TextStyle(color: AppColors.textLight),
        bodySmall: TextStyle(color: AppColors.textLight),
      ),
    );
  }
}
