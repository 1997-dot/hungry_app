import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../domain/usecases/add_to_cart_usecase.dart';
import '../../domain/usecases/get_cart_items_usecase.dart';
import '../../domain/usecases/remove_from_cart_usecase.dart';
import '../../domain/usecases/update_cart_item_usecase.dart';
import 'cart_event.dart';
import 'cart_state.dart';

@injectable
class CartBloc extends Bloc<CartEvent, CartState> {
  final GetCartItemsUseCase _getCartItemsUseCase;
  final AddToCartUseCase _addToCartUseCase;
  final UpdateCartItemUseCase _updateCartItemUseCase;
  final RemoveFromCartUseCase _removeFromCartUseCase;

  CartBloc(
    this._getCartItemsUseCase,
    this._addToCartUseCase,
    this._updateCartItemUseCase,
    this._removeFromCartUseCase,
  ) : super(const CartInitial()) {
    on<LoadCartEvent>(_onLoadCart);
    on<AddToCartEvent>(_onAddToCart);
    on<UpdateCartItemEvent>(_onUpdateCartItem);
    on<RemoveFromCartEvent>(_onRemoveFromCart);
    on<ClearCartEvent>(_onClearCart);
  }

  Future<void> _onLoadCart(
    LoadCartEvent event,
    Emitter<CartState> emit,
  ) async {
    emit(const CartLoading());

    final result = await _getCartItemsUseCase();

    result.fold(
      (failure) => emit(CartError(failure.message)),
      (items) {
        final total = items.fold<double>(0.0, (sum, item) => sum + item.totalPrice);
        final itemCount = items.fold<int>(0, (sum, item) => sum + item.quantity);

        emit(CartLoaded(
          items: items,
          total: total,
          itemCount: itemCount,
        ));
      },
    );
  }

  Future<void> _onAddToCart(
    AddToCartEvent event,
    Emitter<CartState> emit,
  ) async {
    final result = await _addToCartUseCase(event.item);

    result.fold(
      (failure) => emit(CartError(failure.message)),
      (_) async {
        // Reload cart after adding
        final cartResult = await _getCartItemsUseCase();
        cartResult.fold(
          (failure) => emit(CartError(failure.message)),
          (items) {
            final total = items.fold<double>(0.0, (sum, item) => sum + item.totalPrice);
            final itemCount = items.fold<int>(0, (sum, item) => sum + item.quantity);

            emit(CartItemAdded(
              items: items,
              total: total,
              itemCount: itemCount,
            ));
          },
        );
      },
    );
  }

  Future<void> _onUpdateCartItem(
    UpdateCartItemEvent event,
    Emitter<CartState> emit,
  ) async {
    final result = await _updateCartItemUseCase(event.itemId, event.quantity);

    result.fold(
      (failure) => emit(CartError(failure.message)),
      (_) async {
        // Reload cart after updating
        add(const LoadCartEvent());
      },
    );
  }

  Future<void> _onRemoveFromCart(
    RemoveFromCartEvent event,
    Emitter<CartState> emit,
  ) async {
    final result = await _removeFromCartUseCase(event.itemId);

    result.fold(
      (failure) => emit(CartError(failure.message)),
      (_) async {
        // Reload cart after removing
        add(const LoadCartEvent());
      },
    );
  }

  Future<void> _onClearCart(
    ClearCartEvent event,
    Emitter<CartState> emit,
  ) async {
    // TODO: Implement clear cart use case
    emit(const CartLoaded(items: [], total: 0.0, itemCount: 0));
  }
}
