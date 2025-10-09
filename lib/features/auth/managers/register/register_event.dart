
import 'package:store_mobile/core/utils/imports.dart';

sealed class RegisterEvent {}

final class RegisterRequestEvent{
  final RegisterModel model;

  RegisterRequestEvent({required this.model});
}