import 'package:flutter/material.dart';
import '../models/drink.dart';
import '../theme.dart';
class DrinkCard extends StatelessWidget {
  final Drink drink;

  const DrinkCard({
    super.key,
    required this.drink,
  });

@override
Widget build(BuildContext context) {
  final textTheme = Theme.of(context).textTheme;

  return Container(
    padding: const EdgeInsets.all(12),
    decoration: BoxDecoration(
      color: AppTheme.surfaceCard,
      borderRadius: BorderRadius.circular(16),
      boxShadow: [
        BoxShadow(
          color: AppTheme.cardShadow,
          blurRadius: 12,
          offset: const Offset(0, 4),
        ),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 100,
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppTheme.chipUnselected,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(
            drink.icon,
            size: 36,
            color: AppTheme.primaryBrand,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          drink.name,
          style: textTheme.titleMedium,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        Text(
          drink.subtitle,
          style: textTheme.bodySmall,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        const Spacer(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(drink.price, style: textTheme.bodyLarge),
            Container(
              width: 28,
              height: 28,
              decoration: BoxDecoration(
                color: AppTheme.primaryBrand,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(
                Icons.add,
                color: AppTheme.onBrand,
                size: 20,
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
}