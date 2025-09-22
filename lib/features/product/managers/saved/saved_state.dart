import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:store_mobile/data/models/product/product_model.dart';

import '../../../core/constants/status.dart';

part 'saved_state.freezed.dart';

@freezed
abstract class SavedState with _$SavedState {
  const factory SavedState({
    required Status status,
    required String? errorMessage,
    required Status productsStatus,
    required String? errorMessageProducts,
    required List<ProductModel> products,
  }) = _SavedState;

  factory SavedState.initial() => const SavedState(
    status: Status.idle,
    errorMessage: null,
    productsStatus: Status.idle,
    errorMessageProducts: null,
    products: [],
  );
}
