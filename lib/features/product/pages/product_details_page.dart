import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:store_mobile/core/utils/colors.dart';
import 'package:store_mobile/core/utils/icons.dart';
import 'package:store_mobile/features/common/widgets/app_bar/my_app_bar.dart';
import 'package:store_mobile/features/product/managers/details/product_details_bloc.dart';
import 'package:store_mobile/features/product/managers/details/product_details_state.dart';

import '../../../core/utils/styles.dart';

class ProductDetailsPage extends StatelessWidget {
  const ProductDetailsPage({super.key, required this.id});

  final int id;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductDetailsBloc, ProductDetailsState>(
      builder: (context, state) {
        return Scaffold(
          appBar: MyAppBar(
            title: 'Details',
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              spacing: 12.h,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10.r),
                  child: Image.network(
                    'https://i.pinimg.com/736x/75/10/e8/7510e85492a60e5782c54d769524021d.jpg',
                    width: double.infinity,
                    height: 369.h,
                    fit: BoxFit.cover,
                    alignment: Alignment.topCenter,
                  ),
                ),
                Text(
                  'Regular Fit Slogan',
                  style: AppStyles.appBarTitle,
                  overflow: TextOverflow.ellipsis,
                ),
                Row(
                  spacing: 2.w,
                  children: [
                    SvgPicture.asset(
                      AppIcons.star,
                      width: 19.w,
                      height: 18.h,
                    ),
                    Text(
                      '4.0/5',
                      style: AppStyles.rating,
                    ),
                    Text(
                      '(45 reviews)',
                      style: AppStyles.reviews,
                    ),
                  ],
                ),
                Text(
                  'The name says it all, the right size slightly snugs the body leaving enough room for comfort in the sleeves and waist.',
                  style: AppStyles.productDescription,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                ),
                Text(
                  'Choose size',
                  style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600),
                ),
                Row(
                  spacing: 10.w,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      width: 50.w,
                      height: 47.h,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.onPrimary,
                        borderRadius: BorderRadius.circular(10.r),
                        border: Border.all(color: AppColors.borderColor),
                      ),
                      child: Text(
                        'S',
                        style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w500),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: 50.w,
                      height: 47.h,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.onPrimary,
                        borderRadius: BorderRadius.circular(10.r),
                        border: Border.all(color: Color(0xFFE6E6E6)),
                      ),
                      child: Text(
                        'M',
                        style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w500),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: 50.w,
                      height: 47.h,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.onPrimary,
                        borderRadius: BorderRadius.circular(10.r),
                        border: Border.all(color: AppColors.borderColor),
                      ),
                      child: Text(
                        'L',
                        style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          bottomNavigationBar: Container(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
            width: double.infinity,
            height: 105.h,
            decoration: BoxDecoration(border: Border.all(color: AppColors.borderColor)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Price',
                      style: AppStyles.productDescription,
                    ),
                    Text(
                      '\$ 1,190',
                      style: AppStyles.appBarTitle,
                    ),
                  ],
                ),
                Container(
                  alignment: Alignment.center,
                  width: 240.w,
                  height: 54.h,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 10.w,
                    children: [
                      SvgPicture.asset(
                        AppIcons.bag,
                        width: 24.w,
                        height: 24.h,
                      ),
                      Text(
                        'Add to Cart',
                        style: AppStyles.rating.copyWith(color: Theme.of(context).colorScheme.onPrimary),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }
    );
  }
}
