import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:store_mobile/features/common/widgets/bottom_nav_bar/my_bottom_navigation_bar.dart';
import 'package:store_mobile/features/home/managers/home_cubit.dart';
import 'package:store_mobile/features/home/managers/home_state.dart';
import 'package:store_mobile/features/common/widgets/product.dart';
import 'package:store_mobile/features/home/widgets/home_app_bar.dart';

import '../../../core/imports.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  String formatNumber(num number) {
    final formatter = NumberFormat.decimalPattern();
    return formatter.format(number);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(
        categoryRepository: context.read(),
        productRepository: context.read(),
      ),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return Scaffold(
            extendBody: true,
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: CustomScrollView(
                slivers: [
                  HomeAppBar(
                    state: state,
                  ),
                  SliverGrid(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisExtent: 224.h,
                      mainAxisSpacing: 20.h,
                      crossAxisSpacing: 19.w,
                      childAspectRatio: 0.87,
                      crossAxisCount: 2,
                    ),
                    delegate: SliverChildBuilderDelegate(
                      childCount: state.products.length,
                      (BuildContext context, int index) {
                        return Product(state: state, index: index,);
                      },
                    ),
                  ),
                ],
              ),
            ),
            bottomNavigationBar: MyBottomNavigationBar(),
          );
        },
      ),
    );
  }
}
