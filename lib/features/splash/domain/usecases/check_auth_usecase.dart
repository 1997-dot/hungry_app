import 'package:injectable/injectable.dart';

import '../../../../core/services/local_storage_service.dart';
import '../../../../core/configs/app_constants.dart';

/// Use case to check if user is authenticated
@injectable
class CheckAuthUseCase {
  final LocalStorageService _storageService;

  CheckAuthUseCase(this._storageService);

  /// Returns true if user is logged in (has auth token)
  bool call() {
    final token = _storageService.getString(AppConstants.keyAuthToken);
    final isLoggedIn = _storageService.getBool(AppConstants.keyIsLoggedIn) ?? false;

    return token != null && token.isNotEmpty && isLoggedIn;
  }
}
