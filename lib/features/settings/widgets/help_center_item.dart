import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:store_mobile/core/utils/colors.dart';
import 'package:store_mobile/core/utils/icons.dart';
import 'package:store_mobile/core/utils/styles.dart';

class HelpCenterItem extends StatelessWidget {
  const HelpCenterItem({
    super.key, required this.title, required this.icon, required this.onTap,
  });

  final String title;
  final String icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(10.r),
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 20.w),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(color: AppColors.borderColor),
        ),
        child: Row(
          spacing: 12.w,
          children: [
            SvgPicture.asset(icon),
            Text(
              title,
              style: AppStyles.rating,
            ),
          ],
        ),
      ),
    );
  }
}
