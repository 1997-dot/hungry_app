import 'package:equatable/equatable.dart';

import '../../../cart/domain/entities/cart_item_entity.dart';

/// Order summary entity containing all pricing information
class OrderSummaryEntity extends Equatable {
  final List<CartItemEntity> items;
  final double subtotal;
  final double taxes;
  final double deliveryFee;
  final double total;
  final String estimatedDeliveryTime;

  const OrderSummaryEntity({
    required this.items,
    required this.subtotal,
    required this.taxes,
    required this.deliveryFee,
    required this.total,
    required this.estimatedDeliveryTime,
  });

  /// Create order summary from cart items
  factory OrderSummaryEntity.fromCartItems(List<CartItemEntity> items) {
    // Calculate subtotal from all cart items
    final subtotal = items.fold<double>(
      0.0,
      (sum, item) => sum + item.totalPrice,
    );

    // Fixed values as per requirements
    const taxes = 0.5;
    const deliveryFee = 1.5;

    // Calculate total
    final total = subtotal + taxes + deliveryFee;

    // Estimated delivery time range
    const estimatedDeliveryTime = '15-30 mins';

    return OrderSummaryEntity(
      items: items,
      subtotal: subtotal,
      taxes: taxes,
      deliveryFee: deliveryFee,
      total: total,
      estimatedDeliveryTime: estimatedDeliveryTime,
    );
  }

  @override
  List<Object?> get props => [
        items,
        subtotal,
        taxes,
        deliveryFee,
        total,
        estimatedDeliveryTime,
      ];
}
