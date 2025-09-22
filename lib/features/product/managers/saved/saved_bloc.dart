import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_mobile/core/constants/status.dart';
import 'package:store_mobile/data/repositories/product_repository.dart';
import 'package:store_mobile/data/repositories/user_repository.dart';
import 'package:store_mobile/features/product/managers/saved/saved_event.dart';
import 'package:store_mobile/features/product/managers/saved/saved_state.dart';

class SavedBloc extends Bloc<SavedEvent, SavedState> {
  final ProductRepository _productRepository;

  SavedBloc({
    required UserRepository userRepository,
    required ProductRepository productRepository,
  }) : _productRepository = productRepository,
       super(SavedState.initial()) {
    on<SavedGetSavedProducts>(
      _getSavedProducts,
    );
    add(SavedGetSavedProducts());
  }

  Future<void> _getSavedProducts(SavedGetSavedProducts events, Emitter<SavedState> emit) async {
    emit(state.copyWith(productsStatus: Status.loading, errorMessageProducts: null));
    final result = await _productRepository.getSavedProducts();
    result.fold(
      (error) {
        emit(state.copyWith(productsStatus: Status.error, errorMessageProducts: error.toString()));
      },
      (value) {
        emit(state.copyWith(productsStatus: Status.success, errorMessageProducts: null, products: value));
      },
    );
  }

}
