import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../services/local_storage_service.dart';
import '../configs/app_constants.dart';

/// Interceptor for adding authentication token to requests
@injectable
class AuthInterceptor extends Interceptor {
  final LocalStorageService _localStorageService;

  AuthInterceptor(this._localStorageService);

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) {
    // Get token from local storage
    final token = _localStorageService.getString(AppConstants.keyAuthToken);

    // Add token to headers if available
    if (token != null && token.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $token';
    }

    super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // Handle 401 Unauthorized - token expired
    if (err.response?.statusCode == 401) {
      // Clear stored auth data
      _localStorageService.remove(AppConstants.keyAuthToken);
      _localStorageService.remove(AppConstants.keyRefreshToken);
      _localStorageService.remove(AppConstants.keyIsLoggedIn);
      _localStorageService.remove(AppConstants.keyUserId);
      _localStorageService.remove(AppConstants.keyUserData);

      // TODO: Navigate to login page or show session expired dialog
      // This could be done via a stream/event bus to notify the UI layer
    }

    super.onError(err, handler);
  }
}
