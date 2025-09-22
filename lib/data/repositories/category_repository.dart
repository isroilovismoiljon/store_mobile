import 'package:store_mobile/core/utils/imports.dart';
import 'package:store_mobile/data/models/category/category_model.dart';

class CategoryRepository {
  final ApiClient _client;

  CategoryRepository({required ApiClient client}) : _client = client;

  Future<Result<List<CategoryModel>>> getCategories() async {
    final result = await _client.get<List>('/categories/list');

    return result.fold(
      (error) => Result.error(error),
      (value) => Result.ok(value.map((x) => CategoryModel.fromJson(x)).toList()),
    );
  }
}
