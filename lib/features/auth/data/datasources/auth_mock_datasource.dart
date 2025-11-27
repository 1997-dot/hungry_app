import 'package:injectable/injectable.dart';
import 'package:hungry_app/core/services/local_storage_service.dart';
import 'package:hungry_app/core/utils/constants.dart';
import 'package:hungry_app/features/auth/data/models/user_model.dart';
import 'package:hungry_app/features/auth/data/datasources/auth_remote_datasource.dart';

/// Mock implementation of AuthRemoteDataSource for testing without backend
/// Uses test data from Postman collection
@Injectable(as: AuthRemoteDataSource)
class AuthMockDataSource implements AuthRemoteDataSource {
  final LocalStorageService _storageService;

  AuthMockDataSource(this._storageService);

  // Mock users from Postman collection
  final Map<String, Map<String, dynamic>> _mockUsers = {
    'motaz@example.com': {
      'id': '1',
      'name': 'Motaz',
      'email': 'motaz@example.com',
      'password': '12345678',
      'phone': '1234567890',
      'address': '123 Main St',
    },
    'sonic@gmail.com': {
      'id': '2',
      'name': 'Sonic',
      'email': 'Sonic@gmail.com',
      'password': '123456789',
      'phone': '1065758368',
      'address': '456 Speed Lane',
    },
  };

  @override
  Future<UserModel> login({
    required String email,
    required String password,
  }) async {
    // Simulate network delay
    await Future.delayed(const Duration(seconds: 1));

    // Check if user exists
    final userEmail = email.toLowerCase();
    if (!_mockUsers.containsKey(userEmail)) {
      throw Exception('User not found. Try: motaz@example.com or Sonic@gmail.com');
    }

    final userData = _mockUsers[userEmail]!;

    // Check password
    if (userData['password'] != password) {
      throw Exception('Invalid password');
    }

    // Generate mock token
    final token = 'mock_token_${DateTime.now().millisecondsSinceEpoch}';

    // Save token and login status
    await _storageService.saveString(AppConstants.keyAuthToken, token);
    await _storageService.saveBool(AppConstants.keyIsLoggedIn, true);

    // Create and save user
    final user = UserModel(
      id: userData['id'],
      name: userData['name'],
      email: userData['email'],
      phone: userData['phone'],
      address: userData['address'],
    );

    await _storageService.saveString(
      AppConstants.keyUserData,
      user.toJson().toString(),
    );

    return user;
  }

  @override
  Future<UserModel> signup({
    required String name,
    required String email,
    required String password,
    required String phone,
    required String address,
  }) async {
    // Simulate network delay
    await Future.delayed(const Duration(seconds: 1));

    // Check if user already exists
    final userEmail = email.toLowerCase();
    if (_mockUsers.containsKey(userEmail)) {
      throw Exception('Email already registered');
    }

    // Create new user
    final userId = '${_mockUsers.length + 1}';
    final newUser = {
      'id': userId,
      'name': name,
      'email': email,
      'password': password,
      'phone': phone,
      'address': address,
    };

    // Add to mock database
    _mockUsers[userEmail] = newUser;

    // Generate mock token
    final token = 'mock_token_${DateTime.now().millisecondsSinceEpoch}';

    // Save token and login status
    await _storageService.saveString(AppConstants.keyAuthToken, token);
    await _storageService.saveBool(AppConstants.keyIsLoggedIn, true);

    // Create and save user
    final user = UserModel(
      id: userId,
      name: name,
      email: email,
      phone: phone,
      address: address,
    );

    await _storageService.saveString(
      AppConstants.keyUserData,
      user.toJson().toString(),
    );

    return user;
  }

  @override
  Future<void> logout() async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 500));

    // Clear local storage
    await _storageService.remove(AppConstants.keyAuthToken);
    await _storageService.remove(AppConstants.keyUserData);
    await _storageService.saveBool(AppConstants.keyIsLoggedIn, false);
  }
}
