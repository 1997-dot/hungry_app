import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:hungry_app/core/error/failures.dart';
import 'package:hungry_app/features/auth/domain/entities/user_entity.dart';
import 'package:hungry_app/features/auth/domain/repositories/auth_repository.dart';

@injectable
class SignupUseCase {
  final AuthRepository _repository;

  SignupUseCase(this._repository);

  Future<Either<Failure, UserEntity>> call({
    required String name,
    required String email,
    required String password,
    required String phone,
    required String address,
  }) async {
    return await _repository.signup(
      name: name,
      email: email,
      password: password,
      phone: phone,
      address: address,
    );
  }
}
