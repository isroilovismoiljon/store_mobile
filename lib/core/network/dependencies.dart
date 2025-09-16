import 'package:store_mobile/data/repositories/category_repository.dart';

import '../../../core/imports.dart';

final dependencies = [
  ChangeNotifierProvider(create: (context) => ThemeViewModel(),),
  Provider(create: (context) => FlutterSecureStorage()),
  Provider(create: (context) => AuthInterceptor(secureStorage: context.read())),
  Provider(
    create: (context) => ApiClient(interceptor: context.read(), baseUrl: "http://192.168.10.107:8888/api/v1"),
  ),
  Provider(create: (context) => AuthenticationRepository(client: context.read(), secureStorage: context.read())),
  Provider(create: (context) => CategoryRepository(client: context.read()),)
];