import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:store_mobile/data/models/product/product_model.dart';
import 'package:store_mobile/data/repositories/category_repository.dart';
import 'package:store_mobile/data/repositories/product_repository.dart';
import 'package:store_mobile/data/repositories/user_repository.dart';
import 'package:store_mobile/features/home/managers/home_event.dart';
import 'package:store_mobile/features/home/managers/home_state.dart';

import '../../../core/constants/status.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final CategoryRepository _categoryRepository;
  final ProductRepository _productRepository;
  final UserRepository _userRepository;

  HomeBloc({
    required UserRepository userRepository,
    required CategoryRepository categoryRepository,
    required ProductRepository productRepository,
  }) : _categoryRepository = categoryRepository,
       _productRepository = productRepository,
       _userRepository = userRepository,
       super(HomeState.initial()) {
    on<HomeEventGetCategories>(_getCategories);
    add(HomeEventGetCategories());
    on<HomeEventGetProducts>(_getProducts);
    add(HomeEventGetProducts());
    on<HomeEventSaveProduct>(
      _save,
      transformer: (events, mapper) => events.throttleTime(Duration(milliseconds: 500)).switchMap(mapper),
    );
    on<HomeEventUnSaveProduct>(
      _unSave,
      transformer: (events, mapper) => events.throttleTime(Duration(milliseconds: 500)).switchMap(mapper),
    );
    on<HomeEventGetSavedProducts>(_getSavedProducts);
    add(HomeEventGetSavedProducts());
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

  Future<void> _getProducts(HomeEventGetProducts events, Emitter<HomeState> emit) async {
    emit(state.copyWith(statusProducts: Status.loading, errorMessageProducts: null));
    final result = await _productRepository.getProducts({'CategoryId': events.categoryId});

    result.fold(
      (error) {
        emit(state.copyWith(statusProducts: Status.error, errorMessageProducts: error.toString()));
      },
      (value) {
        emit(state.copyWith(statusProducts: Status.success, errorMessageProducts: null, products: value));
      },
    );
  }

  Future<void> _save(HomeEventSaveProduct events, Emitter<HomeState> emit) async {
    emit(state.copyWith(statusLike: Status.loading, errorMessageLike: null));
    final result = await _userRepository.save(events.id);
    result.fold(
      (error) {
        emit(state.copyWith(statusLike: Status.error, errorMessageLike: error.toString()));
      },
      (value) {
        final int index = state.products.indexWhere((x) => x.id == events.id);
        if (index == -1) return;

        final updatedProducts = List<ProductModel>.from(state.products);
        final product = state.products[index];
        updatedProducts[index] = ProductModel(
          categoryId: product.categoryId,
          image: product.image,
          price: product.price,
          isLiked: true,
          discount: product.discount,
          id: product.id,
          title: product.title,
        );
        emit(state.copyWith(statusLike: Status.success, errorMessageLike: null, products: updatedProducts));
        add(HomeEventGetSavedProducts());
      },
    );
  }

  Future<void> _unSave(HomeEventUnSaveProduct events, Emitter<HomeState> emit) async {
    emit(state.copyWith(statusLike: Status.loading, errorMessageLike: null));

    final result = await _userRepository.unSave(events.id);
    result.fold(
      (error) {
        emit(state.copyWith(statusLike: Status.error, errorMessageLike: error.toString()));
      },
      (value) {
        final int index = state.products.indexWhere((x) => x.id == events.id);
        if (index == -1) return;

        final updatedProducts = List<ProductModel>.from(state.products);
        final product = state.products[index];
        updatedProducts[index] = ProductModel(
          categoryId: product.categoryId,
          image: product.image,
          price: product.price,
          isLiked: false,
          discount: product.discount,
          id: product.id,
          title: product.title,
        );
        emit(state.copyWith(statusLike: Status.success, errorMessageLike: null, products: updatedProducts));
        add(HomeEventGetSavedProducts());
      },
    );
  }

  Future<void> _getSavedProducts(HomeEventGetSavedProducts events, Emitter<HomeState> emit) async {
    emit(state.copyWith(statusSavedProducts: Status.loading, errorMessageSavedProducts: null));
    final result = await _productRepository.getSavedProducts();
    result.fold(
      (error) {
        emit(
          state.copyWith(statusSavedProducts: Status.error, errorMessageSavedProducts: error.toString()),
        );
      },
      (value) {
        emit(
          state.copyWith(statusSavedProducts: Status.success, errorMessageSavedProducts: null, savedProducts: value),
        );
      },
    );
  }
}
