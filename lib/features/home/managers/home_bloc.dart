import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_mobile/data/repositories/category_repository.dart';
import 'package:store_mobile/data/repositories/product_repository.dart';
import 'package:store_mobile/data/repositories/user_repository.dart';
import 'package:store_mobile/features/home/managers/home_event.dart';
import 'package:store_mobile/features/home/managers/home_state.dart';

import '../../../core/constants/status.dart';

class HomeCubit extends Bloc<HomeEvent, HomeState> {
  final CategoryRepository _categoryRepository;
  final ProductRepository _productRepository;
  final UserRepository _userRepository;

  HomeCubit({
    required UserRepository userRepository,
    required CategoryRepository categoryRepository,
    required ProductRepository productRepository,
  }) : _categoryRepository = categoryRepository,
       _productRepository = productRepository,
       _userRepository = userRepository,
       super(HomeState.initial()) {
    on<HomeEventGetCategories>(_getCategories)
  }

  Future<void> _getCategories(HomeEventGetCategories events, Emitter<HomeState> emit) async {
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

  Future<void> _getProducts(Map<String, dynamic> query) async {
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

  Future<void> _save(int id) async {
    emit(state.copyWith(statusLike: Status.loading, errorMessageLike: null));
    final result = await _userRepository.save(id);
    result.fold(
      (error) {
        emit(state.copyWith(statusLike: Status.error, errorMessageLike: error.toString()));
      },
      (value) {
        emit(state.copyWith(statusLike: Status.success, errorMessageLike: null));
      },
    );
  }

  Future<void> _unSave(int id) async {
    emit(state.copyWith(statusLike: Status.loading, errorMessageLike: null));
    final int index = state.products.indexWhere((x) => x.id == id);
    final product = state.products[index];
    if (index == -1) return;

    final updatedProduct = state.copyWith();
    final result = await _userRepository.save(id);
    result.fold(
      (error) {
        emit(state.copyWith(statusLike: Status.error, errorMessageLike: error.toString()));
      },
      (value) {
        emit(state.copyWith(statusLike: Status.success, errorMessageLike: null));
      },
    );
  }
}
