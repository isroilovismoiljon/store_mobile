import 'package:store_mobile/core/imports.dart';
import 'package:store_mobile/features/common/managers/theme_view_model.dart';

final dependencies = [
  ChangeNotifierProvider(create: (context) => ThemeViewModel(),),
  Provider(create: (context) => FlutterSecureStorage()),
];