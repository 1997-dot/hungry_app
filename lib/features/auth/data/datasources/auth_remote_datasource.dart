import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:hungry_app/core/network/api_client.dart';
import 'package:hungry_app/core/services/local_storage_service.dart';
import 'package:hungry_app/core/utils/constants.dart';
import 'package:hungry_app/features/auth/data/models/user_model.dart';

abstract class AuthRemoteDataSource {
  Future<UserModel> login({
    required String email,
    required String password,
  });

  Future<UserModel> signup({
    required String name,
    required String email,
    required String password,
    required String phone,
    required String address,
  });

  Future<void> logout();
}

@Injectable(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final ApiClient _apiClient;
  final LocalStorageService _storageService;

  AuthRemoteDataSourceImpl(this._apiClient, this._storageService);

  @override
  Future<UserModel> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _apiClient.post(
        '/auth/login',
        data: {
          'email': email,
          'password': password,
        },
      );

      // Save token and login status
      final token = response.data['token'];
      await _storageService.saveString(AppConstants.keyAuthToken, token);
      await _storageService.saveBool(AppConstants.keyIsLoggedIn, true);

      // Save user data
      final user = UserModel.fromJson(response.data['user']);
      await _storageService.saveString(
        AppConstants.keyUserData,
        user.toJson().toString(),
      );

      return user;
    } on DioException catch (e) {
      throw Exception(e.response?.data['message'] ?? 'Login failed');
    }
  }

  @override
  Future<UserModel> signup({
    required String name,
    required String email,
    required String password,
    required String phone,
    required String address,
  }) async {
    try {
      final response = await _apiClient.post(
        '/auth/register',
        data: {
          'name': name,
          'email': email,
          'password': password,
          'phone': phone,
          'address': address,
        },
      );

      // Save token and login status
      final token = response.data['token'];
      await _storageService.saveString(AppConstants.keyAuthToken, token);
      await _storageService.saveBool(AppConstants.keyIsLoggedIn, true);

      // Save user data
      final user = UserModel.fromJson(response.data['user']);
      await _storageService.saveString(
        AppConstants.keyUserData,
        user.toJson().toString(),
      );

      return user;
    } on DioException catch (e) {
      throw Exception(e.response?.data['message'] ?? 'Signup failed');
    }
  }

  @override
  Future<void> logout() async {
    try {
      // Call logout API
      await _apiClient.post('/auth/logout');

      // Clear local storage
      await _storageService.remove(AppConstants.keyAuthToken);
      await _storageService.remove(AppConstants.keyUserData);
      await _storageService.saveBool(AppConstants.keyIsLoggedIn, false);
    } on DioException catch (e) {
      throw Exception(e.response?.data['message'] ?? 'Logout failed');
    }
  }
}
