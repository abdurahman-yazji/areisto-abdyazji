import 'package:flutter/material.dart';
import 'category_chip.dart';

class CategoryChips extends StatelessWidget {
  final String selected;
  final ValueChanged<String> onSelect; 

  const CategoryChips({
    super.key,
    required this.selected,
    required this.onSelect,
  });

  static const List<String> categories = [
    'All',
    'Coffee',
    'Cold',
    'Non-Coffee',
    'Pastries',
    'fizzy',
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      child: Row(
        children: List.generate(categories.length, (index) {
          final cat = categories[index];
          return Padding(
            padding: EdgeInsets.only(
              right: index == categories.length - 1 ? 0 : 10,
            ),
            child: GestureDetector(
              onTap: () => onSelect(cat), 
              child: CategoryChip(
                label: cat,
                isSelected: cat == selected, 
              ),
            ),
          );
        }),
      ),
    );
  }
}