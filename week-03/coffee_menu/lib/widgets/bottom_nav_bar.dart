import 'package:flutter/material.dart';
import '../theme.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 68,
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
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Icon(Icons.home_rounded, color: AppTheme.primaryBrand, size: 26),
          Icon(
            Icons.favorite_border_rounded,
            color: AppTheme.textSecondary,
            size: 24,
          ),
          Icon(
            Icons.shopping_bag_outlined,
            color: AppTheme.textSecondary,
            size: 24,
          ),
          Icon(
            Icons.person_outline_rounded,
            color: AppTheme.textSecondary,
            size: 24,
          ),
        ],
      ),
    );
  }
}
