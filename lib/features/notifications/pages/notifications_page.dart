import 'package:flutter/material.dart';
import 'package:store_mobile/core/imports.dart';
import 'package:store_mobile/features/notifications/pages/my_app_bar.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: Padding(
        padding: EdgeInsets.fromLTRB(24.w, 24.h, 24.w, 86.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 20.h,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 16.h,
              children: [
                Text(
                  'Today',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Row(
                  spacing: 13.w,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      AppIcons.discountDuotone,
                      width: 24.w,
                      height: 24.h,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '30% Special Discount!',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          'Special promotion only valid today.',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            color: Theme.of(context).colorScheme.onSecondary
                          ),
                        ),

                      ],
                    ),
                  ],
                ),
              ],
            ),
            PreferredSize(
              preferredSize: Size.fromHeight(1.0),
              child: Container(
                color: Color(0xFFE6E6E6),
                height: 1.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
