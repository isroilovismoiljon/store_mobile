
import 'package:store_mobile/core/utils/imports.dart';
import 'package:store_mobile/data/models/user/response_user_model.dart';
import 'package:store_mobile/data/models/user/update_user_model.dart';

class UserRepository {
  final ApiClient _client;

  UserRepository({required ApiClient client}) : _client = client;

  Future<Result<ResponseUserModel>> updateProfile({required UpdateUserModel model})async{
    final result = await _client.post('/auth/update', data: model);
    return result.fold((error) {
      return Result.error(error);
    }, (value) {
      return Result.ok(value);
    },);
  }

  Future<Result<void>> save(int id)async{
    final result = await _client.post('/auth/save/$id', data: null);
    return result.fold((error) {
      return Result.error(error);
    }, (value) {
      return Result.ok(null);
    },);
  }

  Future<Result<void>> unSave(int id)async{
    final result = await _client.post('/auth/unsave/$id', data: null);
    return result.fold((error) {
      return Result.error(error);
    }, (value) {
      return Result.ok(null);
    },);
  }
}