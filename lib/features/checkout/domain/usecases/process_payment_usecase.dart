import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../entities/order_entity.dart';
import '../entities/order_summary_entity.dart';
import '../entities/payment_method_entity.dart';
import '../repositories/checkout_repository.dart';

/// Parameters for processing payment
class ProcessPaymentParams {
  final OrderSummaryEntity orderSummary;
  final PaymentMethodEntity paymentMethod;

  ProcessPaymentParams({
    required this.orderSummary,
    required this.paymentMethod,
  });
}

/// Use case for processing payment
@injectable
class ProcessPaymentUseCase {
  final CheckoutRepository repository;

  ProcessPaymentUseCase(this.repository);

  Future<Either<Failure, OrderEntity>> call(ProcessPaymentParams params) async {
    return await repository.processPayment(
      orderSummary: params.orderSummary,
      paymentMethod: params.paymentMethod,
    );
  }
}
