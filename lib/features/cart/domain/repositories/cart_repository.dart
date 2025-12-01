import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/cart_item_entity.dart';

/// Cart repository interface
abstract class CartRepository {
  /// Get all cart items
  Future<Either<Failure, List<CartItemEntity>>> getCartItems();

  /// Add item to cart
  Future<Either<Failure, void>> addToCart(CartItemEntity item);

  /// Update cart item quantity
  Future<Either<Failure, void>> updateCartItem(String itemId, int quantity);

  /// Remove item from cart
  Future<Either<Failure, void>> removeFromCart(String itemId);

  /// Clear all items from cart
  Future<Either<Failure, void>> clearCart();

  /// Get cart total
  Future<Either<Failure, double>> getCartTotal();

  /// Get cart items count
  Future<Either<Failure, int>> getCartItemsCount();
}
