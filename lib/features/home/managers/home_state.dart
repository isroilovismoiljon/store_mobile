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
  final List<ProductModel> savedProducts;
  final Status statusSavedProducts;
  final String? errorMessageSavedProducts;
  final List<ProductModel> searchItems;
  final Status statusSearch;
  final String? errorMessageSearch;
  final Status statusLike;
  final String? errorMessageLike;

  const HomeState({
    required this.errorMessageCategories,
    required this.statusCategories,
    required this.categories,
    required this.errorMessageProducts,
    required this.statusProducts,
    required this.products,
    required this.statusLike,
    required this.errorMessageLike,
    required this.savedProducts,
    required this.statusSavedProducts,
    required this.errorMessageSavedProducts,
    required this.searchItems,
    required this.statusSearch,
    required this.errorMessageSearch,
  });

  HomeState copyWith({
    List<CategoryModel>? categories,
    Status? statusCategory,
    String? errorMessageCategories,
    List<ProductModel>? products,
    Status? statusProducts,
    String? errorMessageProducts,
    List<ProductModel>? savedProducts,
    Status? statusSavedProducts,
    String? errorMessageSavedProducts,

    List<ProductModel>? searchItems,
    Status? statusSearch,
    String? errorMessageSearch,
    Status? statusLike,
    String? errorMessageLike,
  }) => HomeState(
    categories: categories ?? this.categories,
    statusCategories: statusCategory ?? this.statusCategories,
    errorMessageCategories: errorMessageCategories ?? this.errorMessageCategories,
    products: products ?? this.products,
    statusProducts: statusProducts ?? this.statusProducts,
    errorMessageProducts: errorMessageProducts ?? this.errorMessageProducts,
    statusLike: statusLike ?? this.statusLike,
    errorMessageLike: errorMessageLike ?? this.errorMessageLike,
    savedProducts: savedProducts ?? this.savedProducts,
    statusSavedProducts: statusSavedProducts ?? this.statusSavedProducts,
    errorMessageSavedProducts: errorMessageSavedProducts ?? this.errorMessageSavedProducts,
    searchItems: searchItems ?? this.searchItems,
    statusSearch: statusSearch ?? this.statusSearch,
    errorMessageSearch: errorMessageSearch ?? this.errorMessageSearch,
  );

  factory HomeState.initial() => HomeState(
    categories: [],
    statusCategories: Status.idle,
    errorMessageCategories: null,
    errorMessageProducts: null,
    statusProducts: Status.idle,
    products: [],
    statusLike: Status.idle,
    errorMessageLike: null,
    savedProducts: [],
    statusSavedProducts: Status.idle,
    errorMessageSavedProducts: null,
    searchItems: [],
    statusSearch: Status.idle,
    errorMessageSearch: null,
  );

  @override
  List<Object?> get props => [
    categories,
    statusCategories,
    errorMessageCategories,
    products,
    statusProducts,
    errorMessageProducts,
    statusLike,
    errorMessageLike,
    savedProducts,
    statusSavedProducts,
    errorMessageSavedProducts,
    searchItems,
    statusSearch,
    errorMessageSearch
  ];
}
