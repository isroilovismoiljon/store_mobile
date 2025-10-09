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
      super(MyDetailsState.initial()){
    on<MyDetailsUpdateProfile>(_updateProfile);
  }

  Future<void> _updateProfile(MyDetailsUpdateProfile event, Emitter<MyDetailsState> emit) async {
    emit(state.copyWith(statusMyDetails: Status.loading));
    final result = await _userRepository.updateProfile(
      model: event.user,
    );

    result.fold(
      (error) {
        emit(state.copyWith(statusMyDetails: Status.error, errorMessageMyDetails: error.toString()));
      },
      (value) {
        emit(state.copyWith(statusMyDetails: Status.success, errorMessageMyDetails: null));
      },
    );
  }
}
