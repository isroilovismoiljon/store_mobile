import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_mobile/core/constants/status.dart';
import 'package:store_mobile/data/repositories/cart_repository.dart';
import 'package:store_mobile/features/cart/managers/cart_items_event.dart';
import 'package:store_mobile/features/cart/managers/cart_items_state.dart';

class CartItemsBloc extends Bloc<CartItemsEvent, CartItemsState> {
  final CartRepository _cartRepository;

  CartItemsBloc({required CartRepository cartRepository})
    : _cartRepository = cartRepository,
      super(CartItemsState.initial()) {
    on<CartEventGetMyCartItems>(_getMyCartItems);
    add(CartEventGetMyCartItems());
  }

  Future<void> _getMyCartItems(CartEventGetMyCartItems events, Emitter<CartItemsState> emit) async {
    emit(state.copyWith(statusCartItem: Status.loading));
    final result = await _cartRepository.getMyCartItems();

    result.fold(
      (error) => emit(state.copyWith(statusCartItem: Status.error, errorMessageCartItem: error.toString())),
      (value) => emit(state.copyWith(statusCartItem: Status.success, cartItems: value, errorMessageCartItem: null)),
    );
  }


}
