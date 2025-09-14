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
                    actionHandler: () {
                      print("Hello World!!");
                    },
                  ).show(context);
                } else {
                  isValidPassword && isValidConfirmPassword
                      ? showDialog(
                          context: context,
                          builder: (context) => Container(
                            margin: EdgeInsets.symmetric(horizontal: 24.w),
                            width: double.infinity,
                            padding: EdgeInsets.all(24.r),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.onPrimary,
                              borderRadius: BorderRadiusGeometry.circular(20.r),
                            ),
                            child: Center(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  SvgPicture.asset(
                                    AppIcons.correct,
                                    width: 78.w,
                                    height: 78.h,
                                  ),
                                  Text(
                                    'Password Changed!',
                                    style: TextStyle(
                                      color: Theme.of(context).colorScheme.primary,
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    'Your can now use your new password to login to your account.',
                                    style: TextStyle(
                                      color: Theme.of(context).colorScheme.primary,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  CustomButton(title: 'Login', onPressed: (){context.go(Routes.login);})
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
