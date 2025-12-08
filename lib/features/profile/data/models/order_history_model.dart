import '../../domain/entities/order_history_entity.dart';

/// Order history model for data layer
class OrderHistoryModel extends OrderHistoryEntity {
  const OrderHistoryModel({
    required super.id,
    required super.orderDate,
    required super.sandwichNames,
    required super.totalPrice,
    required super.status,
  });

  factory OrderHistoryModel.fromEntity(OrderHistoryEntity entity) {
    return OrderHistoryModel(
      id: entity.id,
      orderDate: entity.orderDate,
      sandwichNames: entity.sandwichNames,
      totalPrice: entity.totalPrice,
      status: entity.status,
    );
  }

  factory OrderHistoryModel.fromJson(Map<String, dynamic> json) {
    return OrderHistoryModel(
      id: json['id'] as String,
      orderDate: DateTime.parse(json['orderDate'] as String),
      sandwichNames: (json['sandwichNames'] as List).cast<String>(),
      totalPrice: (json['totalPrice'] as num).toDouble(),
      status: json['status'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'orderDate': orderDate.toIso8601String(),
      'sandwichNames': sandwichNames,
      'totalPrice': totalPrice,
      'status': status,
    };
  }
}
