import 'package:flutter/material.dart';

class Drink {
  final String name;
  final String subtitle;
  final String price;
  final IconData icon;
  final bool isSoldOut;
  const Drink({
    required this.name,
    required this.subtitle,
    required this.price,
    required this.icon,
    this.isSoldOut = false,
  });
}