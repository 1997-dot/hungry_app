import 'package:injectable/injectable.dart';

import '../models/order_history_model.dart';

/// Remote data source for profile feature
abstract class ProfileRemoteDataSource {
  /// Get user order history
  Future<List<OrderHistoryModel>> getOrderHistory();
}

@Injectable(as: ProfileRemoteDataSource)
class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  ProfileRemoteDataSourceImpl();

  @override
  Future<List<OrderHistoryModel>> getOrderHistory() async {
    try {
      // Simulate API call delay
      await Future.delayed(const Duration(seconds: 1));

      // In a real app, this would call the backend API
      // For now, return mock order history data
      return _getMockOrderHistory();
    } catch (e) {
      throw Exception('Failed to load order history: ${e.toString()}');
    }
  }

  List<OrderHistoryModel> _getMockOrderHistory() {
    return [
      OrderHistoryModel(
        id: 'order_001',
        orderDate: DateTime.now().subtract(const Duration(days: 2)),
        sandwichNames: ['Cheeseburger', 'Hamburger'],
        totalPrice: 25.50,
        status: 'Delivered',
      ),
      OrderHistoryModel(
        id: 'order_002',
        orderDate: DateTime.now().subtract(const Duration(days: 5)),
        sandwichNames: ['Hamburger', 'Veggie Burger', 'Chicken Burger'],
        totalPrice: 38.00,
        status: 'Delivered',
      ),
      OrderHistoryModel(
        id: 'order_003',
        orderDate: DateTime.now().subtract(const Duration(days: 10)),
        sandwichNames: ['Fried Chicken Burger'],
        totalPrice: 12.50,
        status: 'Delivered',
      ),
      OrderHistoryModel(
        id: 'order_004',
        orderDate: DateTime.now().subtract(const Duration(days: 15)),
        sandwichNames: ['Cheeseburger', 'Chicken Burger'],
        totalPrice: 22.00,
        status: 'Delivered',
      ),
    ];
  }
}
