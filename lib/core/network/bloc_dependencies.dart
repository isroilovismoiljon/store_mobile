import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_mobile/data/repositories/address_repository.dart';
import 'package:store_mobile/data/repositories/user_repository.dart';
import 'package:store_mobile/features/address/managers/address_bloc.dart';
import 'package:store_mobile/features/auth/managers/login/login_bloc.dart';
import 'package:store_mobile/features/auth/managers/register/register_bloc.dart';
import 'package:store_mobile/features/cart/managers/cart_items_bloc.dart';
import 'package:store_mobile/features/product/managers/details/product_details_bloc.dart';
import 'package:store_mobile/features/settings/managers/my_details_bloc.dart';
import '../../features/home/managers/home_bloc.dart';
import '../../features/notifications/managers/notification/notifications_bloc.dart';
import '../../features/product/managers/saved/saved_bloc.dart';

final blocDependencies = [
  BlocProvider<RegisterBloc>(
    create: (context) => RegisterBloc(authenticationRepository: context.read()),
  ),
  BlocProvider<LoginBloc>(
    create: (context) => LoginBloc(authenticationRepository: context.read()),
  ),
  BlocProvider<NotificationsBloc>(
    create: (context) => NotificationsBloc(notificationsRepository: context.read()),
  ),
  BlocProvider<ProductDetailsBloc>(
    create: (context) => ProductDetailsBloc(productRepository: context.read(), cartRepository: context.read()),
  ),
  BlocProvider<CartItemsBloc>(
    create: (context) => CartItemsBloc(cartRepository: context.read()),
  ),
  BlocProvider<MyDetailsBloc>(
    create: (context) => MyDetailsBloc(userRepository: UserRepository(client: context.read())),
  ),
  BlocProvider<AddressBloc>(
    create: (context) => AddressBloc(addressRepository: AddressRepository(client: context.read())),
  ),
];
