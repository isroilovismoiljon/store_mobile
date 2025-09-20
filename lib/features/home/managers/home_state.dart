import 'package:equatable/equatable.dart';
import 'package:store_mobile/data/models/category/category_model.dart';
import 'package:store_mobile/data/models/product/product_model.dart';
import '../../../core/constants/status.dart';

class HomeState extends Equatable {
  final List<CategoryModel> categories;
  final Status statusCategories;
  final String? errorMessageCategories;
  final List<ProductModel> products;
  final Status statusProducts;
  final String? errorMessageProducts;

  const HomeState({
    required this.errorMessageCategories,
    required this.statusCategories,
    required this.categories,
    required this.errorMessageProducts,
    required this.statusProducts,
    required this.products,
  });

  HomeState copyWith({
    List<CategoryModel>? categories,
    Status? statusCategory,
    String? errorMessageCategories,
    List<ProductModel>? products,
    Status? statusProducts,
    String? errorMessageProducts,
  }) => HomeState(
    categories: categories ?? this.categories,
    statusCategories: statusCategory ?? this.statusCategories,
    errorMessageCategories: errorMessageCategories ?? this.errorMessageCategories,
    products: products ?? this.products,
    statusProducts: statusProducts ?? this.statusProducts,
    errorMessageProducts: errorMessageProducts ?? this.errorMessageProducts,
  );

  factory HomeState.initial() => HomeState(
    categories: [],
    statusCategories: Status.idle,
    errorMessageCategories: null,
    errorMessageProducts: null,
    statusProducts: Status.idle,
    products: [],
  );

  @override
  List<Object?> get props => [
    categories,
    statusCategories,
    errorMessageCategories,
    products,
    statusProducts,
    errorMessageProducts,
  ];
}
