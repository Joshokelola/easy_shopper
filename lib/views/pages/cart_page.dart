import 'package:flutter/material.dart';

class ShoppingCartPage extends StatelessWidget {

  const ShoppingCartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Cart'),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: const ShoppingCartEmpty(),
    );
  }
}

class ShoppingCartEmpty extends StatelessWidget {
  const ShoppingCartEmpty({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const FlutterLogo(size: 150),
          const SizedBox(height: 20),
          const Text(
            'Your Cart is empty',
            style: TextStyle(fontSize: 20),
          ),
          const SizedBox(height: 20),
          const Text(
            'Explore our collections today and start your journey\ntowards radiant beauty. Your skin will thank you',
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          TextButton(
            onPressed: () {},
            child: const Text('Start shopping'),
          ),
        ],
      ),
    );
  }
}
