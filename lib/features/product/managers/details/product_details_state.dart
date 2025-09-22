import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:store_mobile/data/models/product/product_details_model.dart';

import '../../../../core/constants/status.dart';

part 'product_details_state.freezed.dart';

@freezed
abstract class ProductDetailsState with _$ProductDetailsState {
  const factory ProductDetailsState({
    required List<ProductDetailsModel> productDetails,
    required Status statusProductDetails,
    required String? errorMessageProductDetails,
  }) = _ProductDetailsState;

  factory ProductDetailsState.initial() => const ProductDetailsState(
    productDetails: [],
    statusProductDetails: Status.idle,
    errorMessageProductDetails: null,
  );
}
