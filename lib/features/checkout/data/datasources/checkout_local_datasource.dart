import 'package:injectable/injectable.dart';

import '../../../../core/services/local_storage_service.dart';
import '../models/payment_method_model.dart';

/// Local data source for checkout feature
abstract class CheckoutLocalDataSource {
  /// Get saved payment methods
  Future<List<PaymentMethodModel>> getSavedPaymentMethods();

  /// Save payment method
  Future<void> savePaymentMethod(PaymentMethodModel paymentMethod);
}

@Injectable(as: CheckoutLocalDataSource)
class CheckoutLocalDataSourceImpl implements CheckoutLocalDataSource {
  final LocalStorageService _localStorageService;

  CheckoutLocalDataSourceImpl(this._localStorageService);

  static const String _savedCardsKey = 'saved_payment_methods';

  @override
  Future<List<PaymentMethodModel>> getSavedPaymentMethods() async {
    try {
      final data = _localStorageService.getString(_savedCardsKey);
      if (data == null) return [];

      // TODO: Implement proper JSON deserialization when needed
      return [];
    } catch (e) {
      throw Exception('Failed to load saved payment methods');
    }
  }

  @override
  Future<void> savePaymentMethod(PaymentMethodModel paymentMethod) async {
    try {
      // TODO: Implement proper JSON serialization when needed
      // For now, we won't persist credit card info for security reasons
      return;
    } catch (e) {
      throw Exception('Failed to save payment method');
    }
  }
}
