import 'package:coffee_menu_ui/models/drink.dart';

class Order {
  final List<Drink> _items = [];

  void addDrink(Drink drink) {
    if (!drink.isSoldOut) _items.add(drink);
  }

  int get itemCount => _items.length;

  double get total => _items.fold(0, (sum, d) => sum + d.price);

  // للـ badge — كم مرة أُضيف هذا المشروع
  int countOf(Drink drink) => _items.where((d) => d.name == drink.name).length;
}