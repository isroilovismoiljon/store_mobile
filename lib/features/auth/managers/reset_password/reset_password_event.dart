import 'package:store_mobile/data/models/auth/forgot_password_model.dart';

sealed class ResetPasswordEvent {}

final class ResetPasswordSetEvent extends ResetPasswordEvent{
  final ForgotPasswordModel resetPasswordModel;

  ResetPasswordSetEvent({required this.resetPasswordModel});
}