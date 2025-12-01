import 'package:flutter/material.dart';

import '../../../../core/configs/app_colors.dart';
import '../../../../core/configs/app_fonts.dart';
import '../../domain/entities/side_option_entity.dart';

class SideOptionWidget extends StatelessWidget {
  final SideOptionEntity sideOption;
  final VoidCallback onTap;

  const SideOptionWidget({
    super.key,
    required this.sideOption,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: sideOption.isSelected
              ? AppColors.primary.withValues(alpha: 0.2)
              : AppColors.background,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: sideOption.isSelected ? AppColors.primary : AppColors.border,
            width: 2,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Side option image
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: AppColors.primary.withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: ClipOval(
                child: sideOption.imageUrl.startsWith('assets/')
                    ? Image.asset(
                        sideOption.imageUrl,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Icon(
                            Icons.fastfood,
                            color: AppColors.primary,
                            size: 24,
                          );
                        },
                      )
                    : Image.network(
                        sideOption.imageUrl,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Icon(
                            Icons.fastfood,
                            color: AppColors.primary,
                            size: 24,
                          );
                        },
                      ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              sideOption.name,
              style: AppTextStyles.bodySmall.copyWith(
                fontWeight: FontWeight.w600,
                color: AppColors.textDark,
              ),
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            if (sideOption.price > 0) ...[
              const SizedBox(height: 2),
              Text(
                '+\$${sideOption.price.toStringAsFixed(2)}',
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
