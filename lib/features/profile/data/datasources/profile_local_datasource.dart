import 'dart:convert';

import 'package:injectable/injectable.dart';

import '../../../../core/configs/app_constants.dart';
import '../../../../core/services/local_storage_service.dart';
import '../../../auth/data/models/user_model.dart';

/// Local data source for profile feature
abstract class ProfileLocalDataSource {
  /// Get current user from local storage
  Future<UserModel> getUserProfile();
}

@Injectable(as: ProfileLocalDataSource)
class ProfileLocalDataSourceImpl implements ProfileLocalDataSource {
  final LocalStorageService _localStorageService;

  ProfileLocalDataSourceImpl(this._localStorageService);

  @override
  Future<UserModel> getUserProfile() async {
    try {
      final userDataString = _localStorageService.getString(AppConstants.keyUserData);

      if (userDataString == null) {
        throw Exception('No user data found');
      }

      final userData = json.decode(userDataString) as Map<String, dynamic>;
      return UserModel.fromJson(userData);
    } catch (e) {
      throw Exception('Failed to load user profile: ${e.toString()}');
    }
  }
}
