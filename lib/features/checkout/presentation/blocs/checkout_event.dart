import 'package:equatable/equatable.dart';

import '../../domain/entities/payment_method_entity.dart';

/// Base class for checkout events
abstract class CheckoutEvent extends Equatable {
  const CheckoutEvent();

  @override
  List<Object?> get props => [];
}

/// Event to load order summary
class LoadOrderSummaryEvent extends CheckoutEvent {
  const LoadOrderSummaryEvent();
}

/// Event to select payment method
class SelectPaymentMethodEvent extends CheckoutEvent {
  final PaymentMethodType paymentMethodType;

  const SelectPaymentMethodEvent(this.paymentMethodType);

  @override
  List<Object?> get props => [paymentMethodType];
}

/// Event to update credit card information
class UpdateCreditCardEvent extends CheckoutEvent {
  final String? cardNumber;
  final String? cardHolderName;
  final String? expiryDate;
  final String? cvv;

  const UpdateCreditCardEvent({
    this.cardNumber,
    this.cardHolderName,
    this.expiryDate,
    this.cvv,
  });

  @override
  List<Object?> get props => [cardNumber, cardHolderName, expiryDate, cvv];
}

/// Event to toggle save card option
class ToggleSaveCardEvent extends CheckoutEvent {
  final bool saveCard;

  const ToggleSaveCardEvent(this.saveCard);

  @override
  List<Object?> get props => [saveCard];
}

/// Event to process payment
class ProcessPaymentEvent extends CheckoutEvent {
  const ProcessPaymentEvent();
}
