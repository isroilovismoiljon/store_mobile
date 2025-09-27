import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_mobile/core/utils/colors.dart';

class NotificationsSettingItem extends StatefulWidget {
  const NotificationsSettingItem({
    super.key, required this.title, this.valueSwitch = true,
  });

  final String title;
  final bool valueSwitch;

  @override
  State<NotificationsSettingItem> createState() => _NotificationsSettingItemState();
}

class _NotificationsSettingItemState extends State<NotificationsSettingItem> {

  bool valueSwitch = true;
  @override
  void initState() {
    valueSwitch = widget.valueSwitch;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            widget.title,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              overflow: TextOverflow.ellipsis,
            ),
            maxLines: 1,
          ),
          Transform.scale(
            scale: 0.8,
            child: Switch(
              inactiveThumbColor: AppColors.borderColor,
              inactiveTrackColor: AppColors.borderColor,
              thumbColor: WidgetStatePropertyAll(Theme.of(context).colorScheme.onPrimary),
              trackOutlineColor: WidgetStatePropertyAll(Colors.transparent),
              value: valueSwitch,
              onChanged: (value) {
                valueSwitch = value;
                setState(() {
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
