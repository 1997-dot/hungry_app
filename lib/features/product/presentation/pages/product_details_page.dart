import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/configs/app_colors.dart';
import '../../../../core/configs/app_fonts.dart';
import '../../../../core/di/injector.dart';
import '../../../../core/widgets/app_snackbar.dart';
import '../blocs/product_bloc.dart';
import '../blocs/product_event.dart';
import '../blocs/product_state.dart';
import '../widgets/side_option_widget.dart';
import '../widgets/topping_option_widget.dart';

class ProductDetailsPage extends StatelessWidget {
  final String productId;

  const ProductDetailsPage({
    super.key,
    required this.productId,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<ProductBloc>()
        ..add(LoadProductDetailsEvent(productId)),
      child: BlocListener<ProductBloc, ProductState>(
        listener: (context, state) {
          if (state is ProductAddedToCart) {
            AppSnackbar.success(
              context: context,
              message: 'Added to cart!',
            );
            Navigator.pop(context);
          } else if (state is ProductError) {
            AppSnackbar.error(
              context: context,
              message: state.message,
            );
          }
        },
        child: const _ProductDetailsView(),
      ),
    );
  }
}

class _ProductDetailsView extends StatelessWidget {
  const _ProductDetailsView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.textDark),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'product details',
          style: AppTextStyles.h5.copyWith(color: AppColors.textDark),
        ),
      ),
      body: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          if (state is ProductLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is ProductError) {
            return Center(
              child: Text(
                state.message,
                style: AppTextStyles.bodyMedium.copyWith(color: AppColors.error),
              ),
            );
          }

          if (state is ProductLoaded) {
            final product = state.product;

            return Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Product image and customization text
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Product image on the left
                            SizedBox(
                              width: 150,
                              height: 150,
                              child: product.imageUrl.startsWith('assets/')
                                  ? Image.asset(
                                      product.imageUrl,
                                      fit: BoxFit.contain,
                                      errorBuilder: (context, error, stackTrace) {
                                        return Icon(
                                          Icons.fastfood,
                                          size: 80,
                                          color: AppColors.primary,
                                        );
                                      },
                                    )
                                  : Image.network(
                                      product.imageUrl,
                                      fit: BoxFit.contain,
                                      errorBuilder: (context, error, stackTrace) {
                                        return Icon(
                                          Icons.fastfood,
                                          size: 80,
                                          color: AppColors.primary,
                                        );
                                      },
                                    ),
                            ),
                            const SizedBox(width: 16),
                            // Customization text on the right
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    product.name,
                                    style: AppTextStyles.h5.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.textDark,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    product.description,
                                    style: AppTextStyles.bodySmall.copyWith(
                                      color: AppColors.textSecondary,
                                    ),
                                  ),
                                  const SizedBox(height: 12),
                                  Text(
                                    'Customize your sandwich as you like',
                                    style: AppTextStyles.bodyMedium.copyWith(
                                      color: AppColors.primary,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 24),

                        Text(
                          'Spicy',
                          style: AppTextStyles.bodyLarge.copyWith(
                            fontWeight: FontWeight.bold,
                            color: AppColors.textDark,
                          ),
                        ),
                        Slider(
                          value: state.currentSpicyLevel,
                          onChanged: (value) {
                            context.read<ProductBloc>().add(
                                  UpdateSpicyLevelEvent(value),
                                );
                          },
                          activeColor: AppColors.primary,
                          inactiveColor: AppColors.border,
                        ),
                        const SizedBox(height: 24),

                        if (product.availableToppings.isNotEmpty) ...[
                          Text(
                            'Toppings',
                            style: AppTextStyles.bodyLarge.copyWith(
                              fontWeight: FontWeight.bold,
                              color: AppColors.textDark,
                            ),
                          ),
                          const SizedBox(height: 12),
                          GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 4,
                              crossAxisSpacing: 12,
                              mainAxisSpacing: 12,
                              childAspectRatio: 0.85,
                            ),
                            itemCount: product.availableToppings.length,
                            itemBuilder: (context, index) {
                              final topping = product.availableToppings[index];
                              return ToppingOptionWidget(
                                topping: topping,
                                onTap: () {
                                  context.read<ProductBloc>().add(
                                        ToggleToppingEvent(topping.id),
                                      );
                                },
                              );
                            },
                          ),
                          const SizedBox(height: 24),
                        ],

                        if (product.availableSideOptions.isNotEmpty) ...[
                          Text(
                            'Side options',
                            style: AppTextStyles.bodyLarge.copyWith(
                              fontWeight: FontWeight.bold,
                              color: AppColors.textDark,
                            ),
                          ),
                          const SizedBox(height: 12),
                          GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 4,
                              crossAxisSpacing: 12,
                              mainAxisSpacing: 12,
                              childAspectRatio: 0.85,
                            ),
                            itemCount: product.availableSideOptions.length,
                            itemBuilder: (context, index) {
                              final sideOption = product.availableSideOptions[index];
                              return SideOptionWidget(
                                sideOption: sideOption,
                                onTap: () {
                                  context.read<ProductBloc>().add(
                                        ToggleSideOptionEvent(sideOption.id),
                                      );
                                },
                              );
                            },
                          ),
                        ],
                        const SizedBox(height: 100),
                      ],
                    ),
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
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Total',
                            style: AppTextStyles.bodySmall.copyWith(
                              color: AppColors.textSecondary,
                            ),
                          ),
                          Text(
                            '\$${product.totalPrice.toStringAsFixed(2)}',
                            style: AppTextStyles.h5.copyWith(
                              fontWeight: FontWeight.bold,
                              color: AppColors.textDark,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 24),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            context.read<ProductBloc>().add(
                                  const AddProductToCartEvent(),
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
                            'Add To Cart',
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
