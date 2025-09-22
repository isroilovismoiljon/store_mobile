

import '../../../core/utils/imports.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isValidFullName = false;
  bool isValidEmail = false;
  bool isValidPassword = false;

  @override
  void dispose() {
    fullNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(24.w, 59.h, 24.w, 10.h),
          child: Column(
            spacing: 24.h,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PageTopText(
                title: 'Create an account',
                subTitle: 'Let’s create your account.',
              ),
              CustomTextField(
                label: 'Full Name',
                hintText: "Enter your full name",
                controller: fullNameController,
                onValidChanged: (bool value) {
                  isValidFullName = value;
                  setState(() {});
                },
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
              CustomTextField(
                label: 'Password',
                hintText: "Enter your password",
                controller: passwordController,
                onValidChanged: (bool value) {
                  isValidPassword = value;
                  setState(() {});
                },
              ),
              SignUpRichText(),
              CustomButton(
                title: 'Create an Account',
                onPressed: () {isValidFullName && isValidEmail && isValidPassword
                    ? context.go(Routes.login)
                : null;
                },
                buttonColor: isValidFullName && isValidEmail && isValidPassword
                    ? Colors.black
                    : Theme.of(context).colorScheme.secondary,
              ),
              OrWithDivider(),
              CustomButton(
                title: 'Sign Up with Google',
                onPressed: () {},
                buttonColor: Theme.of(context).colorScheme.onPrimary,
                textColor: Theme.of(context).colorScheme.primary,
                icon: AppIcons.logoGoogle,
                isRightIcon: false,
              ),
              CustomButton(
                title: 'Sign Up with Facebook',
                onPressed: () {},
                buttonColor: Color(0xFF1877F2),
                textColor: Theme.of(context).colorScheme.onPrimary,
                icon: AppIcons.logoFacebook,
                isRightIcon: false,
              ),
              SizedBox(height: 50.h,),
              BottomRichText(
                firstText: "Already have an account? ",
                secondText: "Log In", routePage: Routes.login,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
