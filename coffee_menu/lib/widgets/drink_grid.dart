import 'package:coffee_menu_ui/models/drink.dart';
import 'package:coffee_menu_ui/models/order.dart';
import 'package:coffee_menu_ui/theme.dart';
import 'package:flutter/material.dart';
import 'drink_card.dart';

class DrinkGrid extends StatelessWidget {
  final List<Drink> drinks;     
  final Order order;           
  final ValueChanged<Drink> onAdd; 

  const DrinkGrid({
    super.key,
    required this.drinks,
    required this.order,
    required this.onAdd,
  });

  @override
  Widget build(BuildContext context) {
  
    if (drinks.isEmpty) {
      return const Padding(
        padding: EdgeInsets.symmetric(vertical: 48),
        child: Center(
          child: Text(
            'No drinks in this category',
            style: TextStyle(color: AppTheme.textSecondary),
          ),
        ),
      );
    }

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 0.79,
      ),
      itemCount: drinks.length,
      itemBuilder: (context, index) {
        final drink = drinks[index];
        return DrinkCard(
          drink: drink,
          onAdd: () => onAdd(drink),
          count: order.countOf(drink), 
        );
      },
    );
  }
}