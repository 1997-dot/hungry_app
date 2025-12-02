import 'package:injectable/injectable.dart';

import '../../../cart/domain/usecases/get_cart_items_usecase.dart';
import '../../domain/entities/order_entity.dart';
import '../../domain/entities/order_summary_entity.dart';
import '../models/order_model.dart';
import '../models/payment_method_model.dart';

/// Remote data source for checkout feature
abstract class CheckoutRemoteDataSource {
  /// Create order summary from current cart
  Future<OrderSummaryEntity> createOrderSummary();

  /// Process payment and create order
  Future<OrderModel> processPayment({
    required OrderSummaryEntity orderSummary,
    required PaymentMethodModel paymentMethod,
  });
}

@Injectable(as: CheckoutRemoteDataSource)
class CheckoutRemoteDataSourceImpl implements CheckoutRemoteDataSource {
  final GetCartItemsUseCase _getCartItemsUseCase;

  CheckoutRemoteDataSourceImpl(this._getCartItemsUseCase);

  @override
  Future<OrderSummaryEntity> createOrderSummary() async {
    try {
      // Get current cart items
      final result = await _getCartItemsUseCase();

      return result.fold(
        (failure) => throw Exception('Failed to load cart items'),
        (cartItems) {
          // Create order summary from cart items
          return OrderSummaryEntity.fromCartItems(cartItems);
        },
      );
    } catch (e) {
      throw Exception('Failed to create order summary: ${e.toString()}');
    }
  }

  @override
  Future<OrderModel> processPayment({
    required OrderSummaryEntity orderSummary,
    required PaymentMethodModel paymentMethod,
  }) async {
    try {
      // Simulate API call delay
      await Future.delayed(const Duration(seconds: 2));

      // In a real app, this would:
      // 1. Process payment with payment gateway
      // 2. Create order in backend
      // 3. Return order confirmation

      // For now, create a mock successful order
      final order = OrderModel(
        id: 'order_${DateTime.now().millisecondsSinceEpoch}',
        userId: 'current_user_id', // Would come from auth
        items: orderSummary.items,
        subtotal: orderSummary.subtotal,
        taxes: orderSummary.taxes,
        deliveryFee: orderSummary.deliveryFee,
        total: orderSummary.total,
        paymentMethod: paymentMethod,
        status: OrderStatus.confirmed,
        createdAt: DateTime.now(),
        estimatedDeliveryTime: orderSummary.estimatedDeliveryTime,
      );

      return order;
    } catch (e) {
      throw Exception('Payment processing failed: ${e.toString()}');
    }
  }
}
