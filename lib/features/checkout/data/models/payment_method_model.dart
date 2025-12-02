import '../../domain/entities/payment_method_entity.dart';

/// Payment method model for data layer
/// Note: This model extends PaymentMethodEntity directly and doesn't need JSON serialization
/// For security reasons, we don't persist payment information
class PaymentMethodModel extends PaymentMethodEntity {
  const PaymentMethodModel({
    required super.type,
    super.cardNumber,
    super.cardHolderName,
    super.expiryDate,
    super.cvv,
    super.saveCard,
  });

  factory PaymentMethodModel.fromEntity(PaymentMethodEntity entity) {
    return PaymentMethodModel(
      type: entity.type,
      cardNumber: entity.cardNumber,
      cardHolderName: entity.cardHolderName,
      expiryDate: entity.expiryDate,
      cvv: entity.cvv,
      saveCard: entity.saveCard,
    );
  }
}
