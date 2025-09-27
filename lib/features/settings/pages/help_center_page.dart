import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_mobile/core/utils/icons.dart';
import 'package:store_mobile/features/common/widgets/app_bar/my_app_bar.dart';
import 'package:store_mobile/features/common/widgets/my_bottom_navigation_bar.dart';
import 'package:store_mobile/features/settings/pages/help_center_item.dart';

class HelpCenterPage extends StatelessWidget {
  const HelpCenterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: 'HelpCenter'),
      body: Padding(
        padding: EdgeInsets.all(24.r),
        child: Column(
          spacing: 14.h,
          children: [
            HelpCenterItem(title: 'Custom Service', icon: AppIcons.headphones, onTap: () {  },),
            HelpCenterItem(title: 'Whatsapp', icon: AppIcons.whatsapp, onTap: () {  },),
            HelpCenterItem(title: 'Website', icon: AppIcons.web, onTap: () {  },),
            HelpCenterItem(title: 'Facebook', icon: AppIcons.facebook, onTap: () {  },),
            HelpCenterItem(title: 'Twitter', icon: AppIcons.twitter, onTap: () {  },),
            HelpCenterItem(title: 'Instagram', icon: AppIcons.instagram, onTap: () {  },),
          ],
        ),
      ),
      bottomNavigationBar: MyBottomNavigationBar(),
    );
  }
}
