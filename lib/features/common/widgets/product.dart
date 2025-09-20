import 'package:intl/intl.dart';
import 'package:store_mobile/features/common/widgets/like.dart';
import 'package:store_mobile/features/home/managers/home_state.dart';

import '../../../core/imports.dart';

class Product extends StatelessWidget {
  const Product({
    super.key,
    required this.state,
    required this.index,
  });

  final HomeState state;
  final int index;

  String formatNumber(num number) {
    final formatter = NumberFormat.decimalPattern();
    return formatter.format(number);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 6.h,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          width: 161.w,
          height: 174.h,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.r),
                  child: Image.network(
                    state.products[index].image,
                    width: 161.w,
                    height: 174.h,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Like(),
              ),
            ],
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
  }
}
