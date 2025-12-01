import 'package:equatable/equatable.dart';

/// Side option entity representing a side dish option
class SideOptionEntity extends Equatable {
  final String id;
  final String name;
  final String imageUrl;
  final double price;
  final bool isSelected;

  const SideOptionEntity({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.price,
    this.isSelected = false,
  });

  SideOptionEntity copyWith({
    String? id,
    String? name,
    String? imageUrl,
    double? price,
    bool? isSelected,
  }) {
    return SideOptionEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      imageUrl: imageUrl ?? this.imageUrl,
      price: price ?? this.price,
      isSelected: isSelected ?? this.isSelected,
    );
  }

  @override
  List<Object?> get props => [id, name, imageUrl, price, isSelected];
}
