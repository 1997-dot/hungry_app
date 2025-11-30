import 'package:flutter/material.dart';
import '../configs/app_colors.dart';
import '../configs/app_fonts.dart';

/// AppSnackbar - Notification snackbar components for the Hungry app
///
/// Provides styled snackbars for different message types:
/// - Success: Green background, checkmark icon
/// - Error: Red background, error icon
/// - Warning: Yellow/orange background, warning icon
/// - Info: Blue background, info icon
///
/// Integrates with the app's design system using AppColors
///
/// Usage:
/// ```dart
/// AppSnackbar.success(
///   context: context,
///   message: 'Item added to cart!',
/// )
///
/// AppSnackbar.error(
///   context: context,
///   message: 'Failed to process payment',
/// )
///
/// AppSnackbar.warning(
///   context: context,
///   message: 'Low stock',
/// )
///
/// AppSnackbar.info(
///   context: context,
///   message: 'Estimated delivery: 15-30 mins',
/// )
/// ```

enum AppSnackbarType {
  /// Success snackbar - Green
  success,

  /// Error snackbar - Red
  error,

  /// Warning snackbar - Yellow/Orange
  warning,

  /// Info snackbar - Blue
  info,
}

class AppSnackbar {
  AppSnackbar._();

  /// Show a success snackbar
  static void success({
    required BuildContext context,
    required String message,
    Duration duration = const Duration(seconds: 3),
    SnackBarAction? action,
  }) {
    _show(
      context: context,
      message: message,
      type: AppSnackbarType.success,
      duration: duration,
      action: action,
    );
  }

  /// Show an error snackbar
  static void error({
    required BuildContext context,
    required String message,
    Duration duration = const Duration(seconds: 4),
    SnackBarAction? action,
  }) {
    _show(
      context: context,
      message: message,
      type: AppSnackbarType.error,
      duration: duration,
      action: action,
    );
  }

  /// Show a warning snackbar
  static void warning({
    required BuildContext context,
    required String message,
    Duration duration = const Duration(seconds: 3),
    SnackBarAction? action,
  }) {
    _show(
      context: context,
      message: message,
      type: AppSnackbarType.warning,
      duration: duration,
      action: action,
    );
  }

  /// Show an info snackbar
  static void info({
    required BuildContext context,
    required String message,
    Duration duration = const Duration(seconds: 3),
    SnackBarAction? action,
  }) {
    _show(
      context: context,
      message: message,
      type: AppSnackbarType.info,
      duration: duration,
      action: action,
    );
  }

  /// Show a custom snackbar
  static void custom({
    required BuildContext context,
    required String message,
    required Color backgroundColor,
    required IconData icon,
    Color? textColor,
    Duration duration = const Duration(seconds: 3),
    SnackBarAction? action,
  }) {
    final snackBar = SnackBar(
      content: Row(
        children: [
          Icon(icon, color: textColor ?? AppColors.textLight, size: 20),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              message,
              style: TextStyle(
                color: textColor ?? AppColors.textLight,
                fontSize: AppFontSize.size14,
                fontWeight: AppFontWeight.regular,
              ),
            ),
          ),
        ],
      ),
      backgroundColor: backgroundColor,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      duration: duration,
      action: action,
    );

    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }

  /// Internal method to show snackbar
  static void _show({
    required BuildContext context,
    required String message,
    required AppSnackbarType type,
    Duration duration = const Duration(seconds: 3),
    SnackBarAction? action,
  }) {
    final config = _getSnackbarConfig(type);

    final snackBar = SnackBar(
      content: Row(
        children: [
          Icon(config.icon, color: AppColors.textLight, size: 20),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              message,
              style: const TextStyle(
                color: AppColors.textLight,
                fontSize: AppFontSize.size14,
                fontWeight: AppFontWeight.regular,
              ),
            ),
          ),
        ],
      ),
      backgroundColor: config.backgroundColor,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      duration: duration,
      action: action,
    );

    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }

  /// Get snackbar configuration based on type
  static _SnackbarConfig _getSnackbarConfig(AppSnackbarType type) {
    switch (type) {
      case AppSnackbarType.success:
        return _SnackbarConfig(
          backgroundColor: AppColors.success,
          icon: Icons.check_circle_outline,
        );
      case AppSnackbarType.error:
        return _SnackbarConfig(
          backgroundColor: AppColors.error,
          icon: Icons.error_outline,
        );
      case AppSnackbarType.warning:
        return _SnackbarConfig(
          backgroundColor: AppColors.warning,
          icon: Icons.warning_amber_outlined,
        );
      case AppSnackbarType.info:
        return _SnackbarConfig(
          backgroundColor: AppColors.info,
          icon: Icons.info_outline,
        );
    }
  }
}

/// Snackbar configuration
class _SnackbarConfig {
  final Color backgroundColor;
  final IconData icon;

  const _SnackbarConfig({
    required this.backgroundColor,
    required this.icon,
  });
}

/// Helper extension for easy snackbar access
extension SnackbarExtension on BuildContext {
  /// Show success snackbar
  void showSuccess(String message) {
    AppSnackbar.success(context: this, message: message);
  }

  /// Show error snackbar
  void showError(String message) {
    AppSnackbar.error(context: this, message: message);
  }

  /// Show warning snackbar
  void showWarning(String message) {
    AppSnackbar.warning(context: this, message: message);
  }

  /// Show info snackbar
  void showInfo(String message) {
    AppSnackbar.info(context: this, message: message);
  }
}
