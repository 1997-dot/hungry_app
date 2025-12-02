import 'package:equatable/equatable.dart';

import '../../../cart/domain/entities/cart_item_entity.dart';
import 'payment_method_entity.dart';

/// Order status enum
enum OrderStatus {
  pending,
  confirmed,
  preparing,
  onTheWay,
  delivered,
  cancelled,
}

/// Order entity representing a placed order
class OrderEntity extends Equatable {
  final String id;
  final String userId;
  final List<CartItemEntity> items;
  final double subtotal;
  final double taxes;
  final double deliveryFee;
  final double total;
  final PaymentMethodEntity paymentMethod;
  final OrderStatus status;
  final DateTime createdAt;
  final String estimatedDeliveryTime;

  const OrderEntity({
    required this.id,
    required this.userId,
    required this.items,
    required this.subtotal,
    required this.taxes,
    required this.deliveryFee,
    required this.total,
    required this.paymentMethod,
    required this.status,
    required this.createdAt,
    required this.estimatedDeliveryTime,
  });

  OrderEntity copyWith({
    String? id,
    String? userId,
    List<CartItemEntity>? items,
    double? subtotal,
    double? taxes,
    double? deliveryFee,
    double? total,
    PaymentMethodEntity? paymentMethod,
    OrderStatus? status,
    DateTime? createdAt,
    String? estimatedDeliveryTime,
  }) {
    return OrderEntity(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      items: items ?? this.items,
      subtotal: subtotal ?? this.subtotal,
      taxes: taxes ?? this.taxes,
      deliveryFee: deliveryFee ?? this.deliveryFee,
      total: total ?? this.total,
      paymentMethod: paymentMethod ?? this.paymentMethod,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
      estimatedDeliveryTime: estimatedDeliveryTime ?? this.estimatedDeliveryTime,
    );
  }

  @override
  List<Object?> get props => [
        id,
        userId,
        items,
        subtotal,
        taxes,
        deliveryFee,
        total,
        paymentMethod,
        status,
        createdAt,
        estimatedDeliveryTime,
      ];
}
