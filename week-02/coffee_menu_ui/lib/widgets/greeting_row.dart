import 'package:flutter/material.dart';
import '../theme.dart';


class GreetingRow extends StatelessWidget {
  const GreetingRow({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Good morning', style: textTheme.bodyMedium),
            Text('Abd ', style: textTheme.headlineMedium),
          ],
        ),
        Container(
          width: 44,
          height: 44,
          decoration: const BoxDecoration(
            color: AppTheme.chipUnselected,
            shape: BoxShape.circle,
          ),
          alignment: Alignment.center,
          child: Text(
            'A',
            style: textTheme.titleMedium?.copyWith(
              color: AppTheme.primaryBrand,
            ),
          ),
        ),
      ],
    );
  }
}