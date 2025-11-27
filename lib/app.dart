import 'package:flutter/material.dart';

import 'core/configs/app_theme.dart';
import 'core/configs/app_routes.dart';
import 'core/services/navigation_service.dart';
import 'core/di/injector.dart';

/// Main app widget with theme, routes, and BlocProviders
class HungryApp extends StatelessWidget {
  const HungryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hungry',
      debugShowCheckedModeBanner: false,

      // Theme
      theme: AppTheme.lightTheme,

      // Navigation
      navigatorKey: getIt<NavigationService>().navigatorKey,

      // Routes - '/' route is defined in AppRoutes as splash
      routes: AppRoutes.getRoutes(),
      initialRoute: AppRoutes.splash,
    );
  }
}
