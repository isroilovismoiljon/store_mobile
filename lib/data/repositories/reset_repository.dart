import '../../core/utils/imports.dart';

class ResetRepository {
  final ApiClient _client;
  final FlutterSecureStorage _secureStorage;

  ResetRepository({required ApiClient client, required FlutterSecureStorage secureStorage})
    : _client = client, _secureStorage = secureStorage;

  Future<Result<void>> sendOtp(RegisterModel model) async {
    var result = await _client.post<void>(
      '/auth/reset-password/email',
      data: model.toJson(),
    );
    return result.fold(
      (error) => Result.error(error),
      (value)async {
        return Result.ok(null);
      },
    );
  }

  Future<Result<bool>> verifyEmail(LoginModel model) async {
    var result = await _client.post<bool>(
      '/auth/reset-password/verify',
      data: model.toJson(),
    );
    return result.fold(
      (error) => Result.error(error),
          (value)async {
        return Result.ok(value);
      },
    );
  }

  Future<Result<Map<String, dynamic>>> resetPassword(LoginModel model) async {
    var result = await _client.post<Map<String, dynamic>>(
      '/auth/reset-password/reset',
      data: model.toJson(),
    );
    return result.fold(
      (error) => Result.error(error),
          (value)async {
        return Result.ok(value);
      },
    );
  }

  Future<void> logout()async{
    await _secureStorage.delete(key: 'token');
    await _secureStorage.delete(key: 'login');
    await _secureStorage.delete(key: 'password');
    router.go(Routes.login);
  }
}
