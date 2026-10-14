import 'package:coffee_menu_ui/data/drink_data.dart';
import 'package:coffee_menu_ui/models/drink.dart';
import 'package:coffee_menu_ui/models/order.dart';
import 'package:flutter/material.dart';
import 'widgets/search_field.dart';
import 'widgets/bottom_bar.dart';
import 'widgets/category_chips.dart';
import 'widgets/drink_grid.dart';
import 'widgets/greeting_row.dart';
import 'widgets/offer_card.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  String _selectedCategory = 'All';
  final Order _order = Order();

  List<Drink> get _filteredDrinks => _selectedCategory == 'All'
      ? sampleDrinks
      : sampleDrinks.where((d) => d.category == _selectedCategory).toList();

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
                    CategoryChips(
                      selected: _selectedCategory,
                      onSelect: (cat) => setState(() => _selectedCategory = cat),
                    ),
                    const SizedBox(height: 24),
                    const OfferCard(),
                    const SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Popular', style: Theme.of(context).textTheme.titleLarge),
                        Text('See all', style: Theme.of(context).textTheme.labelLarge),
                      ],
                    ),
                    const SizedBox(height: 16),
                    DrinkGrid(
                      drinks: _filteredDrinks,
                      order: _order,
                      onAdd: (drink) => setState(() => _order.addDrink(drink)),
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
            BottomBar(
              itemCount: _order.itemCount,
              total: _order.total,
            ),
          ],
        ),
      ),
    );
  }
}