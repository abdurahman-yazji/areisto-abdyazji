// lib/services/fake_order_service.dart
import '../models/order.dart';

class FakeOrderService {
  Future<String> placeOrder(Order order) async {
    await Future.delayed(const Duration(seconds: 2));

    if (order.itemCount == 0) {
      throw Exception('Your cart is empty');
    }

    if (order.total > 150) {
      throw Exception('Payment declined — order too large for cash on delivery');
    }

    return 'ARS-${DateTime.now().millisecondsSinceEpoch % 10000}';
  }
}