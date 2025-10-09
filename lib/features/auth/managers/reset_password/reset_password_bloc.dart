import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_mobile/core/constants/status.dart';
import 'package:store_mobile/core/utils/imports.dart';
import 'package:store_mobile/data/models/auth/forgot_password_model.dart';
import 'package:store_mobile/features/auth/managers/forgot_password/forgot_password_event.dart';
import 'package:store_mobile/features/auth/managers/forgot_password/forgot_password_state.dart';
import 'package:store_mobile/features/auth/managers/reset_password/reset_password_event.dart';

class ResetPasswordBloc extends Bloc<ResetPasswordEvent, ForgotPasswordState> {
  final AuthenticationRepository _authenticationRepository;

  ResetPasswordBloc({required AuthenticationRepository authenticationRepository})
    : _authenticationRepository = authenticationRepository,
      super(ForgotPasswordState.initial()){
    on<ResetPasswordSetEvent>(_reset);
  }

  Future<bool> _reset(ResetPasswordSetEvent event, Emitter<ForgotPasswordState> emit) async {
    emit(state.copyWith(statusForgotPassword: Status.loading));
    final result = await _authenticationRepository.verify(
      event.resetPasswordModel,
    );

    return result.fold((error) {
      emit(state.copyWith(statusForgotPassword: Status.error, errorMessageForgotPassword: error.toString()));
      return false;
    }, (value) {
      emit(state.copyWith(statusForgotPassword: Status.success, errorMessageForgotPassword: null));
      return true;
    },);
  }
}
