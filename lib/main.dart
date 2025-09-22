import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_mobile/core/utils/imports.dart';
import 'package:store_mobile/core/network/bloc_dependencies.dart';
import 'features/common/managers/theme_view_model.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
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
