import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failure.dart';
import '../repositories/cart_repository.dart';

/// Use case for clearing all items from cart
@injectable
class ClearCartUseCase {
  final CartRepository _repository;

  ClearCartUseCase(this._repository);

  Future<Either<Failure, void>> call() async {
    return await _repository.clearCart();
  }
}
