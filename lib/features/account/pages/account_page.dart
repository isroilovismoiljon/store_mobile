import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:store_mobile/core/routing/routes.dart';
import 'package:store_mobile/core/utils/colors.dart';
import 'package:store_mobile/core/utils/icons.dart';
import 'package:store_mobile/features/account/widgets/big_divider.dart';
import 'package:store_mobile/features/account/widgets/account_item.dart';
import 'package:store_mobile/features/common/widgets/app_bar/my_app_bar.dart';
import 'package:store_mobile/features/common/widgets/my_bottom_navigation_bar.dart';

import '../../common/widgets/dialog/warning_dialog.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: 'Account',
        isHaveBottomLine: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            AccountItem(
              mainIcon: AppIcons.box,
              title: 'My Orders',
              onTap: () {},
            ),
            BigDivider(),
            AccountItem(
              mainIcon: AppIcons.details,
              title: 'My Details',
              onTap: () {},
            ),
            Divider(
              color: AppColors.borderColor,
            ),
            AccountItem(
              mainIcon: AppIcons.address,
              title: 'Address Book',
              onTap: () {},
            ),
            Divider(
              color: AppColors.borderColor,
            ),
            AccountItem(
              mainIcon: AppIcons.card,
              title: 'Payment Methods',
              onTap: () {},
            ),
            Divider(
              color: AppColors.borderColor,
            ),
            AccountItem(
              mainIcon: AppIcons.bell,
              title: 'Notifications',
              onTap: () {
                context.push(Routes.notificationsSettings);
              },
            ),
            BigDivider(),
            AccountItem(
              mainIcon: AppIcons.question,
              title: 'FAQs',
              onTap: () {},
            ),
            Divider(
              color: AppColors.borderColor,
            ),
            AccountItem(
              mainIcon: AppIcons.headphones,
              title: 'Help Center',
              onTap: () {},
            ),
            BigDivider(),
            AccountItem(
              mainIcon: AppIcons.logout,
              title: 'Logout',
              isLogout: true,
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => WarningDialog(
                    title: 'Logout?',
                    subTitle: 'Are you sure you want to logout?',
                    buttonText: 'Yes, Logout',
                  ),
                );
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: MyBottomNavigationBar(),
    );
  }
}
