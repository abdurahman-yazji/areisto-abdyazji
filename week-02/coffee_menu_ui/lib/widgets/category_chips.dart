import 'package:flutter/material.dart';
import '../theme.dart';


class CategoryChips extends StatelessWidget {
  const CategoryChips({super.key});
    
    static const List<String> categories = [
      'All',
       'Espresso', 
       'Latte', 
       'Cappuccino',
        'Cold Brew',
        'Mojito',
        'Iced Tea' 
        ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      child: Row(
        children:List.generate(categories.length,(index) {
          final isSelected = index == 0;
          return Padding (
            padding: EdgeInsets.only(right: index == categories.length - 1 ? 0 : 10),
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                 vertical: 8),
              decoration: BoxDecoration(
                color: isSelected 
                ? AppTheme.primaryBrand : AppTheme.chipUnselected,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                categories[index],
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: isSelected
                   ? AppTheme.surfaceCard : AppTheme.textPrimary,
                ),
              ),
            ),
          );
        })
      ),
    );
  }
}