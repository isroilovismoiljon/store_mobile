import '../../../core/imports.dart';

class AuthenticationRepository {
  final ApiClient _client;
  final FlutterSecureStorage _secureStorage;

  AuthenticationRepository({required ApiClient client, required FlutterSecureStorage secureStorage})
    : _client = client, _secureStorage = secureStorage;

  Future<Result<String>> register(RegisterModel model) async {
    var result = await _client.post<Map<String, dynamic>>(
      '/auth/register',
      data: model.toJson(),
    );
    return result.fold(
      (error) => Result.error(error),
      (value)async {
        final String token = value['accessToken'];
        await _secureStorage.write(key: 'token', value: token);
        await _secureStorage.write(key: 'login', value: model.email);
        await _secureStorage.write(key: 'password', value: model.password);
        return Result.ok(token);
      },
    );
  }

  Future<Result<String>> login(LoginModel model) async {
    var result = await _client.post<Map<String, dynamic>>(
      '/auth/login',
      data: model.toJson(),
    );
    return result.fold(
      (error) => Result.error(error),
          (value)async {

        final String token = value['accessToken'];
        await _secureStorage.write(key: 'token', value: token);
        await _secureStorage.write(key: 'login', value: model.login);
        await _secureStorage.write(key: 'password', value: model.password);
        return Result.ok(token);
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
