import '../../../core/imports.dart';

final dependencies = [
  ChangeNotifierProvider(create: (context) => ThemeViewModel(),),
  Provider(create: (context) => FlutterSecureStorage()),
  Provider(create: (context) => AuthenticationRepository(client: context.read(), secureStorage: context.read())),
];