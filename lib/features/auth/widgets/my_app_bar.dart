import '../../../core/utils/imports.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      scrolledUnderElevation: 0,
      elevation: 0,
      leading: IconButton(onPressed: () {
        context.pop();
      }, icon: SvgPicture.asset(AppIcons.backArrow)),
    );
  }

  @override
  Size get preferredSize => Size(double.infinity, 59.h);
}
