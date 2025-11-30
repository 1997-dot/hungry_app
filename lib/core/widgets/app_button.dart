import 'package:flutter/material.dart';
import '../configs/app_colors.dart';
import '../configs/app_fonts.dart';

/// AppButton - Reusable button component for the Hungry app
///
/// Provides three button variants:
/// - Primary: Dark green background, white text (Add To Cart, Checkout, Pay Now)
/// - Secondary: White background, green border and text (Edit Profile, Log out)
/// - Text: No background, green text (Remove, Back)
///
/// Integrates with the app's design system using AppColors and AppTextStyles
///
/// Usage:
/// ```dart
/// AppButton.primary(
///   text: 'Add To Cart',
///   onPressed: () {},
/// )
///
/// AppButton.secondary(
///   text: 'Edit Profile',
///   onPressed: () {},
/// )
///
/// AppButton.text(
///   text: 'Remove',
///   onPressed: () {},
/// )
/// ```

enum AppButtonVariant {
  /// Primary button - Dark green background, white text
  primary,

  /// Secondary button - White background, green border
  secondary,

  /// Text button - No background, green text
  text,
}

enum AppButtonSize {
  /// Small button - Compact padding
  small,

  /// Medium button - Default size
  medium,

  /// Large button - Expanded padding
  large,
}

class AppButton extends StatelessWidget {
  /// The text displayed on the button
  final String text;

  /// Callback when button is pressed
  final VoidCallback? onPressed;

  /// Button variant (primary, secondary, text)
  final AppButtonVariant variant;

  /// Button size
  final AppButtonSize size;

  /// Optional icon to display before text
  final IconData? icon;

  /// Whether button is in loading state
  final bool isLoading;

  /// Whether button takes full width
  final bool fullWidth;

  /// Custom text style (overrides default)
  final TextStyle? textStyle;

  /// Custom background color (overrides variant color)
  final Color? backgroundColor;

  /// Custom border radius
  final double? borderRadius;

  const AppButton._({
    required this.text,
    required this.onPressed,
    required this.variant,
    this.size = AppButtonSize.medium,
    this.icon,
    this.isLoading = false,
    this.fullWidth = false,
    this.textStyle,
    this.backgroundColor,
    this.borderRadius,
    super.key,
  });

  /// Primary button - Dark green background, white text
  /// Usage: Add To Cart, Checkout, Pay Now, Save buttons
  factory AppButton.primary({
    required String text,
    required VoidCallback? onPressed,
    AppButtonSize size = AppButtonSize.medium,
    IconData? icon,
    bool isLoading = false,
    bool fullWidth = false,
    TextStyle? textStyle,
    Color? backgroundColor,
    double? borderRadius,
    Key? key,
  }) {
    return AppButton._(
      text: text,
      onPressed: onPressed,
      variant: AppButtonVariant.primary,
      size: size,
      icon: icon,
      isLoading: isLoading,
      fullWidth: fullWidth,
      textStyle: textStyle,
      backgroundColor: backgroundColor,
      borderRadius: borderRadius,
      key: key,
    );
  }

  /// Secondary button - White background, green border and text
  /// Usage: Edit Profile, Cancel, alternative actions
  factory AppButton.secondary({
    required String text,
    required VoidCallback? onPressed,
    AppButtonSize size = AppButtonSize.medium,
    IconData? icon,
    bool isLoading = false,
    bool fullWidth = false,
    TextStyle? textStyle,
    Color? backgroundColor,
    double? borderRadius,
    Key? key,
  }) {
    return AppButton._(
      text: text,
      onPressed: onPressed,
      variant: AppButtonVariant.secondary,
      size: size,
      icon: icon,
      isLoading: isLoading,
      fullWidth: fullWidth,
      textStyle: textStyle,
      backgroundColor: backgroundColor,
      borderRadius: borderRadius,
      key: key,
    );
  }

  /// Text button - No background, green text
  /// Usage: Remove, Back, Skip actions
  factory AppButton.text({
    required String text,
    required VoidCallback? onPressed,
    AppButtonSize size = AppButtonSize.small,
    IconData? icon,
    bool isLoading = false,
    TextStyle? textStyle,
    Key? key,
  }) {
    return AppButton._(
      text: text,
      onPressed: onPressed,
      variant: AppButtonVariant.text,
      size: size,
      icon: icon,
      isLoading: isLoading,
      fullWidth: false,
      textStyle: textStyle,
      key: key,
    );
  }

  @override
  Widget build(BuildContext context) {
    final buttonChild = _buildButtonContent();

    switch (variant) {
      case AppButtonVariant.primary:
        return _buildPrimaryButton(buttonChild);
      case AppButtonVariant.secondary:
        return _buildSecondaryButton(buttonChild);
      case AppButtonVariant.text:
        return _buildTextButton(buttonChild);
    }
  }

  // ==========================================================================
  // BUTTON BUILDERS
  // ==========================================================================

  Widget _buildPrimaryButton(Widget child) {
    return SizedBox(
      width: fullWidth ? double.infinity : null,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? AppColors.buttonPrimary,
          foregroundColor: AppColors.buttonPrimaryText,
          disabledBackgroundColor: AppColors.buttonDisabled,
          disabledForegroundColor: AppColors.textLight,
          padding: _getPadding(),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 12),
          ),
          elevation: 0,
          shadowColor: Colors.transparent,
        ),
        child: child,
      ),
    );
  }

  Widget _buildSecondaryButton(Widget child) {
    return SizedBox(
      width: fullWidth ? double.infinity : null,
      child: OutlinedButton(
        onPressed: isLoading ? null : onPressed,
        style: OutlinedButton.styleFrom(
          backgroundColor: backgroundColor ?? AppColors.buttonSecondary,
          foregroundColor: AppColors.buttonSecondaryText,
          side: BorderSide(
            color: onPressed == null
                ? AppColors.buttonDisabled
                : AppColors.buttonSecondaryText,
            width: 1.5,
          ),
          padding: _getPadding(),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 12),
          ),
        ),
        child: child,
      ),
    );
  }

  Widget _buildTextButton(Widget child) {
    return TextButton(
      onPressed: isLoading ? null : onPressed,
      style: TextButton.styleFrom(
        foregroundColor: AppColors.primary,
        padding: _getPadding(),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 8),
        ),
      ),
      child: child,
    );
  }

  // ==========================================================================
  // CONTENT BUILDER
  // ==========================================================================

  Widget _buildButtonContent() {
    if (isLoading) {
      return SizedBox(
        height: _getTextSize(),
        width: _getTextSize(),
        child: CircularProgressIndicator(
          strokeWidth: 2,
          valueColor: AlwaysStoppedAnimation<Color>(
            variant == AppButtonVariant.primary
                ? AppColors.textLight
                : AppColors.primary,
          ),
        ),
      );
    }

    final textWidget = Text(
      text,
      style: textStyle ?? _getDefaultTextStyle(),
    );

    if (icon != null) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: _getIconSize()),
          const SizedBox(width: 8),
          textWidget,
        ],
      );
    }

    return textWidget;
  }

  // ==========================================================================
  // SIZE CALCULATIONS
  // ==========================================================================

  EdgeInsets _getPadding() {
    switch (size) {
      case AppButtonSize.small:
        return const EdgeInsets.symmetric(horizontal: 16, vertical: 10);
      case AppButtonSize.medium:
        return const EdgeInsets.symmetric(horizontal: 24, vertical: 14);
      case AppButtonSize.large:
        return const EdgeInsets.symmetric(horizontal: 32, vertical: 18);
    }
  }

  TextStyle _getDefaultTextStyle() {
    final baseStyle = variant == AppButtonVariant.primary
        ? AppSpecificTextStyles.buttonLarge
        : AppSpecificTextStyles.buttonMedium;

    switch (size) {
      case AppButtonSize.small:
        return AppSpecificTextStyles.buttonSmall;
      case AppButtonSize.medium:
        return AppSpecificTextStyles.buttonMedium;
      case AppButtonSize.large:
        return baseStyle;
    }
  }

  double _getTextSize() {
    switch (size) {
      case AppButtonSize.small:
        return AppFontSize.size12;
      case AppButtonSize.medium:
        return AppFontSize.size14;
      case AppButtonSize.large:
        return AppFontSize.size16;
    }
  }

  double _getIconSize() {
    switch (size) {
      case AppButtonSize.small:
        return 16;
      case AppButtonSize.medium:
        return 18;
      case AppButtonSize.large:
        return 20;
    }
  }
}

// ==============================================================================
// SPECIALIZED BUTTON WIDGETS
// ==============================================================================

/// Icon button for actions like back, settings, close
class AppIconButton extends StatelessWidget {
  /// The icon to display
  final IconData icon;

  /// Callback when button is pressed
  final VoidCallback? onPressed;

  /// Icon color
  final Color? color;

  /// Icon size
  final double? size;

  /// Background color
  final Color? backgroundColor;

  /// Border radius
  final double? borderRadius;

  /// Padding around icon
  final EdgeInsets? padding;

  const AppIconButton({
    required this.icon,
    required this.onPressed,
    this.color,
    this.size,
    this.backgroundColor,
    this.borderRadius,
    this.padding,
    super.key,
  });

  /// Back button - Black circle with white background
  factory AppIconButton.back({
    required VoidCallback? onPressed,
    Color? backgroundColor,
    Color? iconColor,
    Key? key,
  }) {
    return AppIconButton(
      icon: Icons.arrow_back,
      onPressed: onPressed,
      backgroundColor: backgroundColor ?? AppColors.background,
      color: iconColor ?? AppColors.iconDark,
      size: 20,
      borderRadius: 20,
      padding: const EdgeInsets.all(8),
      key: key,
    );
  }

  /// Settings button - For app bar
  factory AppIconButton.settings({
    required VoidCallback? onPressed,
    Color? iconColor,
    Key? key,
  }) {
    return AppIconButton(
      icon: Icons.settings_outlined,
      onPressed: onPressed,
      color: iconColor ?? AppColors.iconLight,
      size: 24,
      key: key,
    );
  }

  /// Close button - For dialogs and modals
  factory AppIconButton.close({
    required VoidCallback? onPressed,
    Color? iconColor,
    Key? key,
  }) {
    return AppIconButton(
      icon: Icons.close,
      onPressed: onPressed,
      color: iconColor ?? AppColors.iconDark,
      size: 20,
      key: key,
    );
  }

  @override
  Widget build(BuildContext context) {
    final iconWidget = Icon(
      icon,
      color: color ?? AppColors.iconSecondary,
      size: size ?? 24,
    );

    if (backgroundColor != null) {
      return Container(
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(borderRadius ?? 0),
        ),
        child: IconButton(
          onPressed: onPressed,
          icon: iconWidget,
          padding: padding ?? const EdgeInsets.all(8),
          constraints: const BoxConstraints(),
        ),
      );
    }

    return IconButton(
      onPressed: onPressed,
      icon: iconWidget,
      padding: padding ?? const EdgeInsets.all(8),
    );
  }
}

/// Circular quantity button (Plus/Minus) for cart and product details
class AppQuantityButton extends StatelessWidget {
  /// The icon to display (add or remove)
  final IconData icon;

  /// Callback when button is pressed
  final VoidCallback? onPressed;

  /// Whether button is disabled
  final bool isDisabled;

  const AppQuantityButton({
    required this.icon,
    required this.onPressed,
    this.isDisabled = false,
    super.key,
  });

  /// Plus button
  factory AppQuantityButton.add({
    required VoidCallback? onPressed,
    Key? key,
  }) {
    return AppQuantityButton(
      icon: Icons.add,
      onPressed: onPressed,
      key: key,
    );
  }

  /// Minus button
  factory AppQuantityButton.remove({
    required VoidCallback? onPressed,
    bool isDisabled = false,
    Key? key,
  }) {
    return AppQuantityButton(
      icon: Icons.remove,
      onPressed: onPressed,
      isDisabled: isDisabled,
      key: key,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 32,
      height: 32,
      decoration: BoxDecoration(
        color: isDisabled
            ? AppColors.buttonDisabled
            : AppColors.quantityButtonBackground,
        shape: BoxShape.circle,
      ),
      child: IconButton(
        onPressed: isDisabled ? null : onPressed,
        icon: Icon(
          icon,
          color: AppColors.quantityButtonIcon,
          size: 16,
        ),
        padding: EdgeInsets.zero,
        constraints: const BoxConstraints(),
      ),
    );
  }
}
