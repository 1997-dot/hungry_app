import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../cart/domain/entities/cart_item_entity.dart';
import '../../../cart/domain/usecases/add_to_cart_usecase.dart';
import '../../domain/entities/product_entity.dart';
import '../../domain/usecases/get_product_details_usecase.dart';
import 'product_event.dart';
import 'product_state.dart';

@injectable
class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final GetProductDetailsUseCase _getProductDetailsUseCase;
  final AddToCartUseCase _addToCartUseCase;

  ProductBloc(
    this._getProductDetailsUseCase,
    this._addToCartUseCase,
  ) : super(const ProductInitial()) {
    on<LoadProductDetailsEvent>(_onLoadProductDetails);
    on<ToggleToppingEvent>(_onToggleTopping);
    on<ToggleSideOptionEvent>(_onToggleSideOption);
    on<UpdateSpicyLevelEvent>(_onUpdateSpicyLevel);
    on<AddProductToCartEvent>(_onAddToCart);
  }

  Future<void> _onLoadProductDetails(
    LoadProductDetailsEvent event,
    Emitter<ProductState> emit,
  ) async {
    emit(const ProductLoading());

    final result = await _getProductDetailsUseCase(event.productId);

    result.fold(
      (failure) => emit(ProductError(failure.message)),
      (product) => emit(ProductLoaded(product)),
    );
  }

  void _onToggleTopping(
    ToggleToppingEvent event,
    Emitter<ProductState> emit,
  ) {
    if (state is ProductLoaded) {
      final currentState = state as ProductLoaded;
      final product = currentState.product;

      // Toggle the topping
      final updatedToppings = product.availableToppings.map((topping) {
        if (topping.id == event.toppingId) {
          return topping.copyWith(isSelected: !topping.isSelected);
        }
        return topping;
      }).toList();

      final updatedProduct = product.copyWith(
        availableToppings: updatedToppings,
      );

      emit(currentState.copyWith(product: updatedProduct));
    }
  }

  void _onToggleSideOption(
    ToggleSideOptionEvent event,
    Emitter<ProductState> emit,
  ) {
    if (state is ProductLoaded) {
      final currentState = state as ProductLoaded;
      final product = currentState.product;

      // Toggle the side option
      final updatedSideOptions = product.availableSideOptions.map((side) {
        if (side.id == event.sideOptionId) {
          return side.copyWith(isSelected: !side.isSelected);
        }
        return side;
      }).toList();

      final updatedProduct = product.copyWith(
        availableSideOptions: updatedSideOptions,
      );

      emit(currentState.copyWith(product: updatedProduct));
    }
  }

  void _onUpdateSpicyLevel(
    UpdateSpicyLevelEvent event,
    Emitter<ProductState> emit,
  ) {
    if (state is ProductLoaded) {
      final currentState = state as ProductLoaded;
      emit(currentState.copyWith(currentSpicyLevel: event.spicyLevel));
    }
  }

  Future<void> _onAddToCart(
    AddProductToCartEvent event,
    Emitter<ProductState> emit,
  ) async {
    if (state is ProductLoaded) {
      final currentState = state as ProductLoaded;
      final product = currentState.product;

      // Create cart item from current product state
      final cartItem = CartItemEntity(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        product: product,
        quantity: 1,
        selectedToppings: product.availableToppings
            .where((t) => t.isSelected)
            .toList(),
        selectedSideOptions: product.availableSideOptions
            .where((s) => s.isSelected)
            .toList(),
        spicyLevel: currentState.currentSpicyLevel,
        addedAt: DateTime.now(),
      );

      // Call add to cart use case
      final result = await _addToCartUseCase(cartItem);

      result.fold(
        (failure) => emit(ProductError(failure.message)),
        (_) => emit(const ProductAddedToCart()),
      );
    }
  }
}
