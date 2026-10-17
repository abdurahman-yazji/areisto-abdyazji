import 'package:flutter/material.dart';

enum DrinkSize { small, medium, large }

extension DrinkSizeExtension on DrinkSize {
  double get multiplier {
    switch (this) {
      case DrinkSize.small:
        return 1.0;
      case DrinkSize.medium:
        return 1.25;
      case DrinkSize.large:
        return 1.5;
    }
  }

  String get label {
    switch (this) {
      case DrinkSize.small:
        return 'Small';
      case DrinkSize.medium:
        return 'Medium';
      case DrinkSize.large:
        return 'Large';
    }
  }
}

class Drink {
  final String name;
  final String subtitle;
  final String description;
  final double basePrice;
  final IconData icon;
  final bool isSoldOut;
  final String category;
  final DrinkSize size;

  const Drink({
    required this.name,
    required this.subtitle,
    required this.description,
    required this.basePrice,
    required this.icon,
    required this.category,
    this.isSoldOut = false,
    this.size = DrinkSize.small,
  });

  double get price => basePrice * size.multiplier;

  String get customizationSummary => size.label;

  Drink copyWith({
    DrinkSize? size,
  }) {
    return Drink(
      name: name,
      subtitle: subtitle,
      description: description,
      basePrice: basePrice,
      icon: icon,
      category: category,
      isSoldOut: isSoldOut,
      size: size ?? this.size,
    );
  }
}

class Coffee extends Drink {
  final int extraShots;

    const Coffee({
    required super.name,
    required super.subtitle,
    required super.description,
    required super.basePrice,
    required super.icon,
    required super.category,
    super.isSoldOut = false,
    super.size = DrinkSize.small,
    this.extraShots = 0,
  });

  @override
  double get price => super.price + (extraShots * 5);

  @override
  String get customizationSummary {
    if (extraShots == 0) {
      return size.label;
    }

    final shotsText = extraShots == 1
        ? '1 extra shot'
        : '$extraShots extra shots';

    return '${size.label} · $shotsText';
  }

  @override
  Coffee copyWith({
    DrinkSize? size,
    int? extraShots,
  }) {
    return Coffee(
      name: name,
      subtitle: subtitle,
      description: description,
      basePrice: basePrice,
      icon: icon,
      category: category,
      isSoldOut: isSoldOut,
      size: size ?? this.size,
      extraShots: extraShots ?? this.extraShots,
    );
  }
}