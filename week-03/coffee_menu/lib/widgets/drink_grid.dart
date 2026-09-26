import 'package:flutter/material.dart';
import '../data/drink_data.dart';
import 'drink_card.dart';

class DrinkGrid extends StatelessWidget {
  const DrinkGrid({super.key});

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
      itemCount: sampleDrinks.length,
      itemBuilder: (context, index) {
        return DrinkCard(drink: sampleDrinks[index]);
      },
    );
  }
}