import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_mobile/features/home/managers/home_cubit.dart';
import 'package:store_mobile/features/home/managers/home_state.dart';
import 'package:store_mobile/features/home/pages/app_bar_header.dart';
import 'package:store_mobile/features/home/pages/search_and_sort.dart';

import '../../../core/imports.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(categoryRepository: context.read()),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return Scaffold(
            body: CustomScrollView(
              slivers: [
                SliverAppBar(
                  toolbarHeight: 220.h,
                  actionsPadding: EdgeInsets.only(right: 25.w),
                  title: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25.w),
                    child: Column(
                      spacing: 16.h,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppBarHeader(),
                        SearchAndSort(),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            spacing: 8.w,
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(
                                  vertical: 7.h,
                                  horizontal: 20.w,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.r),
                                  border: Border.all(color: AppColors.primary500.withValues(alpha: 0.2)),
                                ),
                                child: Text(
                                  'All',
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              ...List.generate(
                                state.categories.length,
                                (index) {
                                  return Container(
                                    padding: EdgeInsets.symmetric(
                                      vertical: 7.h,
                                      horizontal: 20.w,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.r),
                                      border: Border.all(color: AppColors.primary500.withValues(alpha: 0.2)),
                                    ),
                                    child: Text(
                                      state.categories[index].title,
                                      style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
