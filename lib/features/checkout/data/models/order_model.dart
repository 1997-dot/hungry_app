import '../../../cart/data/models/cart_item_model.dart';
import '../../domain/entities/order_entity.dart';
import 'payment_method_model.dart';

/// Order model for data layer
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

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      id: json['id'] as String,
      userId: json['user_id'] as String,
      items: (json['items'] as List<dynamic>)
          .map((item) => CartItemModel.fromJson(item as Map<String, dynamic>))
          .toList(),
      subtotal: (json['subtotal'] as num).toDouble(),
      taxes: (json['taxes'] as num).toDouble(),
      deliveryFee: (json['delivery_fee'] as num).toDouble(),
      total: (json['total'] as num).toDouble(),
      paymentMethod: PaymentMethodModel.fromJson(
        json['payment_method'] as Map<String, dynamic>,
      ),
      status: OrderStatus.values.firstWhere(
        (e) => e.toString() == 'OrderStatus.${json['status']}',
        orElse: () => OrderStatus.pending,
      ),
      createdAt: DateTime.parse(json['created_at'] as String),
      estimatedDeliveryTime: json['estimated_delivery_time'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'items': items
          .map((item) => CartItemModel.fromEntity(item).toJson())
          .toList(),
      'subtotal': subtotal,
      'taxes': taxes,
      'delivery_fee': deliveryFee,
      'total': total,
      'payment_method': PaymentMethodModel.fromEntity(paymentMethod).toJson(),
      'status': status.toString().split('.').last,
      'created_at': createdAt.toIso8601String(),
      'estimated_delivery_time': estimatedDeliveryTime,
    };
  }

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
