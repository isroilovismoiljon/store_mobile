import '../../../core/imports.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {

  final emailController = TextEditingController();
  bool isValidEmail = false;

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(leading: IconButton(onPressed: (){}, icon: SvgPicture.asset(AppIcons.backArrow)),),
      body: Padding(
        padding: EdgeInsets.fromLTRB(24.w, 0.h, 24.w, 24.h),
        child: Column(
          spacing: 24.h,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PageTopText(
              title: 'Forgot password',
              subTitle: 'Enter your email for the verification process. We will send 4 digits code to your email.',
            ),
            CustomTextField(
              label: 'Email',
              hintText: "Enter your email address",
              controller: emailController,
              onValidChanged: (bool value) {
                isValidEmail = value;
                setState(() {});
              },
            ),
            Spacer(),
            CustomButton(
              title: 'Send Code',
              onPressed: () {isValidEmail
                  ? context.go(Routes.enterOtp)
                  : null;
              },
              buttonColor: isValidEmail
                  ? Colors.black
                  : Theme.of(context).colorScheme.secondary,
            ),
          ],
        ),
      ),
    );
  }
}
