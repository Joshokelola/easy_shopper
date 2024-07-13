part of 'cart_cubit.dart';

sealed class CartState {}

final class CartInitial extends CartState {}

final class CartActive extends CartState {
  final List<Items> cartItems;
  CartActive(this.cartItems);
}
