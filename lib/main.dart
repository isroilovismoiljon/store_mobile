import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_mobile/core/utils/imports.dart';
import 'package:store_mobile/core/network/bloc_dependencies.dart';
import 'features/common/managers/theme_view_model.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  final token = await FirebaseMessaging.instance.getToken();
  FirebaseMessaging.instance.requestPermission();
  print(token);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(430, 932),
      builder:(context, child) =>  MultiRepositoryProvider(
        providers: dependencies,
        child: MultiBlocProvider(
          providers: blocDependencies,
          child: Builder(
            builder: (context) {
              return MaterialApp.router(
                debugShowMaterialGrid: false,
                theme: AppThemes.light,
                darkTheme: AppThemes.dark,
                themeMode: context.watch<ThemeViewModel>().mode,
                debugShowCheckedModeBanner: true,
                routerConfig: router,
              );
            }
          ),
        ),
      ),
    );
  }
}
