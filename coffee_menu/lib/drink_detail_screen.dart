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
  late DrinkSize _selectedSize;
  late int _extraShots;

  @override
  void initState() {
    super.initState();

    _selectedSize = widget.drink.size;

    if (widget.drink is Coffee) {
      _extraShots = (widget.drink as Coffee).extraShots;
    } else {
      _extraShots = 0;
    }
  }

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
      backgroundColor: AppTheme.pageBackground,
      appBar: AppBar(
        backgroundColor: AppTheme.pageBackground,
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: AppTheme.textPrimary,
            size: 20,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.favorite_border_rounded,
                color: AppTheme.textPrimary,
                size: 22,
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 160,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: drink.isSoldOut
                            ? AppTheme.soldOutBackground
                            : AppTheme.chipUnselected,
                        borderRadius: BorderRadius.circular(22),
                      ),
                      child: Icon(
                        drink.icon,
                        size: 64,
                        color: drink.isSoldOut
                            ? AppTheme.soldOutIcon
                            : AppTheme.primaryBrand,
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
                      'Size',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        for (final size in DrinkSize.values)
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(
                                right: size == DrinkSize.large ? 0 : 8,
                              ),
                              child: _SizeOption(
                                label: size.label,
                                selected: size == _selectedSize,
                                onTap: () {
                                  setState(() => _selectedSize = size);
                                },
                              ),
                            ),
                          ),
                      ],
                    ),
                    if (drink is Coffee) ...[
                      const SizedBox(height: 28),
                      Row(
                        children: [
                          Text(
                            'Extra shots',
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge
                                ?.copyWith(fontSize: 16),
                          ),
                          const Spacer(),
                          Row(
                            children: [
                              _StepperButton(
                                icon: Icons.remove_rounded,
                                filled: false,
                                enabled: _extraShots > 0,
                                onTap: _extraShots == 0
                                    ? null
                                    : () => _changeExtraShots(-1),
                              ),
                              const SizedBox(width: 12),
                              Text(
                                '$_extraShots',
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              const SizedBox(width: 12),
                              _StepperButton(
                                icon: Icons.add_rounded,
                                filled: true,
                                enabled: _extraShots < 3,
                                onTap: _extraShots == 3
                                    ? null
                                    : () => _changeExtraShots(1),
                              ),
                            ],
                          ),
                          const SizedBox(width: 14),
                          Flexible(
                            child: Text(
                              'Coffee only · +5.00 each',
                              textAlign: TextAlign.right,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(fontSize: 11),
                            ),
                          ),
                        ],
                      ),
                    ],
                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(20, 14, 20, 18),
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
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Total',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      const SizedBox(height: 2),
                      Text(
                        configuredDrink.price.toStringAsFixed(2),
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium
                            ?.copyWith(
                          color: AppTheme.primaryBrand,
                          fontSize: 22,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 18),
                  Expanded(
                    child: FilledButton(
                      onPressed: drink.isSoldOut ? null : _addToOrder,
                      style: FilledButton.styleFrom(
                        backgroundColor: AppTheme.primaryBrand,
                        disabledBackgroundColor: AppTheme.disabledButtonFill,
                        disabledForegroundColor: AppTheme.disabledButtonText,
                        minimumSize: const Size.fromHeight(46),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
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

class _SizeOption extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const _SizeOption({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 42,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: selected ? AppTheme.primaryBrand : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          label,
          style: Theme.of(context).textTheme.labelLarge?.copyWith(
            color: selected
                ? AppTheme.surfaceCard
                : AppTheme.textPrimary,
            fontWeight: selected ? FontWeight.w700 : FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

class _StepperButton extends StatelessWidget {
  final IconData icon;
  final bool filled;
  final bool enabled;
  final VoidCallback? onTap;

  const _StepperButton({
    required this.icon,
    required this.filled,
    required this.enabled,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final backgroundColor = !enabled
        ? AppTheme.chipUnselected
        : filled
            ? AppTheme.primaryBrand
            : AppTheme.chipUnselected;

    final iconColor = !enabled
        ? AppTheme.textSecondary
        : filled
            ? AppTheme.surfaceCard
            : AppTheme.primaryBrand;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 32,
        height: 32,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(9),
        ),
        child: Icon(
          icon,
          size: 18,
          color: iconColor,
        ),
      ),
    );
  }
}