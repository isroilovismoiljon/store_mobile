
import 'package:store_mobile/core/utils/imports.dart';

sealed class LoginEvent {}

final class LoginRequestEvent{
  final LoginModel model;

  LoginRequestEvent({required this.model});
}