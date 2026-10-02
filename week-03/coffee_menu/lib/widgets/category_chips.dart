import 'package:flutter/material.dart';
import 'category_chip.dart';

class CategoryChips extends StatelessWidget {
  const CategoryChips({super.key});

  static const List<String> categories = [
    'All',
    'Coffee',
    'Cold',
    'Tea',
    'Pastries'
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      child: Row(
        children: List.generate(categories.length, (index) {
          return Padding(
            padding: EdgeInsets.only(
              right: index == categories.length - 1 ? 0 : 10,
            ),
            child: CategoryChip(
              label: categories[index],
              isSelected: index == 0,
            ),
          );
        }),
      ),
    );
  }
}