import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/configs/app_colors.dart';
import '../../../../core/configs/app_fonts.dart';
import '../../../../core/di/injector.dart';
import '../blocs/cart_bloc.dart';
import '../blocs/cart_event.dart';
import '../blocs/cart_state.dart';
import '../widgets/cart_item_card.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<CartBloc>()..add(const LoadCartEvent()),
      child: const _CartView(),
    );
  }
}

class _CartView extends StatelessWidget {
  const _CartView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundGrey,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.textDark),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'cart',
          style: AppTextStyles.h5.copyWith(color: AppColors.textDark),
        ),
      ),
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state is CartLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is CartError) {
            return Center(
              child: Text(
                state.message,
                style: AppTextStyles.bodyMedium.copyWith(color: AppColors.error),
              ),
            );
          }

          if (state is CartLoaded || state is CartItemAdded) {
            final items = state is CartLoaded
                ? state.items
                : (state as CartItemAdded).items;
            final total =
                state is CartLoaded ? state.total : (state as CartItemAdded).total;

            if (items.isEmpty) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.shopping_cart_outlined,
                      size: 100,
                      color: AppColors.textSecondary,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Your cart is empty',
                      style: AppTextStyles.h5.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              );
            }

            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      final item = items[index];
                      return CartItemCard(
                        item: item,
                        onIncrement: () {
                          context.read<CartBloc>().add(
                                UpdateCartItemEvent(
                                  item.id,
                                  item.quantity + 1,
                                ),
                              );
                        },
                        onDecrement: () {
                          if (item.quantity > 1) {
                            context.read<CartBloc>().add(
                                  UpdateCartItemEvent(
                                    item.id,
                                    item.quantity - 1,
                                  ),
                                );
                          }
                        },
                        onRemove: () {
                          context.read<CartBloc>().add(
                                RemoveFromCartEvent(item.id),
                              );
                        },
                      );
                    },
                  ),
                ),

                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppColors.background,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.1),
                        blurRadius: 10,
                        offset: const Offset(0, -2),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total',
                            style: AppTextStyles.h6.copyWith(
                              color: AppColors.textDark,
                            ),
                          ),
                          Text(
                            '\$${total.toStringAsFixed(2)}',
                            style: AppTextStyles.h5.copyWith(
                              fontWeight: FontWeight.bold,
                              color: AppColors.primary,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Checkout feature coming soon!'),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primary,
                            foregroundColor: AppColors.textLight,
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: Text(
                            'Checkout',
                            style: AppTextStyles.bodyLarge.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}
