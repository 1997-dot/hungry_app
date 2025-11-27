import 'package:dartz/dartz.dart';
import 'package:hungry_app/core/error/failures.dart';
import 'package:hungry_app/features/auth/domain/entities/user_entity.dart';

abstract class AuthRepository {
  Future<Either<Failure, UserEntity>> login({
    required String email,
    required String password,
  });

  Future<Either<Failure, UserEntity>> signup({
    required String name,
    required String email,
    required String password,
    required String phone,
    required String address,
  });

  Future<Either<Failure, void>> logout();
}
