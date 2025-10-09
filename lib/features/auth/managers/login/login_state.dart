import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/constants/status.dart';

part 'login_state.freezed.dart';

@freezed
abstract class LoginState with _$LoginState{
  const factory LoginState({
    required Status statusLogin,
    required String? errorMessageLogin
}) = _LoginState;
  
  factory LoginState.initial() => const LoginState(
    statusLogin: Status.idle,
    errorMessageLogin: null
  );
}