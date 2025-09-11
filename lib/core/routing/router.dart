import 'package:store_mobile/core/core.dart';
import 'package:store_mobile/core/routing/routes.dart';
import 'package:store_mobile/features/home/pages/home_page.dart';

GoRouter router = GoRouter(
  initialLocation: Routes.home,
  routes: <RouteBase>[
    GoRoute(path: Routes.home,
    builder: (context, state) => HomePage(),
    )
  ],
);
