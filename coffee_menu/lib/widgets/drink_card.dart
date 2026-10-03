import 'package:flutter/material.dart';
import '../models/drink.dart';
import '../theme.dart';
class DrinkCard extends StatelessWidget {
  final Drink drink;
  final VoidCallback onAdd;  
  final int count;           

  const DrinkCard({
    super.key,
    required this.drink,
    required this.onAdd,
    this.count = 0,
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
          Stack( 
            children: [
              Container(
                height: 100,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: drink.isSoldOut
                      ? AppTheme.soldOutBackground
                      : AppTheme.chipUnselected,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  drink.icon,
                  size: 36,
                  color: drink.isSoldOut
                      ? AppTheme.soldOutIcon
                      : AppTheme.primaryBrand,
                ),
              ),
              
              if (count > 0)
                Positioned(
                  top: 6,
                  right: 6,
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    decoration: const BoxDecoration(
                      color: AppTheme.primaryBrand,
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      '$count',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 11,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
            ],
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
              Text('\$${drink.price}', style: textTheme.bodyLarge),
              GestureDetector(
                onTap: drink.isSoldOut ? null : onAdd, 
                child: Container(
                  width: 28,
                  height: 28,
                  decoration: BoxDecoration(
                    color: drink.isSoldOut
                        ? AppTheme.soldOutIcon  
                        : AppTheme.primaryBrand,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(
                    Icons.add,
                    color: AppTheme.onBrand,
                    size: 20,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}