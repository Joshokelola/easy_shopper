import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../controller/cart_bloc/bloc/cart_bloc.dart';

class ShoppingCartWidget extends StatelessWidget {
  const ShoppingCartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var cartItems = 0;
    return BlocConsumer<CartBloc, CartState>(
      listener: (context, state) {
        if (state is CartLoaded) {
          cartItems = state.totalItems;
        }
      },
      builder: (context, state) {
        return  Badge(
          label: Text('$cartItems'),
          child: const Icon(Icons.shopping_cart_outlined),
        );
      },
    );
  }
}
