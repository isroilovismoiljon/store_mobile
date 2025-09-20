import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_mobile/core/constants/status.dart';
import 'package:store_mobile/data/repositories/notifications_repository.dart';
import 'notifications_state.dart';

part 'notifications_event.dart';

class NotificationsBloc extends Bloc<NotificationsEvent, NotificationsState> {
  final NotificationsRepository _notificationsRepository;

  NotificationsBloc({required NotificationsRepository notificationsRepository})
      : _notificationsRepository = notificationsRepository,
        super(NotificationsState.initial()) {
    on<NotificationsEventGetNotifications>(_onGetNotifications);
    add(NotificationsEventGetNotifications());
  }

  Future<void> _onGetNotifications(NotificationsEventGetNotifications event, Emitter<NotificationsState> emit)async {
    emit(state.copyWith(status: Status.loading));
    final result = await _notificationsRepository.getNotifications();
    result.fold((error) {
      emit(state.copyWith(errorMessage: error.toString(),status: Status.error,));
    }, (value) {
      emit(state.copyWith(status: Status.success, errorMessage: null, notifications: value));
    },);
  }

}