import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../auth/domain/entities/user_entity.dart';
import '../entities/order_history_entity.dart';

/// Profile repository interface
abstract class ProfileRepository {
  /// Get current user profile
  Future<Either<Failure, UserEntity>> getUserProfile();

  /// Get user order history
  Future<Either<Failure, List<OrderHistoryEntity>>> getOrderHistory();

  /// Update user profile
  Future<Either<Failure, UserEntity>> updateUserProfile(UserEntity user);
}
