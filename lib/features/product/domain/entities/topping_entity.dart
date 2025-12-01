import 'package:equatable/equatable.dart';

/// Topping entity for product customization
class ToppingEntity extends Equatable {
  final String id;
  final String name;
  final String imageUrl;
  final double price;
  final bool isSelected;

  const ToppingEntity({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.price,
    this.isSelected = false,
  });

  /// Create a copy with updated fields
  ToppingEntity copyWith({
    String? id,
    String? name,
    String? imageUrl,
    double? price,
    bool? isSelected,
  }) {
    return ToppingEntity(
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
