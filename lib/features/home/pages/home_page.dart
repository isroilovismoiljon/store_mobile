import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_mobile/features/home/managers/home_cubit.dart';
import 'package:store_mobile/features/home/managers/home_state.dart';
import 'package:store_mobile/features/home/widgets/home_app_bar.dart';
import 'package:intl/intl.dart';
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
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: CustomScrollView(
                slivers: [
                  HomeAppBar(state: state,),
                  SliverGrid(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisExtent: 224.h,
                      mainAxisSpacing: 20.h,
                      crossAxisSpacing: 19.w,
                      childAspectRatio: 0.87,
                      crossAxisCount: 2
                    ),
                    delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                        return Column(
                          spacing: 6.h,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10.r),
                              child: Image.network(
                                state.products[index].image,
                                width: 161.w,
                                height: 174.h,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Expanded(
                              child: SizedBox(
                                width: 161.w,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  spacing: 3.h,
                                  children: [
                                    Text(
                                      state.products[index].title,
                                      maxLines: 1,
                                      style: TextStyle(
                                        color: Theme.of(context).colorScheme.primary,
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w600,
                                        height: 1.3.h,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    Text(
                                      "\$ ${formatNumber(state.products[index].price)}",
                                      maxLines: 1,
                                      style: TextStyle(
                                        color: Theme.of(context).colorScheme.onSecondary,
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w500,
                                        height: 1.2.h,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                      childCount: state.products.length,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
