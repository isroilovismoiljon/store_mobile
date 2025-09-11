import '../../../../core/core.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.title,
    this.icon,
    this.buttonColor = Colors.black,
    this.textColor = Colors.white,
    required this.onPressed,
  });

  final String title;
  final String? icon;
  final Color buttonColor;
  final Color textColor;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:  onPressed,
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.r), color: buttonColor),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 5.w,
          children: [
            Text(
              title,
              style: TextStyle(color: Colors.white),
            ),
            if (icon != null)
              SvgPicture.asset(
                icon!,
              ),
          ],
        ),
      ),
    );
  }
}
