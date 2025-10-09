import 'package:store_mobile/data/models/auth/forgot_password_model.dart';

import '../reset_password/reset_password_event.dart';

sealed class ForgotPasswordEvent {}

final class ForgotPasswordVerify extends ForgotPasswordEvent{
  final ForgotPasswordModel forgotPasswordModel;

  ForgotPasswordVerify({required this.forgotPasswordModel});
}

final class ForgotPasswordEmail extends ForgotPasswordEvent {
  final String email;

  ForgotPasswordEmail({required this.email});
}

final class ForgotPasswordResetEvent extends ForgotPasswordEvent{
  final ForgotPasswordModel resetPasswordModel;

  ForgotPasswordResetEvent({required this.resetPasswordModel});
}
