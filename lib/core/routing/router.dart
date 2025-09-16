import '../../../core/imports.dart';

GoRouter router = GoRouter(
  initialLocation: Routes.home,
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
    GoRoute(path: Routes.login,
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
      GoRoute(path: Routes.forgotPassword,
        builder: (context, state) => ForgotPasswordPage(),
      ),
      GoRoute(path: Routes.enterOtp,
        builder: (context, state) => EnterOtpPage(),
      ),
      GoRoute(path: Routes.resetPassword,
        builder: (context, state) => ResetPasswordPage(),
      ),
    ]),
  ],
);
