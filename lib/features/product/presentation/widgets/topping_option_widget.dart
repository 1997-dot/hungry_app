import 'package:flutter/material.dart';

import '../../../../core/configs/app_colors.dart';
import '../../../../core/configs/app_fonts.dart';
import '../../domain/entities/topping_entity.dart';

class ToppingOptionWidget extends StatelessWidget {
  final ToppingEntity topping;
  final VoidCallback onTap;

  const ToppingOptionWidget({
    super.key,
    required this.topping,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: topping.isSelected
              ? AppColors.primary.withValues(alpha: 0.2)
              : AppColors.background,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: topping.isSelected ? AppColors.primary : AppColors.border,
            width: 2,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Placeholder for topping image
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: AppColors.primary.withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.restaurant,
                color: AppColors.primary,
                size: 24,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              topping.name,
              style: AppTextStyles.bodySmall.copyWith(
                fontWeight: FontWeight.w600,
                color: AppColors.textDark,
              ),
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            if (topping.price > 0) ...[
              const SizedBox(height: 2),
              Text(
                '+\$${topping.price.toStringAsFixed(2)}',
                style: AppTextStyles.caption.copyWith(
                  color: AppColors.primary,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
