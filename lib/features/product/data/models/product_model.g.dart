// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) => ProductModel(
  id: json['id'] as String,
  name: json['name'] as String,
  description: json['description'] as String,
  basePrice: (json['basePrice'] as num).toDouble(),
  imageUrl: json['imageUrl'] as String,
  category: json['category'] as String,
  availableToppings:
      (json['available_toppings'] as List<dynamic>?)
          ?.map((e) => ToppingModel.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  availableSideOptions:
      (json['available_side_options'] as List<dynamic>?)
          ?.map((e) => SideOptionModel.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  spicyLevel: (json['spicyLevel'] as num?)?.toDouble() ?? 0.0,
  rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
  reviewCount: (json['reviewCount'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$ProductModelToJson(ProductModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'basePrice': instance.basePrice,
      'imageUrl': instance.imageUrl,
      'category': instance.category,
      'spicyLevel': instance.spicyLevel,
      'rating': instance.rating,
      'reviewCount': instance.reviewCount,
      'available_toppings': instance.availableToppings
          .map((e) => e.toJson())
          .toList(),
      'available_side_options': instance.availableSideOptions
          .map((e) => e.toJson())
          .toList(),
    };
