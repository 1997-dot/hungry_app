import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entities/payment_method_entity.dart';
import '../../domain/usecases/create_order_summary_usecase.dart';
import '../../domain/usecases/process_payment_usecase.dart';
import 'checkout_event.dart';
import 'checkout_state.dart';

@injectable
class CheckoutBloc extends Bloc<CheckoutEvent, CheckoutState> {
  final CreateOrderSummaryUseCase _createOrderSummaryUseCase;
  final ProcessPaymentUseCase _processPaymentUseCase;

  CheckoutBloc({
    required CreateOrderSummaryUseCase createOrderSummaryUseCase,
    required ProcessPaymentUseCase processPaymentUseCase,
  })  : _createOrderSummaryUseCase = createOrderSummaryUseCase,
        _processPaymentUseCase = processPaymentUseCase,
        super(const CheckoutInitial()) {
    on<LoadOrderSummaryEvent>(_onLoadOrderSummary);
    on<SelectPaymentMethodEvent>(_onSelectPaymentMethod);
    on<UpdateCreditCardEvent>(_onUpdateCreditCard);
    on<ToggleSaveCardEvent>(_onToggleSaveCard);
    on<ProcessPaymentEvent>(_onProcessPayment);
  }

  Future<void> _onLoadOrderSummary(
    LoadOrderSummaryEvent event,
    Emitter<CheckoutState> emit,
  ) async {
    emit(const CheckoutLoading());

    final result = await _createOrderSummaryUseCase();

    result.fold(
      (failure) => emit(CheckoutError(failure.message)),
      (orderSummary) => emit(CheckoutLoaded(orderSummary: orderSummary)),
    );
  }

  void _onSelectPaymentMethod(
    SelectPaymentMethodEvent event,
    Emitter<CheckoutState> emit,
  ) {
    if (state is CheckoutLoaded) {
      final currentState = state as CheckoutLoaded;
      emit(currentState.copyWith(
        selectedPaymentMethod: event.paymentMethodType,
        cardNumber: event.paymentMethodType == PaymentMethodType.cashOnDelivery
            ? null
            : currentState.cardNumber,
        cardHolderName:
            event.paymentMethodType == PaymentMethodType.cashOnDelivery
                ? null
                : currentState.cardHolderName,
        expiryDate: event.paymentMethodType == PaymentMethodType.cashOnDelivery
            ? null
            : currentState.expiryDate,
        cvv: event.paymentMethodType == PaymentMethodType.cashOnDelivery
            ? null
            : currentState.cvv,
      ));
    }
  }

  void _onUpdateCreditCard(
    UpdateCreditCardEvent event,
    Emitter<CheckoutState> emit,
  ) {
    if (state is CheckoutLoaded) {
      final currentState = state as CheckoutLoaded;
      emit(currentState.copyWith(
        cardNumber: event.cardNumber ?? currentState.cardNumber,
        cardHolderName: event.cardHolderName ?? currentState.cardHolderName,
        expiryDate: event.expiryDate ?? currentState.expiryDate,
        cvv: event.cvv ?? currentState.cvv,
      ));
    }
  }

  void _onToggleSaveCard(
    ToggleSaveCardEvent event,
    Emitter<CheckoutState> emit,
  ) {
    if (state is CheckoutLoaded) {
      final currentState = state as CheckoutLoaded;
      emit(currentState.copyWith(saveCard: event.saveCard));
    }
  }

  Future<void> _onProcessPayment(
    ProcessPaymentEvent event,
    Emitter<CheckoutState> emit,
  ) async {
    if (state is! CheckoutLoaded) return;

    final currentState = state as CheckoutLoaded;

    if (currentState.selectedPaymentMethod == PaymentMethodType.creditCard) {
      if (currentState.cardNumber == null ||
          currentState.cardNumber!.isEmpty ||
          currentState.cardHolderName == null ||
          currentState.cardHolderName!.isEmpty ||
          currentState.expiryDate == null ||
          currentState.expiryDate!.isEmpty ||
          currentState.cvv == null ||
          currentState.cvv!.isEmpty) {
        emit(const CheckoutError('Please fill in all credit card information'));
        emit(currentState);
        return;
      }
    }

    emit(const CheckoutProcessing());

    final paymentMethod = PaymentMethodEntity(
      type: currentState.selectedPaymentMethod,
      cardNumber: currentState.cardNumber,
      cardHolderName: currentState.cardHolderName,
      expiryDate: currentState.expiryDate,
      cvv: currentState.cvv,
      saveCard: currentState.saveCard,
    );

    final params = ProcessPaymentParams(
      orderSummary: currentState.orderSummary,
      paymentMethod: paymentMethod,
    );

    final result = await _processPaymentUseCase(params);

    result.fold(
      (failure) {
        emit(CheckoutError(failure.message));
        emit(currentState);
      },
      (order) => emit(CheckoutSuccess(order)),
    );
  }
}
