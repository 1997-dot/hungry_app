import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/topping_entity.dart';

part 'topping_model.g.dart';

@JsonSerializable()
class ToppingModel extends ToppingEntity {
  const ToppingModel({
    required super.id,
    required super.name,
    required super.imageUrl,
    required super.price,
    super.isSelected,
  });

  factory ToppingModel.fromJson(Map<String, dynamic> json) =>
      _$ToppingModelFromJson(json);

  Map<String, dynamic> toJson() => _$ToppingModelToJson(this);

  factory ToppingModel.fromEntity(ToppingEntity entity) {
    return ToppingModel(
      id: entity.id,
      name: entity.name,
      imageUrl: entity.imageUrl,
      price: entity.price,
      isSelected: entity.isSelected,
    );
  }
}
