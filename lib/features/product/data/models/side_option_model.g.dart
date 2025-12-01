// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'side_option_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SideOptionModel _$SideOptionModelFromJson(Map<String, dynamic> json) =>
    SideOptionModel(
      id: json['id'] as String,
      name: json['name'] as String,
      imageUrl: json['imageUrl'] as String,
      price: (json['price'] as num).toDouble(),
      isSelected: json['isSelected'] as bool? ?? false,
    );

Map<String, dynamic> _$SideOptionModelToJson(SideOptionModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'imageUrl': instance.imageUrl,
      'price': instance.price,
      'isSelected': instance.isSelected,
    };
