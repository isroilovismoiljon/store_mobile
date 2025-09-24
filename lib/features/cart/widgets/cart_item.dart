import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:store_mobile/core/utils/colors.dart';
import 'package:store_mobile/core/utils/icons.dart';
import 'package:store_mobile/core/utils/styles.dart';
import 'package:store_mobile/features/cart/managers/cart_items_state.dart';

class CartItem extends StatelessWidget {
  const CartItem({
    super.key, required this.state, required this.index,
  });

  final CartItemsState state;
  final int index;

  String formatNumber(num number) {
    final formatter = NumberFormat.decimalPattern();
    return "\$ ${formatter.format(number)}";
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 15.w),
      width: double.infinity,
      constraints: BoxConstraints(minHeight: 107.h, minWidth: 342.w),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.borderColor),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Row(
        spacing: 16.w,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(4.r),
            child: Image.network(
              state.cartItems!.items[index].image,
              width: 83.w,
              height: 79.h,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            width: 240.w,
            height: 80.h,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          state.cartItems!.items[index].title,
                          style: AppStyles.cartItemTitle,
                          overflow: TextOverflow.ellipsis,
                        ),
                        InkWell(
                          onTap: () {},
                          child: SvgPicture.asset(
                            AppIcons.trash,
                            width: 16.w,
                            height: 16.h,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      'Size ${state.cartItems!.items[index].size}',
                      style: AppStyles.cartItemSize,
                    ),
                  ],
                ),
                Row(
                  spacing: 20,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      formatNumber(state.cartItems!.items[index].price),
                      style: AppStyles.cartItemTitle,
                    ),
                    Row(
                      spacing: 9.w,
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            width: 24.w,
                            height: 24.h,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.onPrimary,
                              border: Border.all(color: AppColors.borderColor),
                            ),
                            child: SvgPicture.asset(
                              AppIcons.minus,
                            ),
                          ),
                        ),
                        Text(
                          state.cartItems!.items[index].quantity.toString(),
                          style: AppStyles.cartItemSize,
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            width: 24.w,
                            height: 24.h,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.onPrimary,
                              border: Border.all(color: AppColors.borderColor),
                            ),
                            child: SvgPicture.asset(
                              AppIcons.plus,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
