class ApiEndpoints {
  // Base URL
  static const String baseUrl = 'http://127.0.0.1:8000/api';

  // Auth
  static const String register = '/register';
  static const String login = '/login';
  static const String logout = '/logout';

  // Profile
  static const String profile = '/profile';
  static const String updateProfile = '/update-profile';

  // Categories
  static const String categories = '/categories';

  // Products
  static const String products = '/products';
  static String productById(int id) => '/products/$id';

  // Favorites
  static const String favorites = '/favorites';
  static const String toggleFavorite = '/toggle-favorite';

  // Product Options
  static const String toppings = '/toppings';
  static const String sideOptions = '/side-options';

  // Cart
  static const String cart = '/cart';
  static const String addToCart = '/cart/add';
  static String removeFromCart(int id) => '/cart/remove/$id';

  // Orders
  static const String orders = '/orders';
  static String orderById(int id) => '/orders/$id';
}
