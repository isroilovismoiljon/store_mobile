import 'package:intl/intl.dart';
import 'package:store_mobile/features/common/widgets/like.dart';

import '../../../core/utils/imports.dart';

class SavedProduct extends StatelessWidget {
  const SavedProduct({
    super.key,
    required this.id,
    required this.title,
    required this.image,
    required this.isLiked,
    required this.price,
  });

  final int id;
  final String title;
  final String image;
  final bool isLiked;
  final num price;

  String formatNumber(num number) {
    final formatter = NumberFormat.decimalPattern();
    return formatter.format(number);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(Routes.productDetailsWithId(productId: id));
      },
      child: Column(
        spacing: 6.h,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: 161.w,
            height: 122.h,
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.r),
                    child: Image.network(
                      image,
                      width: 161.w,
                      height: 122.h,
                      fit: BoxFit.cover,
                      alignment: Alignment.topCenter,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Like(
                    isLiked: isLiked,
                    id: id,
                  ),
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
                    title,
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
                    "\$ ${formatNumber(price)}",
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
      ),
    );
  }
}
