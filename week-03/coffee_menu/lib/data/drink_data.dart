import 'package:flutter/material.dart';
import '../models/drink.dart';

final List<Drink> sampleDrinks = [
  const Drink(
    name: 'Caffè Latte',
    subtitle: 'Espresso, Steamed Milk',
    price: '\$12',
    icon: Icons.local_cafe,
  ),
  const Drink(
    name: 'Cappuccino',
    subtitle: 'Espresso, Foamed Milk',
    price: '\$12',
    icon: Icons.coffee,
  ),
  const Drink(
    name: 'Cold Brew',
    subtitle: 'Espresso, Ice, cold water',
    price: '\$7',
    icon: Icons.local_cafe,
  ),
  const Drink(
    name: 'Espresso',
    subtitle: 'Espresso, Hot Water',
    price: '\$5',
    icon: Icons.coffee,
  ),
  const Drink(
    name: 'Mojito',
    subtitle: 'Ment, Lime, Soda Water',
    price: '\$5',
    icon: Icons.local_drink,
  ),
  const Drink(
    name: 'Iced Tea',
    subtitle: 'Ice, Tea, Fruit Syrup',
    price: '\$5',
    icon: Icons.local_drink,
  ),
    const Drink(
    name: 'Flat White',
    subtitle: 'Espresso, Steamed Milk',
    price: '\$10',
    icon: Icons.local_cafe,
  ),
  const Drink(
    name: 'Iced Latte',
    subtitle: 'Espresso, Milk, Ice',
    price: '\$11',
    icon: Icons.icecream,
    isSoldOut: true,
  ),
];