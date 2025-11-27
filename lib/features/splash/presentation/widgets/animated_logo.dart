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
    return FadeTransition(
      opacity: _fadeAnimation,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // "HUNGRY?" logo text
          Image.asset(
            'assets/images/placeholders/Hungry_.png',
            width: 200,
            height: 80,
            fit: BoxFit.contain,
            color: AppColors.textLight,
          ),
          const SizedBox(height: 40),
          // Burger image
          Image.asset(
            'assets/images/products/splash.png',
            width: 180,
            height: 180,
            fit: BoxFit.contain,
          ),
        ],
      ),
    );
  }
}
