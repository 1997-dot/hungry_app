import '../../domain/entities/order_entity.dart';

/// Order model for data layer
/// Note: This model extends OrderEntity directly and doesn't need JSON serialization
/// as it's primarily used for in-memory operations
class OrderModel extends OrderEntity {
  const OrderModel({
    required super.id,
    required super.userId,
    required super.items,
    required super.subtotal,
    required super.taxes,
    required super.deliveryFee,
    required super.total,
    required super.paymentMethod,
    required super.status,
    required super.createdAt,
    required super.estimatedDeliveryTime,
  });

  factory OrderModel.fromEntity(OrderEntity entity) {
    return OrderModel(
      id: entity.id,
      userId: entity.userId,
      items: entity.items,
      subtotal: entity.subtotal,
      taxes: entity.taxes,
      deliveryFee: entity.deliveryFee,
      total: entity.total,
      paymentMethod: entity.paymentMethod,
      status: entity.status,
      createdAt: entity.createdAt,
      estimatedDeliveryTime: entity.estimatedDeliveryTime,
    );
  }
}
