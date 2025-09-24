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
    this.isNextIcon = true,
    this.isDivider = true,
  });

  final String mainIcon;
  final String title;
  final bool isNextIcon;
  final bool isDivider;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80.h,
      child: Padding(
        padding: EdgeInsets.only(right: 24.w, left: 24.w, top: 24.h),
        child: Row(
          spacing: 16.w,
          children: [
            SvgPicture.asset(
              mainIcon,
              width: 24.w,
              height: 24.h,
              fit: BoxFit.cover,
            ),
            Column(
              spacing: 24.h,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style: AppStyles.accountItem,
                    ),
                    SvgPicture.asset(
                      AppIcons.chevronRight,
                      width: 24.w,
                      height: 24.h,
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
                Divider(
                  color: isDivider ?AppColors.borderColor :null,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
