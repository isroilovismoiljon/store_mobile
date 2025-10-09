import 'package:store_mobile/data/models/user/update_user_model.dart';

sealed class MyDetailsEvent {}

final class MyDetailsUpdateProfile extends MyDetailsEvent {
  final UpdateUserModel user;

  MyDetailsUpdateProfile({required this.user});
}
