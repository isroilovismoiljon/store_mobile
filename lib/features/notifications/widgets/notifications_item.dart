import 'package:flutter/material.dart';
import 'package:store_mobile/core/constants/status.dart';
import 'package:store_mobile/core/utils/imports.dart';

import '../managers/notification/notifications_state.dart';

class NotificationsItem extends StatelessWidget {
  const NotificationsItem({
    super.key, required this.state, required this.index,
  });

  final NotificationsState state;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 20.h,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 16.h,
          children: [
            state.status == Status.loading
                ? Center(child: CircularProgressIndicator())
                : Text(
                    state.status == Status.success
                        ? state.notifications[index].date.toString().split(' ')[0]
                        : state.status == Status.error
                        ? 'Dasturda qandaydir xatolik bor!'
                        : 'Nimadir netoda...',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
            Row(
              spacing: 13.w,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.network(
                  state.notifications[index].icon,
                  width: 24.w,
                  height: 24.h,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      state.notifications[index].title,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      state.notifications[index].content,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        color: Theme.of(context).colorScheme.onSecondary,
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
            margin: EdgeInsets.only(bottom: 20.h),
          ),
        ),
      ],
    );
  }
}
