import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_mobile/features/address/pages/new_address.dart';
import 'package:store_mobile/features/settings/pages/account_page.dart';
import 'package:store_mobile/features/cart/pages/my_cart_page.dart';
import 'package:store_mobile/features/home/managers/home_bloc.dart';
import 'package:store_mobile/features/notifications/pages/notifications_page.dart';
import 'package:store_mobile/features/payment/pages/chekout_page.dart';
import 'package:store_mobile/features/payment/pages/payment_method_page.dart';
import 'package:store_mobile/features/product/pages/product_details_page.dart';
import 'package:store_mobile/features/settings/pages/help_center_page.dart';
import 'package:store_mobile/features/settings/pages/my_details_page.dart';
import 'package:store_mobile/features/settings/pages/notifications_set_page.dart';
import '../../features/auth/managers/forgot_password/forgot_password_bloc.dart';
import '../../features/product/pages/saved_page.dart';
import '../utils/imports.dart';

GoRouter router = GoRouter(
  initialLocation: Routes.newAddress,
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
        return BlocProvider(
          create: (_) => ForgotPasswordBloc(authenticationRepository: context.read()),
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
    GoRoute(
      path: Routes.checkout,
      builder: (context, state) => CheckoutPage(),
    ),
    GoRoute(
      path: Routes.paymentMethod,
      builder: (context, state) => PaymentMethodPage(),
    ),
    GoRoute(
      path: Routes.notificationsSettings,
      builder: (context, state) => NotificationsSetPage(),
    ),
    GoRoute(
      path: Routes.helpCenter,
      builder: (context, state) => HelpCenterPage(),
    ),
    GoRoute(
      path: Routes.myDetails,
      builder: (context, state) => MyDetailsPage(),
    ),
    GoRoute(
      path: Routes.newAddress,
      builder: (context, state) => NewAddress(),
    ),
  ],
);
