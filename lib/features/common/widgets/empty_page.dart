import 'package:store_mobile/core/imports.dart';

class EmptyPage extends StatelessWidget {
  const EmptyPage({
    super.key,
    required this.icon,
    required this.title,
    required this.subTitle,
  });

  final String icon;
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        spacing: 12.h,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 180.h),
          SvgPicture.asset(
            icon,
            width: 64.w,
            height: 64.h,
          ),
          SizedBox(
            height: 12.h,
          ),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            subTitle,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
              color: Theme.of(context).colorScheme.onSecondary,
            ),
          ),
        ],
      ),
    );
  }
}
