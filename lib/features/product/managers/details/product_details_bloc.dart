import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_mobile/core/constants/status.dart';
import 'package:store_mobile/data/models/product/product_details_model.dart';
import 'package:store_mobile/data/repositories/product_repository.dart';
import 'package:store_mobile/data/repositories/user_repository.dart';
import 'package:store_mobile/features/product/managers/details/product_details_event.dart';
import 'package:store_mobile/features/product/managers/details/product_details_state.dart';

import '../../../home/managers/home_event.dart';

class ProductDetailsBloc extends Bloc<ProductDetailsEvent, ProductDetailsState> {
  final ProductRepository _productRepository;
  final UserRepository _userRepository;

  ProductDetailsBloc({required ProductRepository productRepository, required UserRepository userRepo})
    : _productRepository = productRepository,
      _userRepository = userRepo,
      super(ProductDetailsState.initial()) {
    on<ProductDetailsGetProductDetails>(_getProductDetails);
    on<ProductDetailsSaveProduct>(_save);
    on<ProductDetailsUnSaveProduct>(_unSave);
  }

  Future<void> _getProductDetails(ProductDetailsGetProductDetails events, Emitter<ProductDetailsState> emit) async {
    emit(state.copyWith(statusProductDetails: Status.loading, errorMessageProductDetails: null));

    final result = await _productRepository.getProductDetails(events.id);
    result.fold(
      (error) => emit(state.copyWith(statusProductDetails: Status.error, errorMessageProductDetails: error.toString())),
      (value) {
        emit(
          state.copyWith(productDetails: value, statusProductDetails: Status.success, errorMessageProductDetails: null),
        );
      },
    );
  }

  Future<void> _save(ProductDetailsSaveProduct events, Emitter<ProductDetailsState> emit) async {
    emit(state.copyWith(statusLike: Status.loading, errorMessageLike: null));
    final result = await _userRepository.save(events.id);
    result.fold(
      (error) {
        emit(state.copyWith(statusLike: Status.error, errorMessageLike: error.toString()));
      },
      (value) {
        ProductDetailsModel updatedProduct = ProductDetailsModel(
          id: 1,
          title: state.productDetails!.title,
          description: state.productDetails!.description,
          price: state.productDetails!.price,
          isLiked: true,
          productImages: state.productDetails!.productImages,
          productSizes: state.productDetails!.productSizes,
          reviewsCount: state.productDetails!.reviewsCount,
          rating: state.productDetails!.rating,
        );
        emit(state.copyWith(statusLike: Status.success, errorMessageLike: null, productDetails: updatedProduct));
      },
    );
  }

  Future<void> _unSave(ProductDetailsUnSaveProduct events, Emitter<ProductDetailsState> emit) async {
    emit(state.copyWith(statusLike: Status.loading, errorMessageLike: null));
    final result = await _userRepository.save(events.id);
    result.fold(
      (error) {
        emit(state.copyWith(statusLike: Status.error, errorMessageLike: error.toString()));
      },
      (value) {
        ProductDetailsModel updatedProduct = ProductDetailsModel(
          id: 1,
          title: state.productDetails!.title,
          description: state.productDetails!.description,
          price: state.productDetails!.price,
          isLiked: false,
          productImages: state.productDetails!.productImages,
          productSizes: state.productDetails!.productSizes,
          reviewsCount: state.productDetails!.reviewsCount,
          rating: state.productDetails!.rating,
        );
        emit(state.copyWith(statusLike: Status.success, errorMessageLike: null, productDetails: updatedProduct));
      },
    );
  }

}
