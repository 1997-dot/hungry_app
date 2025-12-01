import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entities/product_entity.dart';
import '../../domain/usecases/get_product_details_usecase.dart';
import 'product_event.dart';
import 'product_state.dart';

@injectable
class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final GetProductDetailsUseCase _getProductDetailsUseCase;

  ProductBloc(this._getProductDetailsUseCase) : super(const ProductInitial()) {
    on<LoadProductDetailsEvent>(_onLoadProductDetails);
    on<ToggleToppingEvent>(_onToggleTopping);
    on<ToggleSideOptionEvent>(_onToggleSideOption);
    on<UpdateSpicyLevelEvent>(_onUpdateSpicyLevel);
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
}
