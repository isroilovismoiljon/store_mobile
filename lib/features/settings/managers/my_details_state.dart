import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/constants/status.dart';

part 'my_details_state.freezed.dart';

@freezed
abstract class MyDetailsState with _$MyDetailsState {
  const factory MyDetailsState({
    required Status statusMyDetails,
    required String? errorMessageMyDetails,
  }) = _MyDetailsState;

  factory MyDetailsState.initial() => const MyDetailsState(
    statusMyDetails: Status.idle,
    errorMessageMyDetails: null,
  );
}
