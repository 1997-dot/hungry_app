import 'package:flutter/material.dart';

import '../../../../core/configs/app_colors.dart';
import '../../../../core/configs/app_fonts.dart';

class QuantityControlWidget extends StatelessWidget {
  final int quantity;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  const QuantityControlWidget({
    super.key,
    required this.quantity,
    required this.onIncrement,
    required this.onDecrement,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Decrement button
        GestureDetector(
          onTap: onDecrement,
          child: Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: AppColors.primary,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.remove,
              color: AppColors.textLight,
              size: 18,
            ),
          ),
        ),
        const SizedBox(width: 12),
        // Quantity display
        Text(
          quantity.toString(),
          style: AppTextStyles.bodyLarge.copyWith(
            fontWeight: FontWeight.bold,
            color: AppColors.textDark,
          ),
        ),
        const SizedBox(width: 12),
        // Increment button
        GestureDetector(
          onTap: onIncrement,
          child: Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: AppColors.primary,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.add,
              color: AppColors.textLight,
              size: 18,
            ),
          ),
        ),
      ],
    );
  }
}
