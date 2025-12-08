import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/product_entity.dart';
import 'topping_model.dart';
import 'side_option_model.dart';

part 'product_model.g.dart';

@JsonSerializable(explicitToJson: true)
class ProductModel extends ProductEntity {
  @override
  @JsonKey(name: 'available_toppings')
  final List<ToppingModel> availableToppings;

  @override
  @JsonKey(name: 'available_side_options')
  final List<SideOptionModel> availableSideOptions;

  const ProductModel({
    required super.id,
    required super.name,
    required super.description,
    required super.basePrice,
    required super.imageUrl,
    required super.thumbnailUrl,
    required super.category,
    this.availableToppings = const [],
    this.availableSideOptions = const [],
    super.spicyLevel,
    super.rating,
    super.reviewCount,
  }) : super(
          availableToppings: availableToppings,
          availableSideOptions: availableSideOptions,
        );

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
      thumbnailUrl: entity.thumbnailUrl,
      category: entity.category,
      availableToppings: entity.availableToppings
          .map((t) => ToppingModel.fromEntity(t))
          .toList(),
      availableSideOptions: entity.availableSideOptions
          .map((s) => SideOptionModel.fromEntity(s))
          .toList(),
      spicyLevel: entity.spicyLevel,
      rating: entity.rating,
      reviewCount: entity.reviewCount,
    );
  }
}
