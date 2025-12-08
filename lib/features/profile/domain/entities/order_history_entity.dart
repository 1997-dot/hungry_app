import 'package:equatable/equatable.dart';

/// Order history entity for profile
class OrderHistoryEntity extends Equatable {
  final String id;
  final DateTime orderDate;
  final List<String> sandwichNames;
  final double totalPrice;
  final String status;

  const OrderHistoryEntity({
    required this.id,
    required this.orderDate,
    required this.sandwichNames,
    required this.totalPrice,
    required this.status,
  });

  @override
  List<Object?> get props => [id, orderDate, sandwichNames, totalPrice, status];
}
