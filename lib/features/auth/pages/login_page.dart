import '../../../core/imports.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isValidFullName = false;
  bool isValidEmail = false;
  bool isValidPassword = false;

  @override
  void dispose() {
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
                title: 'Login to your account',
                subTitle: 'It’s great to see you again.',
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
                title: 'Login',
                onPressed: () {
                  context.go(Routes.home);
                },
                buttonColor: isValidFullName && isValidEmail && isValidPassword
                    ? Colors.black
                    : Theme.of(context).colorScheme.secondary,
              ),
              OrWithDivider(),
              CustomButton(
                title: 'Login with Google',
                onPressed: () {},
                buttonColor: Theme.of(context).colorScheme.onPrimary,
                textColor: Theme.of(context).colorScheme.primary,
                icon: AppIcons.logoGoogle,
                isRightIcon: false,
              ),
              CustomButton(
                title: 'Login with Facebook',
                onPressed: () {},
                buttonColor: Color(0xFF1877F2),
                textColor: Theme.of(context).colorScheme.onPrimary,
                icon: AppIcons.logoFacebook,
                isRightIcon: false,
              ),
              SizedBox(height: 150.h,),
              BottomRichText(
                firstText: "Already have an account? ",
                secondText: "Log In", routePage: Routes.signUp,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
