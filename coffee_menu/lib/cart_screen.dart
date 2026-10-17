import 'package:flutter/material.dart';
import 'models/drink.dart';
import 'models/order.dart';
import 'services/fake_order_service.dart';
import 'theme.dart';

class CartScreen extends StatefulWidget {
  final Order order;
  final VoidCallback onChanged;

  const CartScreen({
    super.key,
    required this.order,
    required this.onChanged,
  });

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final FakeOrderService _orderService = FakeOrderService();

  bool _isPlacingOrder = false;
  String? _successOrderNumber;
  String? _errorMessage;

  Future<void> _placeOrder() async {
    if (_isPlacingOrder || widget.order.itemCount == 0) {
      return;
    }

    setState(() {
      _isPlacingOrder = true;
      _successOrderNumber = null;
      _errorMessage = null;
    });

    try {
      final orderNumber = await _orderService.placeOrder(widget.order);

      // حماية مهمة: المستخدم ممكن يرجع أثناء الانتظار.
      if (!mounted) return;

      widget.order.clear();

      setState(() {
        _isPlacingOrder = false;
        _successOrderNumber = orderNumber;
      });

      widget.onChanged();
    } catch (error) {
      if (!mounted) return;

      setState(() {
        _isPlacingOrder = false;
        _errorMessage = error.toString().replaceFirst('Exception: ', '');
      });
    }
  }

  void _removeItem(int index) {
    setState(() {
      widget.order.removeAt(index);
      _successOrderNumber = null;
      _errorMessage = null;
    });

    widget.onChanged();
  }

  @override
  Widget build(BuildContext context) {
    final order = widget.order;
    final canPlaceOrder = order.itemCount > 0 && !_isPlacingOrder;

    return Scaffold(
      backgroundColor: AppTheme.pageBackground,
      appBar: AppBar(
        backgroundColor: AppTheme.pageBackground,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: AppTheme.textPrimary,
            size: 20,
          ),
        ),
        title: Text(
          'Your order',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        centerTitle: false,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.fromLTRB(20, 4, 20, 20),
                children: [
                  if (_successOrderNumber != null)
                    _CheckoutStateMessage(
                      success: true,
                      title: 'Order placed',
                      message: _successOrderNumber!,
                    ),
                  if (_errorMessage != null)
                    _CheckoutStateMessage(
                      success: false,
                      title: 'Payment declined',
                      message: _errorMessage!,
                      retryText: 'Try again',
                      onRetry: canPlaceOrder ? _placeOrder : null,
                    ),
                  if (order.items.isEmpty)
                    _EmptyCart(
                      onBrowseMenu: () => Navigator.of(context).pop(),
                    )
                  else ...[
                    for (int index = 0; index < order.items.length; index++)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: _CartItemTile(
                          drink: order.items[index],
                          enabled: !_isPlacingOrder,
                          onRemove: () => _removeItem(index),
                        ),
                      ),
                  ],
                ],
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
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Items',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      Text(
                        '${order.itemCount}',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      Text(
                        order.total.toStringAsFixed(2),
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
                  const SizedBox(height: 14),
                  SizedBox(
                    width: double.infinity,
                    child: FilledButton(
                      onPressed: order.itemCount == 0 || _isPlacingOrder
                          ? null
                          : _placeOrder,
                      style: FilledButton.styleFrom(
                        backgroundColor: AppTheme.primaryBrand,
                        disabledBackgroundColor: _isPlacingOrder
                            ? AppTheme.primaryBrand.withValues(alpha: 0.65)
                            : AppTheme.disabledButtonFill,
                        disabledForegroundColor: _isPlacingOrder
                            ? Colors.white
                            : AppTheme.disabledButtonText,
                        minimumSize: const Size.fromHeight(46),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: _isPlacingOrder
                          ? const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 18,
                                  height: 18,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(width: 10),
                                Text(
                                  'Placing order',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            )
                          : const Text(
                              'Place order',
                              style: TextStyle(
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

class _CartItemTile extends StatelessWidget {
  final Drink drink;
  final bool enabled;
  final VoidCallback onRemove;

  const _CartItemTile({
    required this.drink,
    required this.enabled,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: AppTheme.surfaceCard,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: AppTheme.cardShadow,
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              color: AppTheme.chipUnselected,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              drink.icon,
              size: 22,
              color: AppTheme.primaryBrand,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  drink.name,
                  style: Theme.of(context).textTheme.titleMedium,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 3),
                Text(
                  drink.customizationSummary,
                  style: Theme.of(context).textTheme.bodySmall,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          Text(
            drink.price.toStringAsFixed(2),
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              fontSize: 14,
            ),
          ),
          IconButton(
            onPressed: enabled ? onRemove : null,
            icon: const Icon(
              Icons.delete_outline_rounded,
              size: 20,
            ),
            color: AppTheme.errorText,
            disabledColor: AppTheme.textSecondary,
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(
              minWidth: 36,
              minHeight: 36,
            ),
          ),
        ],
      ),
    );
  }
}

class _CheckoutStateMessage extends StatelessWidget {
  final bool success;
  final String title;
  final String message;
  final String? retryText;
  final VoidCallback? onRetry;

  const _CheckoutStateMessage({
    required this.success,
    required this.title,
    required this.message,
    this.retryText,
    this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    final textColor = success
        ? AppTheme.successText
        : AppTheme.errorText;

    final backgroundColor = success
        ? AppTheme.successPanel
        : AppTheme.errorPanel;

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 34,
                height: 34,
                decoration: BoxDecoration(
                  color: textColor,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  success
                      ? Icons.check_rounded
                      : Icons.error_outline_rounded,
                  color: Colors.white,
                  size: 20,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(color: textColor),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      message,
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall
                          ?.copyWith(color: textColor),
                    ),
                  ],
                ),
              ),
            ],
          ),
          if (retryText != null) ...[
            const SizedBox(height: 12),
            SizedBox(
              width: 140,
              height: 38,
              child: FilledButton(
                onPressed: onRetry,
                style: FilledButton.styleFrom(
                  backgroundColor: AppTheme.errorText,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  retryText!,
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _EmptyCart extends StatelessWidget {
  final VoidCallback onBrowseMenu;

  const _EmptyCart({
    required this.onBrowseMenu,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 70),
      child: Center(
        child: Column(
          children: [
            Container(
              width: 76,
              height: 76,
              decoration: const BoxDecoration(
                color: AppTheme.chipUnselected,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.shopping_bag_outlined,
                size: 34,
                color: AppTheme.primaryBrand,
              ),
            ),
            const SizedBox(height: 18),
            Text(
              'Your cart is empty',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 6),
            Text(
              'Add a drink from the menu and it will show up here.',
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: 150,
              height: 42,
              child: FilledButton(
                onPressed: onBrowseMenu,
                style: FilledButton.styleFrom(
                  backgroundColor: AppTheme.primaryBrand,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'Back to menu',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}