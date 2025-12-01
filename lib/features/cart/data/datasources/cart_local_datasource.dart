import 'dart:convert';
import 'package:injectable/injectable.dart';

import '../../../../core/configs/app_constants.dart';
import '../../../../core/services/local_storage_service.dart';
import '../models/cart_item_model.dart';

/// Local data source for cart
abstract class CartLocalDataSource {
  Future<List<CartItemModel>> getCartItems();
  Future<void> saveCartItems(List<CartItemModel> items);
  Future<void> addCartItem(CartItemModel item);
  Future<void> updateCartItem(String itemId, int quantity);
  Future<void> removeCartItem(String itemId);
  Future<void> clearCart();
}

/// Implementation of cart local data source
@LazySingleton(as: CartLocalDataSource)
class CartLocalDataSourceImpl implements CartLocalDataSource {
  final LocalStorageService _localStorageService;
  static const int _currentDataVersion = 2; // Version 2: includes thumbnailUrl in ProductEntity
  static const String _versionKey = 'cart_data_version';

  CartLocalDataSourceImpl(this._localStorageService) {
    _clearIfNeeded();
  }

  /// Clear cart data if it's from an older, incompatible version
  Future<void> _clearIfNeeded() async {
    try {
      final version = _localStorageService.getInt(_versionKey) ?? 0;
      if (version < _currentDataVersion) {
        await _localStorageService.remove(AppConstants.keyCartData);
        await _localStorageService.saveInt(_versionKey, _currentDataVersion);
      }
    } catch (e) {
      // If anything goes wrong, clear cart data to be safe
      await _localStorageService.remove(AppConstants.keyCartData);
      await _localStorageService.saveInt(_versionKey, _currentDataVersion);
    }
  }

  @override
  Future<List<CartItemModel>> getCartItems() async {
    final cartData = _localStorageService.getString(AppConstants.keyCartData);
    
    if (cartData == null || cartData.isEmpty) {
      return [];
    }

    final List<dynamic> jsonList = jsonDecode(cartData);
    return jsonList.map((json) => CartItemModel.fromJson(json)).toList();
  }

  @override
  Future<void> saveCartItems(List<CartItemModel> items) async {
    final jsonList = items.map((item) => item.toJson()).toList();
    final cartData = jsonEncode(jsonList);
    await _localStorageService.saveString(AppConstants.keyCartData, cartData);
  }

  @override
  Future<void> addCartItem(CartItemModel item) async {
    final items = await getCartItems();
    
    // Check if item with same product and customizations already exists
    final existingIndex = items.indexWhere((i) => 
      i.product.id == item.product.id &&
      _areCustomizationsSame(i, item)
    );

    if (existingIndex != -1) {
      // Update quantity of existing item
      final existingItem = items[existingIndex];
      items[existingIndex] = CartItemModel.fromEntity(
        existingItem.copyWith(quantity: existingItem.quantity + item.quantity),
      );
    } else {
      // Add new item
      items.add(item);
    }

    await saveCartItems(items);
  }

  @override
  Future<void> updateCartItem(String itemId, int quantity) async {
    final items = await getCartItems();
    final index = items.indexWhere((item) => item.id == itemId);

    if (index != -1) {
      if (quantity <= 0) {
        items.removeAt(index);
      } else {
        items[index] = CartItemModel.fromEntity(
          items[index].copyWith(quantity: quantity),
        );
      }
      await saveCartItems(items);
    }
  }

  @override
  Future<void> removeCartItem(String itemId) async {
    final items = await getCartItems();
    items.removeWhere((item) => item.id == itemId);
    await saveCartItems(items);
  }

  @override
  Future<void> clearCart() async {
    await _localStorageService.remove(AppConstants.keyCartData);
  }

  // Helper method to check if customizations are the same
  bool _areCustomizationsSame(CartItemModel item1, CartItemModel item2) {
    // Check if selected toppings are the same
    if (item1.selectedToppings.length != item2.selectedToppings.length) {
      return false;
    }
    
    final topping1Ids = item1.selectedToppings.map((t) => t.id).toSet();
    final topping2Ids = item2.selectedToppings.map((t) => t.id).toSet();
    
    if (!topping1Ids.containsAll(topping2Ids)) {
      return false;
    }

    // Check if selected side options are the same
    if (item1.selectedSideOptions.length != item2.selectedSideOptions.length) {
      return false;
    }
    
    final side1Ids = item1.selectedSideOptions.map((s) => s.id).toSet();
    final side2Ids = item2.selectedSideOptions.map((s) => s.id).toSet();
    
    if (!side1Ids.containsAll(side2Ids)) {
      return false;
    }

    // Check spicy level
    return item1.spicyLevel == item2.spicyLevel;
  }
}
