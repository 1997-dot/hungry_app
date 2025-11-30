import 'package:flutter/material.dart';

import 'core/configs/app_theme.dart';
import 'features/splash/presentation/pages/splash_page.dart';

/// Main app widget with theme and initial page
///
/// Uses pure Flutter navigation (Navigator.push/pop) instead of named routes
/// for better type safety and cleaner code.
class HungryApp extends StatelessWidget {
  const HungryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hungry',
      debugShowCheckedModeBanner: false,

      // Theme configuration
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.light,

      // Initial page - Splash screen
      home: const SplashPage(),
    );
  }
}
