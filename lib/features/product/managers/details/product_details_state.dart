import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:store_mobile/data/models/product/product_details_model.dart';

import '../../../../core/constants/status.dart';

part 'product_details_state.freezed.dart';

@freezed
abstract class ProductDetailsState with _$ProductDetailsState {
  const factory ProductDetailsState({
    required ProductDetailsModel? productDetails,
    required Status statusProductDetails,
    required String? errorMessageProductDetails,
    required Status statusLike,
    required String? errorMessageLike,
  }) = _ProductDetailsState;

  factory ProductDetailsState.initial() => const ProductDetailsState(
    productDetails: null,
    statusProductDetails: Status.idle,
    errorMessageProductDetails: null,
    statusLike: Status.idle,
    errorMessageLike: null,
  );
}
