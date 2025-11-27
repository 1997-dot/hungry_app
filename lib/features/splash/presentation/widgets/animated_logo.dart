import 'package:flutter/material.dart';

import '../../../../core/configs/app_colors.dart';

/// Animated logo widget for splash screen
/// Shows "HUNGRY?" text and burger image with fade-in animation
class AnimatedLogo extends StatefulWidget {
  const AnimatedLogo({super.key});

  @override
  State<AnimatedLogo> createState() => _AnimatedLogoState();
}

class _AnimatedLogoState extends State<AnimatedLogo>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    // Create animation controller
    _controller = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    // Fade animation
    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeIn,
      ),
    );

    // Start animation
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    // Design reference dimensions
    const designWidth = 430.0;
    const designHeight = 932.0;

    // Calculate responsive scale factors
    final widthScale = screenWidth / designWidth;
    final heightScale = screenHeight / designHeight;

    // Use the smaller scale to ensure content fits on screen
    final scale = widthScale < heightScale ? widthScale : heightScale;

    return FadeTransition(
      opacity: _fadeAnimation,
      child: SizedBox(
        width: screenWidth,
        height: screenHeight,
        child: Stack(
          children: [
            // "HUNGRY?" logo text - positioned at top
            Positioned(
              top: 290 * heightScale,
              left: screenWidth / 2 - (258 * scale) / 2, // Center horizontally
              child: Image.asset(
                'assets/images/placeholders/Hungry_.png',
                width: 258 * scale,
                height: 60 * scale,
                fit: BoxFit.contain,
                color: AppColors.textLight,
              ),
            ),
            // Burger image - positioned at bottom with proper spacing
            Positioned(
              bottom: screenHeight - (632 * heightScale) - (348 * scale),
              left: screenWidth / 2 - (439 * scale) / 2, // Center horizontally
              child: Image.asset(
                'assets/images/products/splash.png',
                width: 439 * scale,
                height: 348 * scale,
                fit: BoxFit.contain,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
