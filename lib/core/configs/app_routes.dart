import 'package:flutter/material.dart';

// TODO: Import page widgets as they are implemented
// import '../../features/auth/presentation/pages/login_page.dart';
// import '../../features/auth/presentation/pages/register_page.dart';
// import '../../features/cart/presentation/pages/cart_page.dart';
// import '../../features/checkout/presentation/pages/checkout_page.dart';
// import '../../features/favorites/presentation/pages/favorites_page.dart';
// import '../../features/home/presentation/pages/home_page.dart';
// import '../../features/payment/presentation/pages/payment_success_page.dart';
// import '../../features/product_details/presentation/pages/product_details_page.dart';
// import '../../features/profile/presentation/pages/profile_page.dart';
// import '../../features/search/presentation/pages/search_page.dart';
// import '../../features/splash/presentation/pages/splash_page.dart';

class AppRoutes {
  AppRoutes._();

  // Route Names
  static const String splash = '/';
  static const String login = '/login';
  static const String register = '/register';
  static const String home = '/home';
  static const String productDetails = '/product-details';
  static const String cart = '/cart';
  static const String checkout = '/checkout';
  static const String paymentSuccess = '/payment-success';
  static const String profile = '/profile';
  static const String favorites = '/favorites';
  static const String search = '/search';

  /// Returns a map of all routes in the app
  /// TODO: Uncomment routes as pages are implemented
  static Map<String, WidgetBuilder> getRoutes() {
    return {
      // splash: (context) => const SplashPage(),
      // login: (context) => const LoginPage(),
      // register: (context) => const RegisterPage(),
      // home: (context) => const HomePage(),
      // productDetails: (context) => const ProductDetailsPage(),
      // cart: (context) => const CartPage(),
      // checkout: (context) => const CheckoutPage(),
      // paymentSuccess: (context) => const PaymentSuccessPage(),
      // profile: (context) => const ProfilePage(),
      // favorites: (context) => const FavoritesPage(),
      // search: (context) => const SearchPage(),
    };
  }

  /// Navigate to a named route
  static Future<dynamic> navigateTo(BuildContext context, String routeName,
      {Object? arguments}) {
    return Navigator.pushNamed(context, routeName, arguments: arguments);
  }

  /// Navigate to a named route and remove all previous routes
  static Future<dynamic> navigateAndRemoveUntil(
      BuildContext context, String routeName,
      {Object? arguments}) {
    return Navigator.pushNamedAndRemoveUntil(
      context,
      routeName,
      (route) => false,
      arguments: arguments,
    );
  }

  /// Navigate to a named route and replace the current route
  static Future<dynamic> navigateAndReplace(
      BuildContext context, String routeName,
      {Object? arguments}) {
    return Navigator.pushReplacementNamed(
      context,
      routeName,
      arguments: arguments,
    );
  }

  /// Pop the current route
  static void pop(BuildContext context, {Object? result}) {
    Navigator.pop(context, result);
  }

  /// Check if can pop
  static bool canPop(BuildContext context) {
    return Navigator.canPop(context);
  }
}
