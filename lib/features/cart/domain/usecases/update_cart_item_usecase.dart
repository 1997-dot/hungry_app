import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failure.dart';
import '../repositories/cart_repository.dart';

/// Use case for updating cart item
@injectable
class UpdateCartItemUseCase {
  final CartRepository _repository;

  UpdateCartItemUseCase(this._repository);

  Future<Either<Failure, void>> call(String itemId, int quantity) {
    return _repository.updateCartItem(itemId, quantity);
  }
}
