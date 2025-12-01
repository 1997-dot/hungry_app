import 'package:equatable/equatable.dart';

import 'topping_entity.dart';
import 'side_option_entity.dart';

/// Product entity representing a food product
class ProductEntity extends Equatable {
  final String id;
  final String name;
  final String description;
  final double basePrice;
  final String imageUrl; // Large detail image
  final String thumbnailUrl; // Small thumbnail image for cart/list
  final String category;
  final List<ToppingEntity> availableToppings;
  final List<SideOptionEntity> availableSideOptions;
  final double spicyLevel; // 0.0 to 1.0
  final double rating;
  final int reviewCount;

  const ProductEntity({
    required this.id,
    required this.name,
    required this.description,
    required this.basePrice,
    required this.imageUrl,
    required this.thumbnailUrl,
    required this.category,
    this.availableToppings = const [],
    this.availableSideOptions = const [],
    this.spicyLevel = 0.0,
    this.rating = 0.0,
    this.reviewCount = 0,
  });

  /// Calculate total price including selected toppings and sides
  double get totalPrice {
    double total = basePrice;

    // Add topping prices
    for (var topping in availableToppings) {
      if (topping.isSelected) {
        total += topping.price;
      }
    }

    // Add side option prices
    for (var side in availableSideOptions) {
      if (side.isSelected) {
        total += side.price;
      }
    }

    return total;
  }

  ProductEntity copyWith({
    String? id,
    String? name,
    String? description,
    double? basePrice,
    String? imageUrl,
    String? thumbnailUrl,
    String? category,
    List<ToppingEntity>? availableToppings,
    List<SideOptionEntity>? availableSideOptions,
    double? spicyLevel,
    double? rating,
    int? reviewCount,
  }) {
    return ProductEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      basePrice: basePrice ?? this.basePrice,
      imageUrl: imageUrl ?? this.imageUrl,
      thumbnailUrl: thumbnailUrl ?? this.thumbnailUrl,
      category: category ?? this.category,
      availableToppings: availableToppings ?? this.availableToppings,
      availableSideOptions: availableSideOptions ?? this.availableSideOptions,
      spicyLevel: spicyLevel ?? this.spicyLevel,
      rating: rating ?? this.rating,
      reviewCount: reviewCount ?? this.reviewCount,
    );
  }

  @override
  List<Object?> get props => [
        id,
        name,
        description,
        basePrice,
        imageUrl,
        thumbnailUrl,
        category,
        availableToppings,
        availableSideOptions,
        spicyLevel,
        rating,
        reviewCount,
      ];
}
