import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/product_entity.dart';
import 'topping_model.dart';
import 'side_option_model.dart';

part 'product_model.g.dart';

@JsonSerializable()
class ProductModel extends ProductEntity {
  const ProductModel({
    required super.id,
    required super.name,
    required super.description,
    required super.basePrice,
    required super.imageUrl,
    required super.category,
    super.availableToppings = const [],
    super.availableSideOptions = const [],
    super.spicyLevel = 0.0,
    super.rating = 0.0,
    super.reviewCount = 0,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductModelToJson(this);

  factory ProductModel.fromEntity(ProductEntity entity) {
    return ProductModel(
      id: entity.id,
      name: entity.name,
      description: entity.description,
      basePrice: entity.basePrice,
      imageUrl: entity.imageUrl,
      category: entity.category,
      availableToppings: entity.availableToppings,
      availableSideOptions: entity.availableSideOptions,
      spicyLevel: entity.spicyLevel,
      rating: entity.rating,
      reviewCount: entity.reviewCount,
    );
  }
}
