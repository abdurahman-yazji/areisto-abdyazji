import 'package:flutter/material.dart';
import '../theme.dart';

class BottomBar extends StatelessWidget {
  final int itemCount;
  final double total;

  const BottomBar({
    super.key,
    required this.itemCount,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
        decoration: BoxDecoration(
          color: AppTheme.surfaceCard,
          boxShadow: [
            BoxShadow(
              color: AppTheme.cardShadow,
              blurRadius: 12,
              offset: const Offset(0, -4),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Icon(Icons.home_rounded, color: AppTheme.primaryBrand, size: 26),
            const Icon(Icons.favorite_border_rounded, color: AppTheme.textSecondary, size: 24),

            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.shopping_bag_outlined, color: AppTheme.textSecondary, size: 24),
                const SizedBox(height: 2),
                Text(
                  itemCount == 0
                      ? 'No items yet'
                      : '$itemCount items · \$${total.toStringAsFixed(2)}',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: itemCount == 0
                        ? AppTheme.textSecondary
                        : AppTheme.primaryBrand,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),

            const Icon(Icons.person_outline_rounded, color: AppTheme.textSecondary, size: 24),
          ],
        ),
      ),
    );
  }
}