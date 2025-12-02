import 'package:equatable/equatable.dart';

/// Payment method types
enum PaymentMethodType {
  cashOnDelivery,
  creditCard,
}

/// Payment method entity
class PaymentMethodEntity extends Equatable {
  final PaymentMethodType type;
  final String? cardNumber;
  final String? cardHolderName;
  final String? expiryDate;
  final String? cvv;
  final bool saveCard;

  const PaymentMethodEntity({
    required this.type,
    this.cardNumber,
    this.cardHolderName,
    this.expiryDate,
    this.cvv,
    this.saveCard = false,
  });

  /// Check if payment method is cash on delivery
  bool get isCashOnDelivery => type == PaymentMethodType.cashOnDelivery;

  /// Check if payment method is credit card
  bool get isCreditCard => type == PaymentMethodType.creditCard;

  PaymentMethodEntity copyWith({
    PaymentMethodType? type,
    String? cardNumber,
    String? cardHolderName,
    String? expiryDate,
    String? cvv,
    bool? saveCard,
  }) {
    return PaymentMethodEntity(
      type: type ?? this.type,
      cardNumber: cardNumber ?? this.cardNumber,
      cardHolderName: cardHolderName ?? this.cardHolderName,
      expiryDate: expiryDate ?? this.expiryDate,
      cvv: cvv ?? this.cvv,
      saveCard: saveCard ?? this.saveCard,
    );
  }

  @override
  List<Object?> get props => [
        type,
        cardNumber,
        cardHolderName,
        expiryDate,
        cvv,
        saveCard,
      ];
}
