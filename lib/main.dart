import 'package:store_mobile/core/core.dart';

import 'features/common/managers/theme_view_model.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(430, 932),
      child: MultiProvider(
        providers: dependencies,
        builder: (context, child) => MaterialApp.router(
          theme: AppThemes.light,
          darkTheme: AppThemes.dark,
          themeMode: context.watch<ThemeViewModel>().mode,
          debugShowCheckedModeBanner: true,
          routerConfig: router,
        ),
      ),
    );
  }
}
