import 'package:store_mobile/core/imports.dart';
import 'package:store_mobile/data/models/category/category_model.dart';
import 'package:store_mobile/data/models/product/product_model.dart';

class ProductRepository {
  final ApiClient _client;

  ProductRepository({required ApiClient client}) : _client = client;

  Future<Result<List<ProductModel>>> getProducts(Map<String, dynamic> query) async {
    final result = await _client.get<List>('/products/list', queryParams: query);

    return result.fold(
      (error) => Result.error(error),
      (value) => Result.ok(value.map((x) => ProductModel.fromJson(x)).toList()),
    );
  }
}
