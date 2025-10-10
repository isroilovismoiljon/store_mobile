import '../../../../core/utils/imports.dart';

class SuccessDialog extends StatelessWidget {
  const SuccessDialog({
    super.key,
    required this.title,
    required this.subTitle,
    required this.buttonText,
    required this.buttonRouteName,
  });

  final String title;
  final String subTitle;
  final String buttonText;
  final String buttonRouteName;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Padding(
        padding: EdgeInsets.all(24.r),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              AppIcons.correct,
              width: 78.w,
              height: 78.h,
            ),
            SizedBox(height: 12.h),
            Text(
              title,
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 20.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              subTitle,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: 20.h),
            CustomButton(
              title: buttonText,
              onPressed: () {
                context.go(buttonRouteName);
              },
            ),
          ],
        ),
      ),
    );
  }
}
