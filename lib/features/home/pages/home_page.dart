import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:store_mobile/features/common/widgets/my_bottom_navigation_bar.dart';
import 'package:store_mobile/features/home/managers/home_bloc.dart';
import 'package:store_mobile/features/home/managers/home_state.dart';
import 'package:store_mobile/features/home/widgets/home_product.dart';
import 'package:store_mobile/features/home/widgets/home_app_bar.dart';

import '../../../core/utils/imports.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  String formatNumber(num number) {
    final formatter = NumberFormat.decimalPattern();
    return formatter.format(number);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Scaffold(
          extendBody: true,
          body: Padding(
            padding: EdgeInsets.only(left: 24.w, right: 24.w, bottom: 86.h),
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
                      return HomeProduct(
                        id: state.products[index].id,
                        title: state.products[index].title,
                        image: state.products[index].image,
                        isLiked: state.products[index].isLiked,
                        price: state.products[index].price,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          bottomNavigationBar: MyBottomNavigationBar(),
        );
      },
    );
  }
}
