import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_mobile/core/constants/status.dart';
import 'package:store_mobile/core/utils/imports.dart';
import 'package:store_mobile/data/models/auth/forgot_password_model.dart';
import 'package:store_mobile/features/auth/managers/forgot_password/forgot_password_event.dart';
import 'package:store_mobile/features/auth/managers/forgot_password/forgot_password_state.dart';

class ForgotPasswordBloc extends Bloc<ForgotPasswordEvent, ForgotPasswordState> {
  final AuthenticationRepository _authenticationRepository;

  ForgotPasswordBloc({required AuthenticationRepository authenticationRepository})
    : _authenticationRepository = authenticationRepository,
      super(ForgotPasswordState.initial()){
    on<ForgotPasswordEmail>(_sendEmail);
    on<ForgotPasswordVerify>(_verify);
    on<ForgotPasswordResetEvent>(_reset);
  }

  Future<bool> _sendEmail(ForgotPasswordEmail event, Emitter<ForgotPasswordState> emit) async {
    emit(state.copyWith(statusSendEmail: Status.loading));
    final result = await _authenticationRepository.sendEmail(
      ForgotPasswordModel(
        email: event.email,
        otpCode: null,
        password: null
      ),
    );
    
    return result.fold((error) {
      emit(state.copyWith(statusSendEmail: Status.error, errorMessageSendEmail: error.toString()));
      return false;
    }, (value) {
      emit(state.copyWith(statusSendEmail: Status.success, errorMessageSendEmail: null));
      return true;
    },);
  }

  Future<bool> _verify(ForgotPasswordVerify event, Emitter<ForgotPasswordState> emit) async {
    emit(state.copyWith(statusForgotPassword: Status.loading));
    final result = await _authenticationRepository.verify(
      event.forgotPasswordModel,
    );

    return result.fold((error) {
      emit(state.copyWith(statusForgotPassword: Status.error, errorMessageForgotPassword: error.toString()));
      return false;
    }, (value) {
      emit(state.copyWith(statusForgotPassword: Status.success, errorMessageForgotPassword: null));
      return true;
    },);
  }

  Future<bool> _reset(ForgotPasswordResetEvent event, Emitter<ForgotPasswordState> emit) async {
    emit(state.copyWith(statusForgotPassword: Status.loading));
    final result = await _authenticationRepository.reset(
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
