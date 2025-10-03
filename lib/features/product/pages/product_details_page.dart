import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:store_mobile/core/constants/status.dart';
import 'package:store_mobile/core/utils/colors.dart';
import 'package:store_mobile/core/utils/icons.dart';
import 'package:store_mobile/features/common/widgets/my_app_bar.dart';
import 'package:store_mobile/features/common/widgets/like.dart';
import 'package:store_mobile/features/product/managers/details/product_details_bloc.dart';
import 'package:store_mobile/features/product/managers/details/product_details_event.dart';
import 'package:store_mobile/features/product/managers/details/product_details_state.dart';
import '../../../core/utils/styles.dart';
import '../../home/managers/home_bloc.dart';
import '../../home/managers/home_event.dart';

class ProductDetailsPage extends StatefulWidget {
  const ProductDetailsPage({super.key, required this.id});
  final int id;

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  String formatCurrency(num value) {
    final formatter = NumberFormat.currency(
      locale: 'en_US',
      symbol: '\$ ',
      decimalDigits: 0,
    );
    return formatter.format(value);
  }

  double roundToSingleDecimal(num value) {
    return double.parse(value.toStringAsFixed(1));
  }

  int? selectedSizeId;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductDetailsBloc, ProductDetailsState>(
      builder: (context, state) {
        return state.statusProductDetails == Status.loading
            ? Scaffold(body: Center(child: CircularProgressIndicator()))
            : Scaffold(
                appBar: MyAppBar(
                  title: 'Details',
                ),
                body: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Column(
                    spacing: 12.h,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10.r),
                            child: Image.network(
                              state.productDetails!.productImages[0].image,
                              width: double.infinity,
                              height: 369.h,
                              fit: BoxFit.cover,
                              alignment: Alignment.topCenter,
                            ),
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child: Like(
                              isLiked: state.productDetails!.isLiked,
                              id: widget.id,
                              containerSize: 48,
                              iconSize: 25,
                              onTap: () {
                                if (state.productDetails!.isLiked) {
                                  context.read<ProductDetailsBloc>().add(ProductDetailsUnSaveProduct(id: widget.id));
                                } else {
                                  context.read<ProductDetailsBloc>().add(ProductDetailsSaveProduct(id: widget.id));
                                }
                                context.read<HomeBloc>().add(HomeEventGetProducts());
                                setState(() {});
                              },
                            ),
                          ),
                        ],
                      ),
                      Text(
                        state.productDetails!.title,
                        style: AppStyles.appBarTitle,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
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
                            '${roundToSingleDecimal(state.productDetails!.rating)}/5',
                            style: AppStyles.rating,
                          ),
                          Text(
                            '(${state.productDetails!.reviewsCount} reviews)',
                            style: AppStyles.reviews,
                          ),
                        ],
                      ),
                      Text(
                        state.productDetails!.description,
                        style: AppStyles.productDescription,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                      ),
                      Text(
                        'Choose size',
                        style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600),
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          spacing: 10.w,
                          children: [
                            ...List.generate(
                              state.productDetails!.productSizes.length,
                              (index) {
                                return GestureDetector(
                                  onTap: () {
                                    selectedSizeId = state.productDetails!.productSizes[index].id;
                                    setState(() {});
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    width: 50.w,
                                    height: 47.h,
                                    decoration: BoxDecoration(
                                      color: selectedSizeId == state.productDetails!.productSizes[index].id
                                        ? Theme.of(context).colorScheme.primary
                                        : Theme.of(context).colorScheme.onPrimary,
                                      borderRadius: BorderRadius.circular(10.r),
                                      border: Border.all(color: AppColors.borderColor),
                                    ),
                                    child: Text(
                                      state.productDetails!.productSizes[index].title,
                                      style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w500,
                                        color: selectedSizeId == state.productDetails!.productSizes[index].id
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
                            formatCurrency(state.productDetails!.price),
                            style: AppStyles.appBarTitle,
                          ),
                        ],
                      ),
                      GestureDetector(
                        onTap: () {
                          if (selectedSizeId == null) {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return Center(
                                  child: Container(
                                    alignment: Alignment.center,
                                    margin: EdgeInsets.symmetric(horizontal: 24.w),
                                    decoration: BoxDecoration(color: Theme.of(context).colorScheme.onPrimary),
                                    padding: EdgeInsets.all(15.r),
                                    constraints: BoxConstraints(minHeight: 100.h, maxWidth: 300.h),
                                    child: Text(
                                      "O'zingizga mos o'lchamlardan birini tanlang!",
                                      style: TextStyle(
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.red,
                                      ),
                                    ),
                                  ),
                                );
                              },
                            );
                            return;
                          }
                          context.read<ProductDetailsBloc>().add(
                            ProductDetailsAddToCartProduct(productId: state.productDetails!.id, sizeId: selectedSizeId!),
                          );
                          showDialog(
                            context: context,
                            builder: (context) {
                              return Center(
                                child: Container(
                                  alignment: Alignment.center,
                                  margin: EdgeInsets.symmetric(horizontal: 24.w),
                                  decoration: BoxDecoration(color: Theme.of(context).colorScheme.onPrimary),
                                  padding: EdgeInsets.all(15.r),
                                  constraints: BoxConstraints(minHeight: 100.h, maxWidth: 300.h),
                                  child: Text(
                                    "Maxsulot savatga qo'shildi!",
                                    style: TextStyle(
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.green,
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        },
                        child: Container(
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
                      ),
                    ],
                  ),
                ),
              );
      },
    );
  }
}
