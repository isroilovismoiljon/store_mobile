
import 'package:store_mobile/core/utils/imports.dart';

sealed class LoginEvent {}

final class LoginRequestEvent extends LoginEvent{
  final LoginModel model;

  LoginRequestEvent({required this.model});
}