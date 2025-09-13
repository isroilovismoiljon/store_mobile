import '../../../core/imports.dart';

class SignUpRichText extends StatelessWidget {
  const SignUpRichText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: TextStyle(
          fontSize: 14,
          color: Colors.black,
        ),
        children: [
          TextSpan(text: "By signing up you agree to our "),
          TextSpan(
            text: "Terms",
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
              },
          ),
          const TextSpan(text: ", "),
          TextSpan(
            text: "Privacy Policy",
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
              },
          ),
          const TextSpan(text: ", and "),
          TextSpan(
            text: "Cookie Use",
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
              },
          ),
        ],
      ),
    );
  }
}
