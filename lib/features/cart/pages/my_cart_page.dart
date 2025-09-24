import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:store_mobile/core/constants/status.dart';
import 'package:store_mobile/core/utils/colors.dart';
import 'package:store_mobile/core/utils/icons.dart';
import 'package:store_mobile/core/utils/imports.dart';
import 'package:store_mobile/core/utils/styles.dart';
import 'package:store_mobile/features/cart/managers/cart_items_bloc.dart';
import 'package:store_mobile/features/cart/managers/cart_items_event.dart';
import 'package:store_mobile/features/cart/managers/cart_items_state.dart';
import 'package:store_mobile/features/cart/widgets/cart_item.dart';
import 'package:store_mobile/features/common/widgets/app_bar/my_app_bar.dart';
import 'package:store_mobile/features/common/widgets/empty_page.dart';
import 'package:store_mobile/features/common/widgets/my_bottom_navigation_bar.dart';

class MyCartPage extends StatelessWidget {
  const MyCartPage({super.key});

  String formatNumber(num number) {
    final formatter = NumberFormat.decimalPattern();
    return "\$ ${formatter.format(number)}";
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartItemsBloc, CartItemsState>(
      builder: (context, state) => state.statusCartItem == Status.loading
          ? Center(child: CircularProgressIndicator())
          : Scaffold(
              extendBody: true,
              appBar: MyAppBar(
                title: 'My Cart',
                isHaveBottomLine: state.cartItems == null,
              ),
              body: Padding(
                padding: EdgeInsets.only(left: 24.w, right: 24.w, bottom: 14.h),
                child: RefreshIndicator(
                  onRefresh: () async {
                    context.read<CartItemsBloc>().add(CartEventGetMyCartItems());
                  },
                  child: SingleChildScrollView(
                    child: state.cartItems == null
                        ? EmptyPage(
                            icon: AppIcons.cart,
                            title: 'Your Cart Is Empty!',
                            subTitle: 'When you add products, they’ll\nappear here.',
                          )
                        : Column(
                            spacing: 14.h,
                            children: [
                              ...List.generate(
                                state.cartItems!.items.length,
                                (index) {
                                  return CartItem(
                                    state: state,
                                    index: index,
                                  );
                                },
                              ),
                              Column(
                                spacing: 15.h,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Sub-total',
                                        style: AppStyles.productDescription,
                                      ),
                                      Text(
                                        formatNumber(state.cartItems!.subTotal),
                                        style: AppStyles.rating,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'VAT (%)',
                                        style: AppStyles.productDescription,
                                      ),
                                      Text(
                                        formatNumber(state.cartItems!.vat),
                                        style: AppStyles.rating,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Shipping fee',
                                        style: AppStyles.productDescription,
                                      ),
                                      Text(
                                        formatNumber(state.cartItems!.shippingFee),
                                        style: AppStyles.rating,
                                      ),
                                    ],
                                  ),
                                  Divider(
                                    color: AppColors.borderColor,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Total',
                                        style: AppStyles.rating.copyWith(fontWeight: FontWeight.w400),
                                      ),
                                      Text(
                                        formatNumber(state.cartItems!.shippingFee),
                                        style: AppStyles.rating.copyWith(fontWeight: FontWeight.w600),
                                      ),
                                    ],
                                  ),
                                  CustomButton(
                                    title: 'Go To Checkout',
                                    onPressed: () {},
                                    icon: AppIcons.rightArrow,
                                  ),
                                ],
                              ),
                            ],
                          ),
                  ),
                ),
              ),
              bottomNavigationBar: MyBottomNavigationBar(),
            ),
    );
  }
}
