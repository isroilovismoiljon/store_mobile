import '../../../core/utils/imports.dart';

class AppBarHeader extends StatelessWidget {
  const AppBarHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Discover',
          style: TextStyle(
            fontSize: 32.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: GestureDetector(
            onTap: (){
              context.push(Routes.notifications);
            },
            child: SvgPicture.asset(
              AppIcons.bell,
              width: 24.w,
              height: 24.h,
            ),
          ),
        ),
      ],
    );
  }
}
