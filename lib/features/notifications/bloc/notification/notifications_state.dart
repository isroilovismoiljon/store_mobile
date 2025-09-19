import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:store_mobile/data/models/notifications/notification_model.dart';

import '../../../../core/constants/status.dart';

part 'notifications_state.freezed.dart';

@freezed
abstract class NotificationsState with _$NotificationsState {
  const factory NotificationsState({
    required List<NotificationModel> notifications,
    required Status status,
    required String? errorMessage,
    required String? currentDate,
  }) = _NotificationsState;

  factory NotificationsState.initial() =>
      const NotificationsState(notifications: [], status: Status.idle, errorMessage: null, currentDate: null);
}
