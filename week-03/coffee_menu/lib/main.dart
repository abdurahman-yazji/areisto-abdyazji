import 'package:flutter/material.dart';

import 'menu_screen.dart';
import 'theme.dart';

void main() {
  runApp(const CoffeeMenuApp());
}

class CoffeeMenuApp extends StatelessWidget {
  const CoffeeMenuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Coffee Menu',
      theme: AppTheme.lightTheme,
      home: const MenuScreen(),
    );
  }
}