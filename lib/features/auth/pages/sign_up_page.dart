import '../../../core/core.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

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
      body: Padding(
        padding: EdgeInsets.fromLTRB(24.w, 59.h, 24.w, 10.h),
        child: SingleChildScrollView(
          child: Column(
            spacing: 24.h,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Create an account',
                    style: TextStyle(
                      fontSize: 32.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    'Let’s create your account.',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              CustomTextField(
                label: 'Full Name',
                hintText: "Enter your full name",
                controller: fullNameController,
              ),
              CustomTextField(
                label: 'Email',
                hintText: "Enter your email address",
                controller: emailController,
              ),
              CustomTextField(
                label: 'Password',
                hintText: "Enter your password",
                controller: passwordController,
              ),
              RichText(
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
                          // Terms bosilganda
                          print("Terms clicked");
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
                          // Privacy Policy bosilganda
                          print("Privacy clicked");
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
                          print("Cookie clicked");
                        },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
