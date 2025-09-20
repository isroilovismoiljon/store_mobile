import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_mobile/data/repositories/category_repository.dart';
import 'package:store_mobile/data/repositories/product_repository.dart';
import 'package:store_mobile/features/home/managers/home_state.dart';

import '../../../core/constants/status.dart';

class HomeCubit extends Cubit<HomeState> {
  final CategoryRepository _categoryRepository;
  final ProductRepository _productRepository;

  HomeCubit({required CategoryRepository categoryRepository, required ProductRepository productRepository})
    : _categoryRepository = categoryRepository,
      _productRepository = productRepository,
      super(HomeState.initial()) {
    getCategories();
    getProducts({});
  }

  Future<void> getCategories() async {
    emit(state.copyWith(statusCategory: Status.loading, errorMessageCategories: null));
    final result = await _categoryRepository.getCategories();

    result.fold(
      (error) {
        emit(state.copyWith(statusCategory: Status.error, errorMessageCategories: error.toString()));
      },
      (value) {
        emit(state.copyWith(statusCategory: Status.success, errorMessageCategories: null, categories: value));
      },
    );
  }

  Future<void> getProducts(Map<String, dynamic> query) async {
    emit(state.copyWith(statusProducts: Status.loading, errorMessageProducts: null));
    final result = await _productRepository.getProducts(query);

    result.fold(
      (error) {
        emit(state.copyWith(statusProducts: Status.error, errorMessageProducts: error.toString()));
      },
      (value) {
        emit(state.copyWith(statusProducts: Status.success, errorMessageProducts: null, products: value));
      },
    );
  }
}
