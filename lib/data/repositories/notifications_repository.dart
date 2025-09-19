import 'package:store_mobile/core/imports.dart';
import 'package:store_mobile/data/models/notifications/notification_model.dart';

class NotificationsRepository {
  final ApiClient _client;

  NotificationsRepository({required ApiClient client}) : _client = client;

  Future<Result<List<NotificationModel>>> getNotifications() async {
    final result = await _client.get<List>(
      '/notifications/list',
    );
    return result.fold(
      (error) => Result.error(error),
      (value) {
        return Result.ok(value.map((x) => NotificationModel.fromJson(x)).toList());
      },
    );
  }
}
