import 'package:catalog/models/item.dart';
import 'package:flutter/widgets.dart';

class CartCtrl extends ChangeNotifier {
  final List<Item> items = [
    Item(name: "Camisa vasual", price: 59.90),
    Item(name: "Caução de veludo", price: 39.90),
    Item(name: "Chapéu de vaqueiro", price: 49.90),
    Item(name: "Sandália Nike", price: 89.90),
    Item(name: "Óculos escuros", price: 69.90),
    Item(name: "Bolsa de escola", price: 109.90),
  ];

  final List<Item> selectedItems = [];

  double total = 0;

  void add(Item item) {
    selectedItems.add(item);
    calculateTotal();
  }

  void remove(Item item) {
    selectedItems.remove(item);
    calculateTotal();
  }

  calculateTotal() {
    selectedItems.forEach((i) {
      total += i.price;  
    });

    String t = total.toStringAsFixed(3);
    total = double.parse(t);
    notifyListeners();
  }

}