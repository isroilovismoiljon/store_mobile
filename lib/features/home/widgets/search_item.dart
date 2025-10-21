import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:store_mobile/core/utils/colors.dart';
import 'package:store_mobile/core/utils/icons.dart';
import 'package:store_mobile/core/utils/styles.dart';
import '../../../core/routing/routes.dart';
import '../../../data/models/product/product_model.dart';

class SearchItem extends StatelessWidget {
  final ProductModel product;

  const SearchItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      spacing: 12.h,
      children: [
        GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: (){
            context.push(Routes.productDetailsWithId(productId: product.id));
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                spacing: 12.w,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(6.r),
                    child: CachedNetworkImage(
                      imageUrl: product.image,
                      width: 56.w,
                      height: 53.h,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.title,
                        style: AppStyles.cartItemTitle.copyWith(fontSize: 16.sp),
                      ),
                      Text(
                        "\$ ${product.price}",
                        style: AppStyles.productDescription.copyWith(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SvgPicture.asset(
                AppIcons.arrow,
                colorFilter: ColorFilter.mode(
                  AppColors.black,
                  BlendMode.srcIn,
                ),
              ),
            ],
          ),
        ),

        Divider(color: AppColors.borderColor),
      ],
    );
  }
}
