import 'package:flutter/material.dart';

class Drink {
  final String name;
  final String subtitle;
  final String price;
  final IconData icon;

  const Drink({
    required this.name,
    required this.subtitle,
    required this.price,
    required this.icon,
  });
}