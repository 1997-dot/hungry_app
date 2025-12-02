import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/order_entity.dart';
import '../entities/order_summary_entity.dart';
import '../entities/payment_method_entity.dart';

/// Checkout repository interface
abstract class CheckoutRepository {
  /// Create order summary from current cart
  Future<Either<Failure, OrderSummaryEntity>> createOrderSummary();

  /// Process payment and create order
  Future<Either<Failure, OrderEntity>> processPayment({
    required OrderSummaryEntity orderSummary,
    required PaymentMethodEntity paymentMethod,
  });

  /// Get saved payment methods
  Future<Either<Failure, List<PaymentMethodEntity>>> getSavedPaymentMethods();

  /// Save payment method
  Future<Either<Failure, void>> savePaymentMethod(PaymentMethodEntity paymentMethod);
}
