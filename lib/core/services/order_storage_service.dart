import 'dart:convert';

import 'package:injectable/injectable.dart';

import '../../features/checkout/data/models/order_model.dart';
import '../configs/app_constants.dart';
import 'local_storage_service.dart';

/// Service for managing order persistence in local storage
@lazySingleton
class OrderStorageService {
  final LocalStorageService _localStorageService;

  OrderStorageService(this._localStorageService);

  /// Save a completed order to local storage
  Future<void> saveOrder(OrderModel order) async {
    try {
      final orders = await getOrders();
      orders.add(order);

      final ordersJson = orders.map((order) => order.toJson()).toList();
      await _localStorageService.saveString(
        AppConstants.keyOrderHistory,
        jsonEncode(ordersJson),
      );
    } catch (e) {
      throw Exception('Failed to save order: $e');
    }
  }

  /// Retrieve all completed orders from local storage
  Future<List<OrderModel>> getOrders() async {
    try {
      final ordersString = _localStorageService.getString(
        AppConstants.keyOrderHistory,
      );

      if (ordersString == null || ordersString.isEmpty) {
        return [];
      }

      final List<dynamic> ordersJson = jsonDecode(ordersString);
      return ordersJson
          .map((json) => OrderModel.fromJson(json as Map<String, dynamic>))
          .toList();
    } catch (e) {
      // If there's an error reading orders, return empty list
      return [];
    }
  }

  /// Clear all orders from local storage
  Future<void> clearOrders() async {
    try {
      await _localStorageService.remove(AppConstants.keyOrderHistory);
    } catch (e) {
      throw Exception('Failed to clear orders: $e');
    }
  }
}
