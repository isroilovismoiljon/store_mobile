import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_mobile/features/common/widgets/my_app_bar.dart';
import 'package:store_mobile/features/common/widgets/my_bottom_navigation_bar.dart';
import 'package:store_mobile/features/settings/widgets/notifications_setting_item.dart';

import '../../../core/utils/colors.dart';

class NotificationsSetPage extends StatelessWidget {
  const NotificationsSetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: 'Notifications'),
      body: Padding(
        padding: EdgeInsets.only(right: 24.w, left: 24.w, top: 4.h),
        child: Column(
          children: [
            NotificationsSettingItem(title: 'General Notifications',),
            Divider(
              color: AppColors.borderColor,
            ),
            NotificationsSettingItem(title: 'Sound',),
            Divider(
              color: AppColors.borderColor,
            ),
            NotificationsSettingItem(title: 'Vibrate', valueSwitch: false,),
          ],
        ),
      ),
      bottomNavigationBar: MyBottomNavigationBar(),
    );
  }
}
