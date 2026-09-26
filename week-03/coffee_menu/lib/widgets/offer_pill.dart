import 'package:flutter/material.dart';
import '../theme.dart';

class OfferPill extends StatelessWidget {
  final String label;

  const OfferPill({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: AppTheme.offerPillBackground,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: AppTheme.offerPillStyle,
      ),
    );
  }
}