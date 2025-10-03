import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_mobile/core/constants/status.dart';
import 'package:store_mobile/data/models/user/update_user_model.dart';
import 'package:store_mobile/data/repositories/user_repository.dart';
import 'package:store_mobile/features/settings/managers/my_details_event.dart';
import 'package:store_mobile/features/settings/managers/my_details_state.dart';

class MyDetailsBloc extends Bloc<MyDetailsEvent, MyDetailsState> {
  final UserRepository _userRepository;

  MyDetailsBloc({required UserRepository userRepository})
      : _userRepository = userRepository,
        super(MyDetailsState.initial());


  Future<void> _updateProfile(MyDetailsUpdateProfile event, Emitter<MyDetailsState> emit) async {
    emit(state.copyWith(statusMyDetails: Status.loading));
    final result = await _userRepository.updateProfile(model: UpdateUserModel(gender: 'Male',
        fullName: "Isroilov Ismoiljon",
        email: 'string@abc.com',
        phoneNumber: '997979898',
        birthDate: '2003-01-01'));
  }
}
