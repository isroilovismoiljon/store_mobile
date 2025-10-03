class Routes {
  static const splash = '/splash';
  static const home = '/home';
  static const signUp = '/sign-up';
  static const login = '/login';
  static const forgotPassword = '/forgot-password';
  static const enterOtp = '/enter-otp';
  static const resetPassword = '/reset-password';
  static const notifications = '/notifications';
  static const saved = '/saved';
  static const productDetails = '/product-details/:id';

  static String productDetailsWithId({required int productId}) => '/product-details/$productId';
  static const myCart = '/my-cart';
  static const account = '/account';
  static const checkout = '/checkout';
  static const address = '/address';
  static const paymentMethod = '/payment-method';
  static const newCard = '/new-card';
  static const helpCenter = '/help-center';
  static const notificationsSettings = '/notifications-settings';
  static const myDetails = '/my-details';
}
