import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_mobile/core/imports.dart';
import 'package:store_mobile/features/common/widgets/bottom_nav_bar/my_bottom_navigation_bar.dart';
import 'package:store_mobile/features/common/widgets/empty_page.dart';

import '../../auth/pages/my_app_bar.dart';

class SavedPage extends StatelessWidget {
  const SavedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(24.w, 24.h, 24.w, 86.h),
          child: EmptyPage(
            icon: AppIcons.heartDuotone,
            title: 'No Saved Items!',
            subTitle: "You don’t have any saved items.\nGo to home and add some.",
          ),
        ),
      ),
      bottomNavigationBar: MyBottomNavigationBar(),
    );
  }
}
