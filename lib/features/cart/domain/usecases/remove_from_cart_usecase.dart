import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failure.dart';
import '../repositories/cart_repository.dart';

/// Use case for removing item from cart
@injectable
class RemoveFromCartUseCase {
  final CartRepository _repository;

  RemoveFromCartUseCase(this._repository);

  Future<Either<Failure, void>> call(String itemId) {
    return _repository.removeFromCart(itemId);
  }
}
