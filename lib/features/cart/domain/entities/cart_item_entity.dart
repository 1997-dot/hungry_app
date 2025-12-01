import 'package:equatable/equatable.dart';

import '../../../product/domain/entities/product_entity.dart';
import '../../../product/domain/entities/topping_entity.dart';
import '../../../product/domain/entities/side_option_entity.dart';

/// Cart item entity representing a product in the cart
class CartItemEntity extends Equatable {
  final String id;
  final ProductEntity product;
  final int quantity;
  final List<ToppingEntity> selectedToppings;
  final List<SideOptionEntity> selectedSideOptions;
  final double spicyLevel;
  final DateTime addedAt;

  const CartItemEntity({
    required this.id,
    required this.product,
    required this.quantity,
    this.selectedToppings = const [],
    this.selectedSideOptions = const [],
    this.spicyLevel = 0.0,
    required this.addedAt,
  });

  /// Calculate the total price for this cart item
  double get totalPrice {
    double basePrice = product.basePrice;

    // Add topping prices
    for (var topping in selectedToppings) {
      basePrice += topping.price;
    }

    // Add side option prices
    for (var side in selectedSideOptions) {
      basePrice += side.price;
    }

    return basePrice * quantity;
  }

  /// Calculate price per item (including toppings and sides)
  double get pricePerItem {
    double price = product.basePrice;

    for (var topping in selectedToppings) {
      price += topping.price;
    }

    for (var side in selectedSideOptions) {
      price += side.price;
    }

    return price;
  }

  CartItemEntity copyWith({
    String? id,
    ProductEntity? product,
    int? quantity,
    List<ToppingEntity>? selectedToppings,
    List<SideOptionEntity>? selectedSideOptions,
    double? spicyLevel,
    DateTime? addedAt,
  }) {
    return CartItemEntity(
      id: id ?? this.id,
      product: product ?? this.product,
      quantity: quantity ?? this.quantity,
      selectedToppings: selectedToppings ?? this.selectedToppings,
      selectedSideOptions: selectedSideOptions ?? this.selectedSideOptions,
      spicyLevel: spicyLevel ?? this.spicyLevel,
      addedAt: addedAt ?? this.addedAt,
    );
  }

  @override
  List<Object?> get props => [
        id,
        product,
        quantity,
        selectedToppings,
        selectedSideOptions,
        spicyLevel,
        addedAt,
      ];
}
