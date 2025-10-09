import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:store_mobile/core/utils/icons.dart';
import 'package:store_mobile/core/utils/imports.dart';
import 'package:store_mobile/features/common/widgets/my_app_bar.dart';
import '../../../core/constants/status.dart';
import '../../../core/utils/colors.dart';
import '../../../core/utils/styles.dart';
import '../managers/address_bloc.dart';
import '../managers/address_event.dart';
import '../managers/address_state.dart';

class AddressPage extends StatelessWidget {
  const AddressPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: 'Address'),
      body: Padding(
        padding: EdgeInsets.fromLTRB(24.w, 20.h, 25.w, 0),
        child: Column(
          spacing: 14.h,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Saved Address', style: AppStyles.rating),
            Expanded(
              child: BlocBuilder<AddressBloc, AddressState>(
                builder: (context, state) {
                  return state.addressStatus == Status.loading
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : ListView(
                          physics: const BouncingScrollPhysics(),
                          children: [
                            ...List.generate(state.addresses.length, (index) {
                              final address = state.addresses[index];
                              return Container(
                                margin: EdgeInsets.only(bottom: 12.h),
                                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.r),
                                  border: Border.all(
                                    color: AppColors.borderColor,
                                    width: state.selectedIndex == index ? 1.5 : 1,
                                  ),
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(AppIcons.location),
                                    SizedBox(width: 14.w),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Text(address.title, style: AppStyles.cartItemTitle),
                                              if (address.isDefault) ...[
                                                SizedBox(width: 6.w),
                                                Container(
                                                  padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
                                                  decoration: BoxDecoration(
                                                    color: AppColors.borderColor,
                                                    borderRadius: BorderRadius.circular(4.r),
                                                  ),
                                                  child: Text(
                                                    'Default',
                                                    style: AppStyles.rating.copyWith(fontSize: 10),
                                                  ),
                                                ),
                                              ],
                                            ],
                                          ),
                                          SizedBox(height: 4.h),
                                          Text(
                                            address.fullAddress,
                                            style: AppStyles.cartItemTitle.copyWith(
                                              color: Theme.of(context).colorScheme.onSecondary,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Radio<int>(
                                      value: index,
                                      groupValue: state.selectedIndex,
                                      activeColor: AppColors.black,
                                      onChanged: (value) {
                                        context.read<AddressBloc>().add(SelectAddressEvent(value ?? 0));
                                      },
                                    ),
                                  ],
                                ),
                              );
                            }),
                            SizedBox(height: 15.h),
                            CustomButton(
                              title: 'Add New Address',
                              onPressed: () {
                                context.push(Routes.newAddress);
                              },
                              isRightIcon: false,
                              icon: AppIcons.plus,
                              textColor: Theme.of(context).colorScheme.primary,
                              buttonColor: Theme.of(context).colorScheme.onPrimary,
                            ),
                            SizedBox(height: 40.h),
                          ],
                        );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.fromLTRB(24.w, 10.h, 24.w, 15.h),
        child: SafeArea(
          child: CustomButton(title: 'Apply', onPressed: (){

            context.pop();
          }),
        ),
      ),
    );
  }
}
