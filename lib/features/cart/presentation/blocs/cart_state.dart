import 'package:equatable/equatable.dart';

import '../../domain/entities/cart_item_entity.dart';

abstract class CartState extends Equatable {
  const CartState();

  @override
  List<Object?> get props => [];
}

/// Initial state
class CartInitial extends CartState {
  const CartInitial();
}

/// Loading state
class CartLoading extends CartState {
  const CartLoading();
}

/// Loaded state with cart items
class CartLoaded extends CartState {
  final List<CartItemEntity> items;
  final double total;
  final int itemCount;

  const CartLoaded({
    required this.items,
    required this.total,
    required this.itemCount,
  });

  @override
  List<Object?> get props => [items, total, itemCount];

  bool get isEmpty => items.isEmpty;
}

/// Error state
class CartError extends CartState {
  final String message;

  const CartError(this.message);

  @override
  List<Object?> get props => [message];
}

/// Item added successfully
class CartItemAdded extends CartState {
  final List<CartItemEntity> items;
  final double total;
  final int itemCount;

  const CartItemAdded({
    required this.items,
    required this.total,
    required this.itemCount,
  });

  @override
  List<Object?> get props => [items, total, itemCount];
}
