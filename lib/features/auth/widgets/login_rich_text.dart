import '../../../core/imports.dart';

class LoginRichText extends StatelessWidget {
  const LoginRichText({
    super.key,
    this.firstText = "Forgot your password? ",
    this.secondText = "Reset your password",
    this.routePage = Routes.forgotPassword,
  });

  final String firstText;
  final String secondText;
  final String routePage;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: TextStyle(
          fontSize: 14,
          color: Colors.black,
        ),
        children: [
          TextSpan(text: firstText),
          TextSpan(
            text: secondText,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                context.push(routePage);
              },
          ),
        ],
      ),
    );
  }
}
