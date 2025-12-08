import 'package:injectable/injectable.dart';

import '../../../../core/services/order_storage_service.dart';
import '../models/order_history_model.dart';

/// Remote data source for profile feature
abstract class ProfileRemoteDataSource {
  /// Get user order history
  Future<List<OrderHistoryModel>> getOrderHistory();
}

@Injectable(as: ProfileRemoteDataSource)
class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  final OrderStorageService _orderStorageService;

  ProfileRemoteDataSourceImpl(this._orderStorageService);

  @override
  Future<List<OrderHistoryModel>> getOrderHistory() async {
    try {
      // Get actual orders from local storage
      final orders = await _orderStorageService.getOrders();

      // Convert OrderModel to OrderHistoryModel
      final orderHistory = orders.map((order) {
        // Extract sandwich names from cart items
        final sandwichNames = order.items
            .map((item) => item.product.name)
            .toList();

        return OrderHistoryModel(
          id: order.id,
          orderDate: order.createdAt,
          sandwichNames: sandwichNames,
          totalPrice: order.total,
          status: _getOrderStatusText(order.status.toString()),
        );
      }).toList();

      // Sort by date (newest first)
      orderHistory.sort((a, b) => b.orderDate.compareTo(a.orderDate));

      return orderHistory;
    } catch (e) {
      throw Exception('Failed to load order history: ${e.toString()}');
    }
  }

  String _getOrderStatusText(String status) {
    // Convert enum string to display text
    final statusName = status.split('.').last;
    switch (statusName) {
      case 'pending':
        return 'Pending';
      case 'confirmed':
        return 'Confirmed';
      case 'preparing':
        return 'Preparing';
      case 'onTheWay':
        return 'On The Way';
      case 'delivered':
        return 'Delivered';
      case 'cancelled':
        return 'Cancelled';
      default:
        return 'Unknown';
    }
  }
}
