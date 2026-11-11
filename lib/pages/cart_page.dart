import 'package:coffee_flutter/components/coffee_tile.dart';
import 'package:coffee_flutter/models/coffee.dart';
import 'package:coffee_flutter/models/coffee_shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  void removeFromCart(Coffee coffee) {
    Provider.of<CoffeeShop>(context, listen: false).removeItemToCart(coffee);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CoffeeShop>(
      builder: (context, value, child) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const Text('Your Cart', style: TextStyle(fontSize: 20)),
              if (value.userCart.isEmpty)
                 Expanded(
                  child: Center(
                    child: Text('Your cart is empty.'),
                  ),
                )
              else
                Expanded(
                  child: ListView.builder(
                    itemCount: value.userCart.length,
                    itemBuilder: (context, index) {
                      final Coffee eachCoffee = value.userCart[index];

                      return CoffeeTile(
                        coffee: eachCoffee,
                        onPressed: () => removeFromCart(eachCoffee),
                        icon: const Icon(Icons.delete),
                      );
                    },
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
