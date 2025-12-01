import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/side_option_entity.dart';

part 'side_option_model.g.dart';

@JsonSerializable()
class SideOptionModel extends SideOptionEntity {
  const SideOptionModel({
    required super.id,
    required super.name,
    required super.imageUrl,
    required super.price,
    super.isSelected,
  });

  factory SideOptionModel.fromJson(Map<String, dynamic> json) =>
      _$SideOptionModelFromJson(json);

  Map<String, dynamic> toJson() => _$SideOptionModelToJson(this);

  factory SideOptionModel.fromEntity(SideOptionEntity entity) {
    return SideOptionModel(
      id: entity.id,
      name: entity.name,
      imageUrl: entity.imageUrl,
      price: entity.price,
      isSelected: entity.isSelected,
    );
  }
}
