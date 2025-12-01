import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failure.dart';
import '../entities/product_entity.dart';
import '../repositories/product_repository.dart';

/// Use case for getting product details
@injectable
class GetProductDetailsUseCase {
  final ProductRepository _repository;

  GetProductDetailsUseCase(this._repository);

  Future<Either<Failure, ProductEntity>> call(String productId) {
    return _repository.getProductDetails(productId);
  }
}
