import 'package:flutter/material.dart';
import 'package:hungry_app/features/splash/presentation/pages/splash_page.dart';
import 'package:hungry_app/features/auth/presentation/pages/login_page.dart';
import 'package:hungry_app/features/auth/presentation/pages/signup_page.dart';
import 'package:hungry_app/features/home/presentation/pages/home_page.dart';

class AppRoutes {
  static const String splash = '/';
  static const String login = '/login';
  static const String signup = '/signup';
  static const String home = '/home';
  static const String productDetails = '/product-details';
  static const String cart = '/cart';
  static const String checkout = '/checkout';
  static const String payment = '/payment';
  static const String profile = '/profile';
  static const String favorites = '/favorites';
  static const String search = '/search';

  static Map<String, WidgetBuilder> getRoutes() {
    return {
      splash: (context) => const SplashPage(),
      login: (context) => const LoginPage(),
      signup: (context) => const SignupPage(),
      home: (context) => const HomePage(),
    };
  }
}
