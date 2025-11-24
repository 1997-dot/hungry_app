class AppConstants {
  AppConstants._();

  // ========== App Information ==========
  static const String appName = 'Hungry';
  static const String appVersion = '1.0.0';
  static const String appTagline = 'Your favorite food, delivered fast';

  // ========== API Configuration ==========
  static const String apiBaseUrl = 'http://127.0.0.1:8000/api';
  static const Duration apiTimeout = Duration(seconds: 30);
  static const Duration apiConnectionTimeout = Duration(seconds: 10);

  // ========== Local Storage Keys ==========
  static const String keyAuthToken = 'auth_token';
  static const String keyRefreshToken = 'refresh_token';
  static const String keyUserId = 'user_id';
  static const String keyUserData = 'user_data';
  static const String keyIsLoggedIn = 'is_logged_in';
  static const String keyCartData = 'cart_data';
  static const String keyFavoritesData = 'favorites_data';
  static const String keyLastSyncTime = 'last_sync_time';
  static const String keyThemeMode = 'theme_mode';
  static const String keyLanguage = 'language';

  // ========== Validation Constants ==========
  static const int minPasswordLength = 8;
  static const int maxPasswordLength = 50;
  static const int minNameLength = 2;
  static const int maxNameLength = 50;
  static const int phoneNumberLength = 10;
  static const String emailPattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';

  // ========== UI Constants ==========
  static const double defaultPadding = 16.0;
  static const double smallPadding = 8.0;
  static const double largePadding = 24.0;
  static const double extraLargePadding = 32.0;

  static const double defaultBorderRadius = 12.0;
  static const double smallBorderRadius = 8.0;
  static const double largeBorderRadius = 16.0;
  static const double extraLargeBorderRadius = 20.0;

  static const double cardElevation = 2.0;
  static const double defaultIconSize = 24.0;
  static const double smallIconSize = 20.0;
  static const double largeIconSize = 32.0;

  // ========== Animation Durations ==========
  static const Duration shortAnimationDuration = Duration(milliseconds: 200);
  static const Duration mediumAnimationDuration = Duration(milliseconds: 300);
  static const Duration longAnimationDuration = Duration(milliseconds: 500);
  static const Duration splashDuration = Duration(seconds: 3);

  // ========== Pagination ==========
  static const int defaultPageSize = 20;
  static const int maxPageSize = 100;
  static const int initialPage = 1;

  // ========== Product Constants ==========
  static const int minQuantity = 1;
  static const int maxQuantity = 99;
  static const double minSpicyLevel = 0.0;
  static const double maxSpicyLevel = 1.0;

  // ========== Order Constants ==========
  static const double minOrderAmount = 10.0;
  static const double deliveryFee = 5.0;
  static const double taxRate = 0.10; // 10% tax
  static const int estimatedDeliveryTimeMin = 15; // minutes
  static const int estimatedDeliveryTimeMax = 30; // minutes

  // ========== Asset Paths ==========
  static const String imagesPath = 'assets/images/';
  static const String iconsPath = 'assets/images/icons/';
  static const String backgroundsPath = 'assets/images/backgrounds/';
  static const String productsPath = 'assets/images/products/';
  static const String placeholdersPath = 'assets/images/placeholders/';
  static const String fontsPath = 'assets/fonts/';
  static const String vectorsPath = 'assets/vectors/';
  static const String animationsPath = 'assets/animations/';

  // Placeholder Images
  static const String placeholderProduct = '${placeholdersPath}product.png';
  static const String placeholderUser = '${placeholdersPath}user.png';

  // ========== Payment Constants ==========
  // Payment Methods
  static const String paymentMethodCash = 'cash';
  static const String paymentMethodCard = 'card';
  static const String paymentMethodWallet = 'wallet';

  // Payment Status
  static const String paymentStatusPending = 'pending';
  static const String paymentStatusCompleted = 'completed';
  static const String paymentStatusFailed = 'failed';
  static const String paymentStatusRefunded = 'refunded';

  // ========== Order Status Constants ==========
  static const String orderStatusPending = 'pending';
  static const String orderStatusConfirmed = 'confirmed';
  static const String orderStatusPreparing = 'preparing';
  static const String orderStatusReady = 'ready';
  static const String orderStatusOnTheWay = 'on_the_way';
  static const String orderStatusDelivered = 'delivered';
  static const String orderStatusCancelled = 'cancelled';

  // ========== Error Messages ==========
  static const String errorNoInternet = 'No internet connection';
  static const String errorServerError = 'Server error. Please try again later';
  static const String errorUnknown = 'An unknown error occurred';
  static const String errorInvalidCredentials = 'Invalid email or password';
  static const String errorSessionExpired = 'Session expired. Please login again';
  static const String errorEmptyCart = 'Your cart is empty';
  static const String errorProductNotFound = 'Product not found';
  static const String errorInvalidInput = 'Please check your input';
  static const String errorTimeout = 'Request timeout. Please try again';

  // ========== Success Messages ==========
  static const String successLogin = 'Login successful';
  static const String successRegister = 'Registration successful';
  static const String successLogout = 'Logout successful';
  static const String successAddToCart = 'Added to cart';
  static const String successRemoveFromCart = 'Removed from cart';
  static const String successOrderPlaced = 'Order placed successfully';
  static const String successProfileUpdated = 'Profile updated successfully';
  static const String successAddedToFavorites = 'Added to favorites';
  static const String successRemovedFromFavorites = 'Removed from favorites';

  // ========== Info Messages ==========
  static const String infoEmptyFavorites = 'No favorites yet';
  static const String infoEmptyOrders = 'No orders yet';
  static const String infoEmptySearch = 'No results found';
  static const String infoLoading = 'Loading...';

  // ========== Date/Time Formats ==========
  static const String dateFormat = 'yyyy-MM-dd';
  static const String timeFormat = 'HH:mm';
  static const String dateTimeFormat = 'yyyy-MM-dd HH:mm:ss';
  static const String displayDateFormat = 'MMM dd, yyyy';
  static const String displayTimeFormat = 'hh:mm a';
  static const String displayDateTimeFormat = 'MMM dd, yyyy hh:mm a';

  // ========== Cache Configuration ==========
  static const Duration cacheExpiration = Duration(hours: 24);
  static const Duration categoriesCacheExpiration = Duration(hours: 12);
  static const Duration productsCacheExpiration = Duration(hours: 6);
  static const Duration profileCacheExpiration = Duration(hours: 1);

  // ========== Search Configuration ==========
  static const int minSearchLength = 2;
  static const Duration searchDebounceTime = Duration(milliseconds: 500);
  static const int maxSearchHistory = 10;

  // ========== Network Configuration ==========
  static const int maxRetryAttempts = 3;
  static const Duration retryDelay = Duration(seconds: 2);

  // ========== Image Configuration ==========
  static const int maxImageSizeMB = 5;
  static const int imageQuality = 85;
  static const int thumbnailSize = 200;

  // ========== Rating Configuration ==========
  static const double minRating = 0.0;
  static const double maxRating = 5.0;
  static const double defaultRating = 0.0;

  // ========== Bottom Navigation ==========
  static const int bottomNavHomeIndex = 0;
  static const int bottomNavFavoritesIndex = 1;
  static const int bottomNavSearchIndex = 2;
  static const int bottomNavProfileIndex = 3;
}
