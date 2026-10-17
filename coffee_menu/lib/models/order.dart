import 'drink.dart';

class Order {
  final List<Drink> _items = [];

  List<Drink> get items => List.unmodifiable(_items);

  void addDrink(Drink drink) {
    if (!drink.isSoldOut) {
      _items.add(drink);
    }
  }

  void removeAt(int index) {
    if (index >= 0 && index < _items.length) {
      _items.removeAt(index);
    }
  }

  void clear() {
    _items.clear();
  }

  int get itemCount => _items.length;

  double get total {
    return _items.fold(
      0.0,
      (sum, drink) => sum + drink.price,
    );
  }

  int countOf(Drink drink) {
    return _items.where((item) => item.name == drink.name).length;
  }
}