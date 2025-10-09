import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:store_mobile/core/constants/status.dart';

part 'forgot_password_state.freezed.dart';

@freezed
abstract class ForgotPasswordState with _$ForgotPasswordState {
  const factory ForgotPasswordState({
    required Status statusForgotPassword,
    required String? errorMessageForgotPassword,
    required Status statusResetPassword,
    required String? errorMessageReset,
    required Status statusSendEmail,
    required String? errorMessageSendEmail,
  }) = _ForgotPasswordState;

  factory ForgotPasswordState.initial() => const ForgotPasswordState(
    statusForgotPassword: Status.idle,
    errorMessageForgotPassword: null,
    errorMessageReset: null,
    statusResetPassword: Status.idle,
    statusSendEmail: Status.idle,
    errorMessageSendEmail: null
  );
}
