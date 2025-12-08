import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/cart_item_entity.dart';
import '../../../product/data/models/product_model.dart';
import '../../../product/data/models/topping_model.dart';
import '../../../product/data/models/side_option_model.dart';

part 'cart_item_model.g.dart';

@JsonSerializable(explicitToJson: true)
class CartItemModel extends CartItemEntity {
  @override
  final ProductModel product;

  @override
  @JsonKey(name: 'selected_toppings')
  final List<ToppingModel> selectedToppings;

  @override
  @JsonKey(name: 'selected_side_options')
  final List<SideOptionModel> selectedSideOptions;

  @override
  @JsonKey(name: 'added_at')
  final DateTime addedAt;

  const CartItemModel({
    required super.id,
    required this.product,
    required super.quantity,
    this.selectedToppings = const [],
    this.selectedSideOptions = const [],
    super.spicyLevel,
    required this.addedAt,
  }) : super(
          product: product,
          selectedToppings: selectedToppings,
          selectedSideOptions: selectedSideOptions,
          addedAt: addedAt,
        );

  factory CartItemModel.fromJson(Map<String, dynamic> json) =>
      _$CartItemModelFromJson(json);

  Map<String, dynamic> toJson() => _$CartItemModelToJson(this);

  factory CartItemModel.fromEntity(CartItemEntity entity) {
    return CartItemModel(
      id: entity.id,
      product: entity.product is ProductModel
          ? entity.product as ProductModel
          : ProductModel.fromEntity(entity.product),
      quantity: entity.quantity,
      selectedToppings: entity.selectedToppings
          .map((t) => t is ToppingModel ? t : ToppingModel.fromEntity(t))
          .toList(),
      selectedSideOptions: entity.selectedSideOptions
          .map((s) => s is SideOptionModel ? s : SideOptionModel.fromEntity(s))
          .toList(),
      spicyLevel: entity.spicyLevel,
      addedAt: entity.addedAt,
    );
  }
}
