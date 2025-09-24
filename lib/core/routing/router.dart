import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_mobile/features/account/pages/account_page.dart';
import 'package:store_mobile/features/cart/pages/my_cart_page.dart';
import 'package:store_mobile/features/home/managers/home_bloc.dart';
import 'package:store_mobile/features/notifications/pages/notifications_page.dart';
import 'package:store_mobile/features/product/pages/product_details_page.dart';
import '../../features/product/pages/saved_page.dart';
import '../utils/imports.dart';

GoRouter router = GoRouter(
  initialLocation: Routes.home,
  routes: <RouteBase>[
    // GoRoute(
    //   path: Routes.home,
    //   builder: (context, state) => HomePage(),
    // ),
    GoRoute(
      path: Routes.splash,
      builder: (context, state) => SplashPage(),
    ),
    GoRoute(
      path: Routes.signUp,
      builder: (context, state) => SignUpPage(),
    ),
    GoRoute(
      path: Routes.login,
      builder: (context, state) => LoginPage(),
    ),
    ShellRoute(
      builder: (context, state, child) {
        return ChangeNotifierProvider(
          create: (_) => ForgotPasswordViewModel(),
          child: child,
        );
      },
      routes: [
        GoRoute(
          path: Routes.forgotPassword,
          builder: (context, state) => ForgotPasswordPage(),
        ),
        GoRoute(
          path: Routes.enterOtp,
          builder: (context, state) => EnterOtpPage(),
        ),
        GoRoute(
          path: Routes.resetPassword,
          builder: (context, state) => ResetPasswordPage(),
        ),
      ],
    ),
    ShellRoute(
      builder: (context, state, child) {
        return BlocProvider<HomeBloc>(
          create: (_) => HomeBloc(
            userRepository: context.read(),
            categoryRepository: context.read(),
            productRepository: context.read(),
          ),
          child: child,
        );
      },
      routes: [
        GoRoute(
          path: Routes.home,
          builder: (context, state) => HomePage(),
        ),
        GoRoute(
          path: Routes.saved,
          builder: (context, state) => SavedPage(),
        ),
      ],
    ),
    GoRoute(
      path: Routes.notifications,
      builder: (context, state) => NotificationsPage(),
    ),
    GoRoute(
      path: Routes.productDetails,
      builder: (context, state) {
        final id = int.parse(state.pathParameters['id']!);
        return ProductDetailsPage(id: id);
      },
    ),
    GoRoute(
      path: Routes.myCart,
      builder: (context, state) => MyCartPage(),
    ),
    GoRoute(
      path: Routes.account,
      builder: (context, state) => AccountPage(),
    ),
  ],
);
