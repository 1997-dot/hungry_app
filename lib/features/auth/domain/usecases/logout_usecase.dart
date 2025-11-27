import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:hungry_app/core/error/failures.dart';
import 'package:hungry_app/features/auth/domain/repositories/auth_repository.dart';

@injectable
class LogoutUseCase {
  final AuthRepository _repository;

  LogoutUseCase(this._repository);

  Future<Either<Failure, void>> call() async {
    return await _repository.logout();
  }
}
