import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../entities/order_summary_entity.dart';
import '../repositories/checkout_repository.dart';

/// Use case for creating order summary
@injectable
class CreateOrderSummaryUseCase {
  final CheckoutRepository repository;

  CreateOrderSummaryUseCase(this.repository);

  Future<Either<Failure, OrderSummaryEntity>> call() async {
    return await repository.createOrderSummary();
  }
}
