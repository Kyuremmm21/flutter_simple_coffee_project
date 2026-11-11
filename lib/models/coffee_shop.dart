import 'package:coffee_flutter/models/coffee.dart';
import 'package:flutter/material.dart';

class CoffeeShop extends ChangeNotifier {
  final List<Coffee> _shop = [
    Coffee(
      name: 'Long Black',
      price: '4.10',
      imagePath: 'assets/images/black.png',
    ),
    Coffee(
      name: 'Latte',
      price: '4.20',
      imagePath: 'assets/images/latte.png',
    ),
    Coffee(
      name: 'Espresso',
      price: '3.50',
      imagePath: 'assets/images/espresso.png',
    ),
    Coffee(
      name: 'Ice Coffee',
      price: '4.40',
      imagePath: 'assets/images/iced_coffee.png',
    ),
  ];

  final List<Coffee> _userCart = [];

  List<Coffee> get coffeeShop => _shop;

  List<Coffee> get userCart => _userCart;

  void addItemToCart(Coffee coffee) {
    _userCart.add(coffee);
    notifyListeners();
  }

  void removeItemToCart(Coffee coffee) {
    _userCart.remove(coffee);
    notifyListeners();
  }
}
