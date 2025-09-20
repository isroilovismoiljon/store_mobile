import 'package:store_mobile/features/home/managers/home_cubit.dart';
import 'package:store_mobile/features/home/managers/home_state.dart';
import 'package:store_mobile/features/home/widgets/app_bar_header.dart';
import 'package:store_mobile/features/home/widgets/search_and_sort.dart';

import '../../../core/imports.dart';

class HomeAppBar extends StatefulWidget {
  const HomeAppBar({
    super.key,
    required this.state,
  });

  final HomeState state;

  @override
  State<HomeAppBar> createState() => _HomeAppBarState();
}

class _HomeAppBarState extends State<HomeAppBar> {
  int selectedCategoryId = 0;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      scrolledUnderElevation: 0,
      elevation: 0,
      toolbarHeight: 211.h,
      actionsPadding: EdgeInsets.only(right: 25.w),
      title: Column(
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
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedCategoryId = 0;
                      context.read<HomeCubit>().getProducts({});
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      vertical: 7.h,
                      horizontal: 20.w,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      border: Border.all(color: AppColors.primary500.withValues(alpha: 0.2)),
                      color: selectedCategoryId == 0
                          ? Theme.of(context).colorScheme.primary
                          : Theme.of(context).colorScheme.onPrimary,
                    ),
                    child: Text(
                      'All',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: selectedCategoryId == 0
                            ? Theme.of(context).colorScheme.onPrimary
                            : Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ),
                ),
                ...List.generate(
                  widget.state.categories.length,
                  (index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedCategoryId = widget.state.categories[index].id;
                          context.read<HomeCubit>().getProducts({'CategoryId': selectedCategoryId});
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 7.h,
                          horizontal: 20.w,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          border: Border.all(color: AppColors.primary500.withValues(alpha: 0.2)),
                          color: selectedCategoryId == widget.state.categories[index].id
                              ? Theme.of(context).colorScheme.primary
                              : Theme.of(context).colorScheme.onPrimary,
                        ),
                        child: Text(
                          widget.state.categories[index].title,
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                            color: selectedCategoryId == widget.state.categories[index].id
                                ? Theme.of(context).colorScheme.onPrimary
                                : Theme.of(context).colorScheme.primary,
                          ),
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
    );
  }
}
