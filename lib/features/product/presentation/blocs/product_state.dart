import 'package:equatable/equatable.dart';

import '../../domain/entities/product_entity.dart';

abstract class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object?> get props => [];
}

/// Initial state
class ProductInitial extends ProductState {
  const ProductInitial();
}

/// Loading state
class ProductLoading extends ProductState {
  const ProductLoading();
}

/// Loaded state with product data
class ProductLoaded extends ProductState {
  final ProductEntity product;
  final double currentSpicyLevel;

  const ProductLoaded(this.product, {this.currentSpicyLevel = 0.0});

  @override
  List<Object?> get props => [product, currentSpicyLevel];

  ProductLoaded copyWith({
    ProductEntity? product,
    double? currentSpicyLevel,
  }) {
    return ProductLoaded(
      product ?? this.product,
      currentSpicyLevel: currentSpicyLevel ?? this.currentSpicyLevel,
    );
  }
}

/// Error state
class ProductError extends ProductState {
  final String message;

  const ProductError(this.message);

  @override
  List<Object?> get props => [message];
}
