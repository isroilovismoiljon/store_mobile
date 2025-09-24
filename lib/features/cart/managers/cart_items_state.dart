import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/constants/status.dart';
import '../../../data/models/cart/cart_items_model.dart';

part 'cart_items_state.freezed.dart';

@freezed
abstract class CartItemsState with _$CartItemsState {
  const factory CartItemsState({
    required CartItemModel? cartItems,
    required Status statusCartItem,
    required String? errorMessageCartItem,
  }) = _CartItemsState;

  factory CartItemsState.initial() => const CartItemsState(
    cartItems: null,
    statusCartItem: Status.idle,
    errorMessageCartItem: null,
  );
}
