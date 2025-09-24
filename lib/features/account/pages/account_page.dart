import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_mobile/core/utils/colors.dart';
import 'package:store_mobile/core/utils/icons.dart';
import 'package:store_mobile/features/account/pages/account_item.dart';
import 'package:store_mobile/features/common/widgets/app_bar/my_app_bar.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: 'Account',
        isHaveBottomLine: true,
      ),
      body: Column(
        children: [
          AccountItem(mainIcon: AppIcons.box, title: 'My Orders', isDivider: false,),
          Divider(color: AppColors.borderColor, height: 8.h,),
        ],
      ),
    );
  }
}
