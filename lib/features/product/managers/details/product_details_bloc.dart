import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_mobile/core/constants/status.dart';
import 'package:store_mobile/data/repositories/product_repository.dart';
import 'package:store_mobile/features/product/managers/details/product_details_event.dart';
import 'package:store_mobile/features/product/managers/details/product_details_state.dart';

class ProductDetailsBloc extends Bloc<ProductDetailsEvent, ProductDetailsState> {
  final ProductRepository _productRepository;

  ProductDetailsBloc({required ProductRepository productRepository})
    : _productRepository = productRepository,
      super(ProductDetailsState.initial()){
    on<ProductDetailsGetProductDetails>(_getProductDetails);
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
}
