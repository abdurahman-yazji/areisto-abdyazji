import 'package:flutter/material.dart';
import '../models/drink.dart';

final List<Drink> sampleDrinks = [
  const Drink(
    name: 'Caffè Latte',
    subtitle: 'Espresso, Steamed Milk',
    price: 12,
    icon: Icons.local_cafe,
    category: 'Coffee',
  ),
  const Drink(
    name: 'Cappuccino',
    subtitle: 'Espresso, Foamed Milk',
    price: 12,
    icon: Icons.coffee,
    category: 'Coffee',
  ),
  const Drink(
    name: 'Cold Brew',
    subtitle: 'Espresso, Ice, cold water',
    price: 7,
    icon: Icons.local_cafe,
    category: 'Cold',
  ),
  const Drink(
    name: 'Espresso',
    subtitle: 'Espresso, Hot Water',
    price: 5,
    icon: Icons.coffee,
    category: 'Coffee',
  ),
  const Drink(
    name: 'Mojito',
    subtitle: 'Mint, Lime, Soda Water',
    price: 5,
    icon: Icons.local_drink,
    category: 'Non-Coffee',
  ),
  const Drink(
    name: 'Iced Tea',
    subtitle: 'Ice, Tea, Fruit Syrup',
    price: 5,
    icon: Icons.local_drink,
    category: 'Cold',
  ),
  const Drink(
    name: 'Flat White',
    subtitle: 'Espresso, Steamed Milk',
    price: 9,
    icon: Icons.local_cafe,
    category: 'Coffee',
  ),
  const Drink(
    name: 'Iced Latte',
    subtitle: 'Espresso, Milk, Ice',
    price: 9,
    icon: Icons.icecream,
    category: 'Cold',
    isSoldOut: true,
  ),
  const Drink(
    name: 'Croissant',
    subtitle: 'Butter, Flour',
    price: 4,
    icon: Icons.bakery_dining,
    category: 'Pastries',
    isSoldOut: true,
  ),
];