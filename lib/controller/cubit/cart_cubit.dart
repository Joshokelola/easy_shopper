

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../model/t_product.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());
}
