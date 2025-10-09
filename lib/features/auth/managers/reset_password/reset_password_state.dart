import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:store_mobile/core/constants/status.dart';

part 'reset_password_state.freezed.dart';

@freezed
abstract class ResetPasswordState with _$ResetPasswordState {
  const factory ResetPasswordState({
    required Status statusResetPassword,
    required String? errorMessageFP,
  }) = _ResetPasswordState;

  factory ResetPasswordState.initial() => const ResetPasswordState(
    statusResetPassword: Status.idle,
    errorMessageFP: null,
  );
}
