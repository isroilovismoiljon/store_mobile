import '../../../core/imports.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(onPressed: () {}, icon: SvgPicture.asset(AppIcons.backArrow)),
    );
  }

  @override
  Size get preferredSize => Size(double.infinity, 59.h);
}
