import 'package:coffee_menu_ui/theme.dart';
import 'package:coffee_menu_ui/widgets/custom_search_bar.dart';
import 'package:flutter/material.dart';
import 'widgets/greeting_row.dart';
import 'widgets/category_chips.dart';
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


class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 16),
                    const GreetingRow(),
                    const SizedBox(height: 24),
                    const CustomerSearchBar(),
                    const SizedBox(height: 24),
                    const CategoryChips(),

                    ]
                    )
                     )
                    )
                    ] 
          ),
        ),
      );
  }
}