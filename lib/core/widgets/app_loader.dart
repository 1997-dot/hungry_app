import 'package:flutter/material.dart';

import '../configs/app_colors.dart';

/// Reusable loading indicator component
class AppLoader extends StatelessWidget {
  final Color? color;
  final double? size;
  final double? strokeWidth;

  const AppLoader({
    super.key,
    this.color,
    this.size,
    this.strokeWidth,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: size ?? 40,
        height: size ?? 40,
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(
            color ?? AppColors.primary,
          ),
          strokeWidth: strokeWidth ?? 4,
        ),
      ),
    );
  }
}

/// Small loading indicator
class AppLoaderSmall extends StatelessWidget {
  final Color? color;

  const AppLoaderSmall({super.key, this.color});

  @override
  Widget build(BuildContext context) {
    return AppLoader(
      color: color,
      size: 20,
      strokeWidth: 2,
    );
  }
}

/// Large loading indicator
class AppLoaderLarge extends StatelessWidget {
  final Color? color;

  const AppLoaderLarge({super.key, this.color});

  @override
  Widget build(BuildContext context) {
    return AppLoader(
      color: color,
      size: 60,
      strokeWidth: 5,
    );
  }
}

/// Full screen loading overlay
class AppLoadingOverlay extends StatelessWidget {
  final String? message;

  const AppLoadingOverlay({super.key, this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.overlay,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const AppLoader(),
            if (message != null) ...[
              const SizedBox(height: 16),
              Text(
                message!,
                style: const TextStyle(
                  color: AppColors.textLight,
                  fontSize: 14,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
