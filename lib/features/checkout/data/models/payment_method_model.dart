import '../../domain/entities/payment_method_entity.dart';

/// Payment method model for data layer
class PaymentMethodModel extends PaymentMethodEntity {
  const PaymentMethodModel({
    required super.type,
    super.cardNumber,
    super.cardHolderName,
    super.expiryDate,
    super.cvv,
    super.saveCard = false,
  });

  factory PaymentMethodModel.fromJson(Map<String, dynamic> json) {
    return PaymentMethodModel(
      type: PaymentMethodType.values.firstWhere(
        (e) => e.toString() == 'PaymentMethodType.${json['type']}',
        orElse: () => PaymentMethodType.cashOnDelivery,
      ),
      cardNumber: json['card_number'] as String?,
      cardHolderName: json['card_holder_name'] as String?,
      expiryDate: json['expiry_date'] as String?,
      cvv: json['cvv'] as String?,
      saveCard: json['save_card'] as bool? ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'type': type.toString().split('.').last,
      'card_number': cardNumber,
      'card_holder_name': cardHolderName,
      'expiry_date': expiryDate,
      'cvv': cvv,
      'save_card': saveCard,
    };
  }

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
