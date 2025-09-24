import 'package:store_mobile/core/network/client.dart';
import 'package:store_mobile/core/utils/imports.dart';
import 'package:store_mobile/data/models/cart/cart_items_model.dart';

class CartRepository {
  final ApiClient _client;

  CartRepository({required ApiClient client}) : _client = client;

  Future<Result<CartItemModel>> getMyCartItems() async {
    final result = await _client.get<Map<String, dynamic>>('/my-cart/my-cart-items');
    return result.fold(
      (error) => Result.error(error),
      (value) {
        return Result.ok(CartItemModel.fromJson(value));
      },
    );
  }

  Future<Result<void>> addProductToCart({required int productId, required int sizeId}) async {
    final result = await _client.post(
      '/my-cart/add-item',
      data: {'productId': productId, 'sizeId': sizeId},
    );
    return result.fold(
      (error) => Result.error(error),
      (value) => Result.ok(null),
    );
  }
}
