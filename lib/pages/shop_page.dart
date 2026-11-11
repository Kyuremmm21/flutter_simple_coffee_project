import 'package:coffee_flutter/components/coffee_tile.dart';
import 'package:coffee_flutter/models/coffee.dart';
import 'package:coffee_flutter/models/coffee_shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  void addToCart(Coffee coffee) {
    Provider.of<CoffeeShop>(context, listen: false).addItemToCart(coffee);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CoffeeShop>(
      builder: (context, value, child) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            children: [
              const Text(
                'How would you like your coffee?',
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: ListView.builder(
                  itemCount: value.coffeeShop.length,
                  itemBuilder: (context, index) {
                    final Coffee eachCoffee = value.coffeeShop[index];

                    return CoffeeTile(
                      coffee: eachCoffee,
                      icon: const Icon(Icons.add),
                      onPressed: () => addToCart(eachCoffee),
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
