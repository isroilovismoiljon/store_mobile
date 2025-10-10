import 'package:store_mobile/features/common/widgets/dialog/success_dialog.dart';

import '../../../core/utils/imports.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({super.key});

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  bool isValidPassword = false;
  bool isValidConfirmPassword = false;

  @override
  void dispose() {
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        leading: IconButton(onPressed: () {}, icon: SvgPicture.asset(AppIcons.backArrow)),
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(24.w, 0.h, 24.w, 24.h),
        child: Column(
          spacing: 24.h,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PageTopText(
              title: 'Reset Password',
              subTitle: 'Set the new password for your account so you can login and access all the features.',
            ),
            CustomTextField(
              label: 'Password',
              hintText: "Enter your New Password",
              controller: passwordController,
              onValidChanged: (bool value) {
                isValidPassword = value;
                setState(() {});
              },
            ),
            CustomTextField(
              label: 'Confirm Password',
              hintText: "Confirm your New Password",
              controller: confirmPasswordController,
              onValidChanged: (bool value) {
                isValidConfirmPassword = value;
                setState(() {});
              },
            ),
            Spacer(),
            CustomButton(
              title: 'Continue',
              onPressed: () {
                if (passwordController.text != confirmPasswordController.text) {
                  CherryToast.warning(
                    description: Text(
                      "Password and confirm password must be equal",
                      style: TextStyle(color: Colors.black),
                    ),
                    animationType: AnimationType.fromLeft,
                  ).show(context);
                } else {
                  isValidPassword && isValidConfirmPassword
                      ? showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (context) => SuccessDialog(
                            title: 'Password Changed!',
                            subTitle: 'You can now use your new password to login to your account.',
                            buttonText: 'Login', buttonRouteName: Routes.login,
                          ),
                        )
                      : null;
                }
              },
              buttonColor: isValidPassword && isValidConfirmPassword
                  ? Colors.black
                  : Theme.of(context).colorScheme.secondary,
            ),
          ],
        ),
      ),
    );
  }
}
