import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/product_entity.dart';

/// Product repository interface
abstract class ProductRepository {
  /// Get product details by ID
  Future<Either<Failure, ProductEntity>> getProductDetails(String productId);

  /// Get products by category
  Future<Either<Failure, List<ProductEntity>>> getProductsByCategory(
    String category, {
    int page = 1,
    int limit = 20,
  });

  /// Search products
  Future<Either<Failure, List<ProductEntity>>> searchProducts(
    String query, {
    int page = 1,
    int limit = 20,
  });
}
