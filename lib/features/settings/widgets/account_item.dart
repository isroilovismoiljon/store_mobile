import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:store_mobile/core/utils/colors.dart';
import 'package:store_mobile/core/utils/icons.dart';
import 'package:store_mobile/core/utils/styles.dart';

class AccountItem extends StatelessWidget {
  const AccountItem({
    super.key,
    required this.mainIcon,
    required this.title,
    required this.onTap,
    this.isNextIcon = true,
    this.isLogout = false,
  });

  final String mainIcon;
  final String title;
  final bool isNextIcon;
  final bool isLogout;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.all(24.h),
        child: Row(
          spacing: 16.w,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              spacing: 16.w,
              children: [
                SvgPicture.asset(
                  mainIcon,
                  width: 24.w,
                  height: 24.h,
                  fit: BoxFit.cover,
                ),
                Text(
                  title,
                  style: AppStyles.accountItem.copyWith(
                    color: isLogout ? AppColors.red : AppColors.black,
                  ),
                ),
              ],
            ),
            isLogout
                ? SizedBox.shrink()
                : SvgPicture.asset(
                    AppIcons.chevronRight,
                    width: 24.w,
                    height: 24.h,
                    fit: BoxFit.cover,
                  ),
          ],
        ),
      ),
    );
  }
}
