import 'package:store_mobile/core/core.dart';
import 'package:store_mobile/core/routing/routes.dart';
import 'package:store_mobile/features/auth/pages/sign_up_page.dart';
import 'package:store_mobile/features/home/pages/home_page.dart';
import 'package:store_mobile/features/onboarding/pages/splash_page.dart';

GoRouter router = GoRouter(
  initialLocation: Routes.signUp,
  routes: <RouteBase>[
    GoRoute(path: Routes.home,
    builder: (context, state) => HomePage(),
    ),
    GoRoute(path: Routes.splash,
    builder: (context, state) => SplashPage(),
    ),
    GoRoute(path: Routes.signUp,
    builder: (context, state) => SignUpPage(),
    ),
  ],
);
