import 'package:flutter/material.dart';
import '../models/order.dart';

class CartScreen extends StatelessWidget {
  final Order order;

  const CartScreen({
    super.key,
    required this.order,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: Center(
        child: Text(
          order.itemCount == 0
              ? 'Your cart is empty'
              : '${order.itemCount} items · \$${order.total.toStringAsFixed(2)}',
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
    );
  }
}