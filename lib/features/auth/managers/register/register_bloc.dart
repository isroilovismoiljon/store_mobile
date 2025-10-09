
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_mobile/core/constants/status.dart';
import 'package:store_mobile/core/utils/imports.dart';
import 'package:store_mobile/features/auth/managers/register/register_event.dart';
import 'package:store_mobile/features/auth/managers/register/register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState>{
  final AuthenticationRepository _authenticationRepository;
  RegisterBloc({required AuthenticationRepository authenticationRepository}) :
        _authenticationRepository = authenticationRepository,
        super(RegisterState.initial());
  
  Future<void> _register(RegisterRequestEvent event, Emitter<RegisterState> emit)async{
    emit(state.copyWith(statusRegister: Status.loading));
    final result = await _authenticationRepository.register(event.model);
    
    result.fold((error) {
      emit(state.copyWith(statusRegister: Status.error, errorMessageRegister: error.toString()));
    }, (value) {
      emit(state.copyWith(statusRegister: Status.success, errorMessageRegister: null));
    },);
  }
}