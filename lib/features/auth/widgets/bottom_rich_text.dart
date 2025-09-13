import '../../../core/imports.dart';

class BottomRichText extends StatelessWidget {
  const BottomRichText({
    super.key,
    required this.firstText,
    required this.secondText,
    required this.routePage,
  });

  final String firstText;
  final String secondText;
  final String routePage;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RichText(
        text: TextSpan(
          text: firstText,
          style: TextStyle(
            color: Colors.grey[600],
            fontSize: 14.sp,
          ),
          children: [
            TextSpan(
              text: secondText,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  context.go(routePage);
                },
            ),
          ],
        ),
      ),
    );
  }
}
