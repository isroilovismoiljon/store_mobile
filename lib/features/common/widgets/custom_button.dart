import '../../../core/utils/imports.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.title,
    this.icon,
    this.buttonColor = Colors.black,
    this.textColor = Colors.white,
    required this.onPressed,
    this.isRightIcon = true,
  });

  final String title;
  final String? icon;
  final Color buttonColor;
  final Color textColor;
  final VoidCallback onPressed;
  final bool isRightIcon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 54.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          color: buttonColor,
          border: BoxBorder.all(color: Color(0xFFCCCCCC)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 10.w,
          children: [
            if (icon != null && !isRightIcon)
              SizedBox(
                width: 24.w,
                height: 24.h,
                child: SvgPicture.asset(
                  icon!,
                ),
              ),
            Text(
              title,
              style: TextStyle(
                color: textColor,
                fontSize: 15.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            if (icon != null && isRightIcon)
              SizedBox(
                width: 24.w,
                height: 24.h,
                child: SvgPicture.asset(
                  icon!,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
