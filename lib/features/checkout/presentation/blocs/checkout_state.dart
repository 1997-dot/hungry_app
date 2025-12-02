import 'package:equatable/equatable.dart';

import '../../domain/entities/order_entity.dart';
import '../../domain/entities/order_summary_entity.dart';
import '../../domain/entities/payment_method_entity.dart';

/// Base class for checkout states
abstract class CheckoutState extends Equatable {
  const CheckoutState();

  @override
  List<Object?> get props => [];
}

/// Initial state
class CheckoutInitial extends CheckoutState {
  const CheckoutInitial();
}

/// Loading state
class CheckoutLoading extends CheckoutState {
  const CheckoutLoading();
}

/// Order summary loaded state
class CheckoutLoaded extends CheckoutState {
  final OrderSummaryEntity orderSummary;
  final PaymentMethodType selectedPaymentMethod;
  final String? cardNumber;
  final String? cardHolderName;
  final String? expiryDate;
  final String? cvv;
  final bool saveCard;

  const CheckoutLoaded({
    required this.orderSummary,
    this.selectedPaymentMethod = PaymentMethodType.cashOnDelivery,
    this.cardNumber,
    this.cardHolderName,
    this.expiryDate,
    this.cvv,
    this.saveCard = false,
  });

  CheckoutLoaded copyWith({
    OrderSummaryEntity? orderSummary,
    PaymentMethodType? selectedPaymentMethod,
    String? cardNumber,
    String? cardHolderName,
    String? expiryDate,
    String? cvv,
    bool? saveCard,
  }) {
    return CheckoutLoaded(
      orderSummary: orderSummary ?? this.orderSummary,
      selectedPaymentMethod: selectedPaymentMethod ?? this.selectedPaymentMethod,
      cardNumber: cardNumber ?? this.cardNumber,
      cardHolderName: cardHolderName ?? this.cardHolderName,
      expiryDate: expiryDate ?? this.expiryDate,
      cvv: cvv ?? this.cvv,
      saveCard: saveCard ?? this.saveCard,
    );
  }

  @override
  List<Object?> get props => [
        orderSummary,
        selectedPaymentMethod,
        cardNumber,
        cardHolderName,
        expiryDate,
        cvv,
        saveCard,
      ];
}

/// Processing payment state
class CheckoutProcessing extends CheckoutState {
  const CheckoutProcessing();
}

/// Payment successful state
class CheckoutSuccess extends CheckoutState {
  final OrderEntity order;

  const CheckoutSuccess(this.order);

  @override
  List<Object?> get props => [order];
}

/// Error state
class CheckoutError extends CheckoutState {
  final String message;

  const CheckoutError(this.message);

  @override
  List<Object?> get props => [message];
}
