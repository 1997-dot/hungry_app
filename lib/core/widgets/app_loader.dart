import 'package:flutter/material.dart';
import '../configs/app_colors.dart';

/// AppLoader - Loading indicator components for the Hungry app
///
/// Provides multiple loading indicator variants:
/// - Standard circular progress indicator
/// - Small loader for buttons
/// - Large loader for full-screen loading
/// - Loading overlay with dark background
///
/// Integrates with the app's design system using AppColors
///
/// Usage:
/// ```dart
/// // Standard loader
/// AppLoader()
///
/// // Small loader (for buttons)
/// AppLoader.small()
///
/// // Large loader (for full screen)
/// AppLoader.large()
///
/// // Loading overlay
/// AppLoadingOverlay(
///   isLoading: true,
///   child: YourWidget(),
/// )
/// ```

class AppLoader extends StatelessWidget {
  /// Size of the loader
  final double? size;

  /// Color of the loader
  final Color? color;

  /// Stroke width
  final double? strokeWidth;

  const AppLoader({
    this.size,
    this.color,
    this.strokeWidth,
    super.key,
  });

  /// Small loader - For buttons and small spaces
  factory AppLoader.small({Color? color, Key? key}) {
    return AppLoader(
      size: 16,
      strokeWidth: 2,
      color: color,
      key: key,
    );
  }

  /// Medium loader - Default size
  factory AppLoader.medium({Color? color, Key? key}) {
    return AppLoader(
      size: 24,
      strokeWidth: 3,
      color: color,
      key: key,
    );
  }

  /// Large loader - For full-screen loading
  factory AppLoader.large({Color? color, Key? key}) {
    return AppLoader(
      size: 40,
      strokeWidth: 4,
      color: color,
      key: key,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size ?? 24,
      height: size ?? 24,
      child: CircularProgressIndicator(
        strokeWidth: strokeWidth ?? 3,
        valueColor: AlwaysStoppedAnimation<Color>(
          color ?? AppColors.primary,
        ),
      ),
    );
  }
}

/// Loading overlay - Full-screen loading with dark background
class AppLoadingOverlay extends StatelessWidget {
  /// Whether to show the loading overlay
  final bool isLoading;

  /// The child widget to display
  final Widget child;

  /// Loading message
  final String? message;

  /// Background overlay color
  final Color? overlayColor;

  /// Loader color
  final Color? loaderColor;

  const AppLoadingOverlay({
    required this.isLoading,
    required this.child,
    this.message,
    this.overlayColor,
    this.loaderColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        if (isLoading)
          Container(
            color: overlayColor ?? AppColors.overlay,
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AppLoader.large(color: loaderColor ?? AppColors.textLight),
                  if (message != null) ...[
                    const SizedBox(height: 16),
                    Text(
                      message!,
                      style: const TextStyle(
                        color: AppColors.textLight,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
      ],
    );
  }
}

/// Loading dialog - Modal dialog with loading indicator
class AppLoadingDialog extends StatelessWidget {
  /// Loading message
  final String? message;

  const AppLoadingDialog({
    this.message,
    super.key,
  });

  /// Show loading dialog
  static Future<void> show(
    BuildContext context, {
    String? message,
  }) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AppLoadingDialog(message: message),
    );
  }

  /// Hide loading dialog
  static void hide(BuildContext context) {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.background,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppLoader.large(),
            if (message != null) ...[
              const SizedBox(height: 16),
              Text(
                message!,
                style: const TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
