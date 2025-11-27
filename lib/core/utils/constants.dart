/// Application-wide constants
class AppConstants {
  // Storage keys
  static const String keyAuthToken = 'auth_token';
  static const String keyIsLoggedIn = 'is_logged_in';
  static const String keyUserData = 'user_data';

  // API endpoints (will be configured with base URL in ApiClient)
  static const String endpointLogin = '/auth/login';
  static const String endpointRegister = '/auth/register';
  static const String endpointLogout = '/auth/logout';

  // Timing
  static const int splashDuration = 2; // seconds

  // Private constructor to prevent instantiation
  AppConstants._();
}
