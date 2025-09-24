import '../../core/utils/result.dart';
import '../models/category/category_model.dart';

abstract interface class CategoryInterface {
  Future<Result<List<CategoryModel>>> getCategories();
}