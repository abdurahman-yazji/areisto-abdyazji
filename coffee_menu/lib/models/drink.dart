import 'package:flutter/material.dart';

class Drink {
  final String name;
  final String subtitle;
  final double price;
  final IconData icon;
  final bool isSoldOut;
  final String category;
  const Drink({
    required this.name,
    required this.subtitle,
    required this.price,
    required this.icon,
    required this.category,
    this.isSoldOut = false,
  });
}