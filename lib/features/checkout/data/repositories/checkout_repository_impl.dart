import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../domain/entities/order_entity.dart';
import '../../domain/entities/order_summary_entity.dart';
import '../../domain/entities/payment_method_entity.dart';
import '../../domain/repositories/checkout_repository.dart';
import '../datasources/checkout_local_datasource.dart';
import '../datasources/checkout_remote_datasource.dart';
import '../models/payment_method_model.dart';

@Injectable(as: CheckoutRepository)
class CheckoutRepositoryImpl implements CheckoutRepository {
  final CheckoutRemoteDataSource remoteDataSource;
  final CheckoutLocalDataSource localDataSource;

  CheckoutRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<Either<Failure, OrderSummaryEntity>> createOrderSummary() async {
    try {
      final orderSummary = await remoteDataSource.createOrderSummary();
      return Right(orderSummary);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, OrderEntity>> processPayment({
    required OrderSummaryEntity orderSummary,
    required PaymentMethodEntity paymentMethod,
  }) async {
    try {
      final paymentMethodModel = PaymentMethodModel.fromEntity(paymentMethod);
      final order = await remoteDataSource.processPayment(
        orderSummary: orderSummary,
        paymentMethod: paymentMethodModel,
      );

      // Save payment method if requested (credit card only)
      if (paymentMethod.isCreditCard && paymentMethod.saveCard) {
        await localDataSource.savePaymentMethod(paymentMethodModel);
      }

      return Right(order);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<PaymentMethodEntity>>> getSavedPaymentMethods() async {
    try {
      final paymentMethods = await localDataSource.getSavedPaymentMethods();
      return Right(paymentMethods);
    } catch (e) {
      return Left(CacheFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> savePaymentMethod(PaymentMethodEntity paymentMethod) async {
    try {
      final paymentMethodModel = PaymentMethodModel.fromEntity(paymentMethod);
      await localDataSource.savePaymentMethod(paymentMethodModel);
      return const Right(null);
    } catch (e) {
      return Left(CacheFailure(message: e.toString()));
    }
  }
}
