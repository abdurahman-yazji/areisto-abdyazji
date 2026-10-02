import 'package:flutter/material.dart';
import 'widgets/search_field.dart';
import 'widgets/bottom_bar.dart';
import 'widgets/category_chips.dart';
import 'widgets/drink_grid.dart';
import 'widgets/greeting_row.dart';
import 'widgets/offer_card.dart';

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
                    const SearchField(),
                    const SizedBox(height: 24),
                    const CategoryChips(),
                    const SizedBox(height: 24),
                    const OfferCard(),
                    const SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Popular',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        Text(
                          'See all',
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    const DrinkGrid(),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
            const BottomBar(),
          ],
        ),
      ),
    );
  }
}