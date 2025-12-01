import 'package:equatable/equatable.dart';

abstract class ProductEvent extends Equatable {
  const ProductEvent();

  @override
  List<Object?> get props => [];
}

/// Event to load product details
class LoadProductDetailsEvent extends ProductEvent {
  final String productId;

  const LoadProductDetailsEvent(this.productId);

  @override
  List<Object?> get props => [productId];
}

/// Event to toggle topping selection
class ToggleToppingEvent extends ProductEvent {
  final String toppingId;

  const ToggleToppingEvent(this.toppingId);

  @override
  List<Object?> get props => [toppingId];
}

/// Event to toggle side option selection
class ToggleSideOptionEvent extends ProductEvent {
  final String sideOptionId;

  const ToggleSideOptionEvent(this.sideOptionId);

  @override
  List<Object?> get props => [sideOptionId];
}

/// Event to update spicy level
class UpdateSpicyLevelEvent extends ProductEvent {
  final double spicyLevel;

  const UpdateSpicyLevelEvent(this.spicyLevel);

  @override
  List<Object?> get props => [spicyLevel];
}

/// Event to add product to cart
class AddProductToCartEvent extends ProductEvent {
  const AddProductToCartEvent();
}
