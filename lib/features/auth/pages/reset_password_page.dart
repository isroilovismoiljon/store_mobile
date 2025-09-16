import '../../../core/imports.dart';

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
                    builder: (context) => Dialog(
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
                              'Password Changed!',
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.primary,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(height: 8.h),
                            Text(
                              'You can now use your new password to login to your account.',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.primary,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(height: 20.h),
                            CustomButton(
                              title: 'Login',
                              onPressed: () {
                                context.go(Routes.login);
                              },
                            ),
                          ],
                        ),
                      ),
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
