import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../entities/order_history_entity.dart';
import '../repositories/profile_repository.dart';

/// Use case for getting order history
@injectable
class GetOrderHistoryUseCase {
  final ProfileRepository repository;

  GetOrderHistoryUseCase(this.repository);

  Future<Either<Failure, List<OrderHistoryEntity>>> call() async {
    return await repository.getOrderHistory();
  }
}
