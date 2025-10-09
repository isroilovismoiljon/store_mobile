
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_mobile/core/constants/status.dart';
import 'package:store_mobile/core/utils/imports.dart';
import 'package:store_mobile/features/auth/managers/login/login_event.dart';
import 'package:store_mobile/features/auth/managers/login/login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState>{
  final AuthenticationRepository _authenticationRepository;
  LoginBloc({required AuthenticationRepository authenticationRepository}) :
        _authenticationRepository = authenticationRepository,
        super(LoginState.initial());
  
  Future<void> _login(LoginRequestEvent event, Emitter<LoginState> emit)async{
    emit(state.copyWith(statusLogin: Status.loading));
    final result = await _authenticationRepository.login(event.model);
    
    result.fold((error) {
      emit(state.copyWith(statusLogin: Status.error, errorMessageLogin: error.toString()));
    }, (value) {
      emit(state.copyWith(statusLogin: Status.success, errorMessageLogin: null));
    },);
  }
}