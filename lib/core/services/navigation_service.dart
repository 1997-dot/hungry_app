import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

/// Service for handling navigation using GlobalKey
@lazySingleton
class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  /// Get current context
  BuildContext? get currentContext => navigatorKey.currentContext;

  /// Navigate to a named route
  Future<dynamic>? navigateTo(String routeName, {Object? arguments}) {
    return navigatorKey.currentState?.pushNamed(
      routeName,
      arguments: arguments,
    );
  }

  /// Navigate to a named route and remove all previous routes
  Future<dynamic>? navigateAndRemoveUntil(String routeName,
      {Object? arguments}) {
    return navigatorKey.currentState?.pushNamedAndRemoveUntil(
      routeName,
      (route) => false,
      arguments: arguments,
    );
  }

  /// Navigate to a named route and replace current route
  Future<dynamic>? navigateAndReplace(String routeName, {Object? arguments}) {
    return navigatorKey.currentState?.pushReplacementNamed(
      routeName,
      arguments: arguments,
    );
  }

  /// Pop current route
  void pop({Object? result}) {
    navigatorKey.currentState?.pop(result);
  }

  /// Check if can pop
  bool canPop() {
    return navigatorKey.currentState?.canPop() ?? false;
  }

  /// Pop until a specific route
  void popUntil(String routeName) {
    navigatorKey.currentState?.popUntil(ModalRoute.withName(routeName));
  }

  /// Show snackbar
  void showSnackBar(String message, {bool isError = false}) {
    final context = currentContext;
    if (context != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: isError ? Colors.red : Colors.green,
        ),
      );
    }
  }
}
