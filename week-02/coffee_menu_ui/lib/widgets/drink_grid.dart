import 'package:flutter/material.dart';
import 'drink_card.dart';

class DrinkGrid extends StatelessWidget {
  const DrinkGrid({super.key});

  static const List<Map<String, dynamic>> drinks = [
    {
      'name': 'Caffè Latte',
      'subtitle': 'Espresso, Steamed Milk',
      'price': '\$12',
      'icon': Icons.local_cafe,
    },
    {
      'name': 'Cappuccino',
      'subtitle': 'Espresso, Foamed Milk',
      'price': '\$12',
      'icon': Icons.coffee,
    },
    {
      'name': 'Cold Brew',
      'subtitle': 'Espresso, Ice, cold water',
      'price': '\$7',
      'icon': Icons.local_cafe,
    },
    {
      'name': 'Espresso',
      'subtitle': 'Espresso, Hot Water',
      'price': '\$5',
      'icon': Icons.coffee,
    },
    {
      'name': 'Mojito',
      'subtitle': 'Ment, Lime, Soda Water',
      'price': '\$5',
      'icon': Icons.local_drink,
    },
    {
      'name': 'Iced Tea',
      'subtitle': 'Ice, Tea, Fruit Syrup',
      'price': '\$5',
      'icon': Icons.local_drink,
    },
  ];

  @override
  Widget build(BuildContext context) {
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
          name: drink['name'],
          subtitle: drink['subtitle'],
          price: drink['price'],
          icon: drink['icon'],
        );
      },
    );
  }
}
