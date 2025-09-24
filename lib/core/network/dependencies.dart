import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_mobile/data/repositories/cart_repository.dart';
import 'package:store_mobile/data/repositories/category_repository.dart';
import 'package:store_mobile/data/repositories/notifications_repository.dart';
import 'package:store_mobile/data/repositories/product_repository.dart';
import 'package:store_mobile/data/repositories/user_repository.dart';
import '../utils/imports.dart';

final dependencies = [
  ChangeNotifierProvider(create: (context) => ThemeViewModel()),
  Provider(create: (context) => FlutterSecureStorage()),
  Provider(create: (context) => AuthInterceptor(secureStorage: context.read())),
  Provider(
    create: (context) => ApiClient(interceptor: context.read(), baseUrl: "http://192.168.10.107:8888/api/v1"),
    // create: (context) => ApiClient(interceptor: context.read(), baseUrl: "http://172.20.10.6:8888/api/v1")
  ),
  Provider(
    create: (context) => AuthenticationRepository(client: context.read(), secureStorage: context.read()),
  ),
  Provider(
    create: (context) => CategoryRepository(client: context.read()),
  ),
  Provider(create: (context) => ProductRepository(client: context.read())),
  Provider(create: (context) => NotificationsRepository(client: context.read())),
  Provider(create: (context) => UserRepository(client: context.read())),
  Provider(create: (context) => CartRepository(client: context.read())),
];
