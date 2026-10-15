import 'package:flutter/material.dart';
import 'models/drink.dart';
import 'theme.dart';

class DrinkDetailScreen extends StatefulWidget {
  final Drink drink;
  final ValueChanged<Drink> onAdd;

  const DrinkDetailScreen({
    super.key,
    required this.drink,
    required this.onAdd,
  });

  @override
  State<DrinkDetailScreen> createState() => _DrinkDetailScreenState();
}

class _DrinkDetailScreenState extends State<DrinkDetailScreen> {
  DrinkSize _selectedSize = DrinkSize.small;
  int _extraShots = 0;

   Drink get _configuredDrink {
    final drink = widget.drink;

    if (drink is Coffee) {
      return drink.copyWith(
        size: _selectedSize,
        extraShots: _extraShots,
      );
    }

    return drink.copyWith(
      size: _selectedSize,
    );
  }

  void _changeExtraShots(int change) {
    setState(() {
      _extraShots = (_extraShots + change).clamp(0, 3);
    });
  }

  void _addToOrder() {
    widget.onAdd(_configuredDrink);

    if (mounted) {
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final drink = widget.drink;
    final configuredDrink = _configuredDrink;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.pageBackground,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: AppTheme.textPrimary,
          ),
        ),
        title: Text(
          drink.name,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 12),

                    Center(
                      child: Container(
                        width: 220,
                        height: 220,
                        decoration: BoxDecoration(
                          color: drink.isSoldOut
                              ? AppTheme.soldOutBackground
                              : AppTheme.chipUnselected,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          drink.icon,
                          size: 96,
                          color: drink.isSoldOut
                              ? AppTheme.soldOutIcon
                              : AppTheme.primaryBrand,
                        ),
                      ),
                    ),

                    const SizedBox(height: 28),

                    Text(
                      drink.name,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),

                    const SizedBox(height: 8),

                    Text(
                      drink.description,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        height: 1.5,
                      ),
                    ),

                    const SizedBox(height: 28),

                    Text(
                      'Choose size',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),

                    const SizedBox(height: 12),

                    Row(
                      children: DrinkSize.values.map((size) {
                        final isSelected = size == _selectedSize;

                        return Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(
                              right: size == DrinkSize.large ? 0 : 10,
                            ),
                            child: ChoiceChip(
                              selected: isSelected,
                              onSelected: (_) {
                                setState(() => _selectedSize = size);
                              },
                              selectedColor: AppTheme.primaryBrand,
                              backgroundColor: AppTheme.chipUnselected,
                              showCheckmark: false,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              label: Container(
                                width: double.infinity,
                                alignment: Alignment.center,
                                padding: const EdgeInsets.symmetric(
                                  vertical: 10,
                                ),
                                child: Text(size.label),
                              ),
                              labelStyle: Theme.of(context)
                                  .textTheme
                                  .labelLarge
                                  ?.copyWith(
                                color: isSelected
                                    ? AppTheme.surfaceCard
                                    : AppTheme.textPrimary,
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),

                    if (drink is Coffee) ...[
                      const SizedBox(height: 28),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Extra shots',
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: AppTheme.chipUnselected,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Row(
                              children: [
                                IconButton(
                                  onPressed: _extraShots == 0
                                      ? null
                                      : () => _changeExtraShots(-1),
                                  icon: const Icon(Icons.remove_rounded),
                                  color: AppTheme.primaryBrand,
                                  disabledColor: AppTheme.textSecondary,
                                ),
                                SizedBox(
                                  width: 28,
                                  child: Text(
                                    '$_extraShots',
                                    textAlign: TextAlign.center,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium,
                                  ),
                                ),
                                IconButton(
                                  onPressed: _extraShots == 3
                                      ? null
                                      : () => _changeExtraShots(1),
                                  icon: const Icon(Icons.add_rounded),
                                  color: AppTheme.primaryBrand,
                                  disabledColor: AppTheme.textSecondary,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],

                    const SizedBox(height: 32),
                  ],
                ),
              ),
            ),

            Container(
              padding: const EdgeInsets.fromLTRB(24, 16, 24, 20),
              decoration: BoxDecoration(
                color: AppTheme.surfaceCard,
                boxShadow: [
                  BoxShadow(
                    color: AppTheme.cardShadow,
                    blurRadius: 12,
                    offset: const Offset(0, -4),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Price',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppTheme.textSecondary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        'USD ${configuredDrink.price.toStringAsFixed(2)}',
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium
                            ?.copyWith(
                          color: AppTheme.primaryBrand,
                          fontSize: 24,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 14),

                  SizedBox(
                    width: double.infinity,
                    child: FilledButton(
                      onPressed: drink.isSoldOut ? null : _addToOrder,
                      style: FilledButton.styleFrom(
                        backgroundColor: AppTheme.primaryBrand,
                        disabledBackgroundColor: AppTheme.disabledButtonFill,
                        disabledForegroundColor: AppTheme.disabledButtonText,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                      child: Text(
                        drink.isSoldOut ? 'Sold out' : 'Add to order',
                        style: const TextStyle(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}