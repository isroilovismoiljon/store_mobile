import 'package:store_mobile/core/imports.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({
    super.key,
  });

  @override
  Size get preferredSize => Size(double.infinity, 80.h);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: () {
          context.pop();
        },
        icon: SvgPicture.asset(
          AppIcons.backArrow,
          width: 19.w,
          height: 16.h,
        ),
      ),
      leadingWidth: 100,
      title: Text(
        'Notifications',
        style: TextStyle(
          fontSize: 24.sp,
          fontWeight: FontWeight.w600,
        ),
      ),
      centerTitle: true,
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(1.0),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Container(
            color: Color(0xFFE6E6E6),
            height: 1.0,
          ),
        ),
      ),
    );
  }

}
