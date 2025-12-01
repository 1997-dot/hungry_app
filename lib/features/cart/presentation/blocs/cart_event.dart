import 'package:equatable/equatable.dart';

import '../../domain/entities/cart_item_entity.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object?> get props => [];
}

/// Event to load cart items
class LoadCartEvent extends CartEvent {
  const LoadCartEvent();
}

/// Event to add item to cart
class AddToCartEvent extends CartEvent {
  final CartItemEntity item;

  const AddToCartEvent(this.item);

  @override
  List<Object?> get props => [item];
}

/// Event to update cart item quantity
class UpdateCartItemEvent extends CartEvent {
  final String itemId;
  final int quantity;

  const UpdateCartItemEvent(this.itemId, this.quantity);

  @override
  List<Object?> get props => [itemId, quantity];
}

/// Event to remove item from cart
class RemoveFromCartEvent extends CartEvent {
  final String itemId;

  const RemoveFromCartEvent(this.itemId);

  @override
  List<Object?> get props => [itemId];
}

/// Event to clear cart
class ClearCartEvent extends CartEvent {
  const ClearCartEvent();
}
