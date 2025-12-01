// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartItemModel _$CartItemModelFromJson(Map<String, dynamic> json) =>
    CartItemModel(
      id: json['id'] as String,
      product: ProductModel.fromJson(json['product'] as Map<String, dynamic>),
      quantity: (json['quantity'] as num).toInt(),
      selectedToppings:
          (json['selected_toppings'] as List<dynamic>?)
              ?.map((e) => ToppingModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      selectedSideOptions:
          (json['selected_side_options'] as List<dynamic>?)
              ?.map((e) => SideOptionModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      spicyLevel: (json['spicyLevel'] as num?)?.toDouble() ?? 0.0,
      addedAt: DateTime.parse(json['added_at'] as String),
    );

Map<String, dynamic> _$CartItemModelToJson(CartItemModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'quantity': instance.quantity,
      'spicyLevel': instance.spicyLevel,
      'product': instance.product.toJson(),
      'selected_toppings': instance.selectedToppings
          .map((e) => e.toJson())
          .toList(),
      'selected_side_options': instance.selectedSideOptions
          .map((e) => e.toJson())
          .toList(),
      'added_at': instance.addedAt.toIso8601String(),
    };
