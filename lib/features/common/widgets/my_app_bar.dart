import 'package:store_mobile/core/utils/imports.dart';
import 'package:store_mobile/core/utils/styles.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({
    super.key,
    this.isHaveBottomLine = true,
    required this.title,
  });

  final bool isHaveBottomLine;
  final String title;

  @override
  Size get preferredSize => Size(double.infinity, 80.h);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      scrolledUnderElevation: 0,
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
      leadingWidth: 70,
      title: Text(title, style: AppStyles.appBarTitle),
      centerTitle: true,
      bottom: isHaveBottomLine
          ? PreferredSize(
              preferredSize: Size.fromHeight(1.0),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Container(
                  color: Color(0xFFE6E6E6),
                  height: 1.0,
                ),
              ),
            )
          : null,
      actionsPadding: EdgeInsets.only(right: 24.w),
      actions: [
        GestureDetector(
          onTap: () {
            context.push(Routes.notifications);
          },
          child: SvgPicture.asset(
            AppIcons.bell,
            width: 24.w,
            height: 24.h,
          ),
        ),
      ],
    );
  }
}
