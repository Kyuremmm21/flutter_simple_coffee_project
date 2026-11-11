import 'package:flutter/material.dart';
import '../models/coffee.dart';

class CoffeeTile extends StatelessWidget {
  final Coffee coffee;
  final Widget icon;
  final VoidCallback? onPressed;

  const CoffeeTile({
    super.key,
    required this.coffee,
    required this.icon,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(12),
      ),
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 10),
      child: ListTile(
        title: Text(coffee.name),
        subtitle: Text('\$${coffee.price}'),
        leading: const Icon(Icons.local_cafe, size: 42),
        trailing: IconButton(
          icon: icon,
          onPressed: onPressed,
        ),
      ),
    );
  }
}
