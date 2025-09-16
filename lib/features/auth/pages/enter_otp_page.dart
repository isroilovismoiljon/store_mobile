import 'package:store_mobile/features/auth/pages/my_app_bar.dart';
import 'package:store_mobile/features/auth/pages/otp_text_field.dart';

import '../../../core/imports.dart';

class EnterOtpPage extends StatefulWidget {
  const EnterOtpPage({super.key});

  @override
  State<EnterOtpPage> createState() => _EnterOtpPageState();
}

class _EnterOtpPageState extends State<EnterOtpPage> {
  final List<FocusNode> _focusNodes = List.generate(4, (index) => FocusNode()); // 4 ta field uchun
  final List<TextEditingController> _controllers = List.generate(4, (index) => TextEditingController());

  bool get isAllFilled {
    return _controllers.every((c) => c.text.isNotEmpty);
  }

  String get otpCode {
    return _controllers.map((c) => c.text).join();
  }

  @override
  void dispose() {
    for (var node in _focusNodes) {
      node.dispose();
    }
    for (var c in _controllers) {
      c.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: MyAppBar(),
      body: Padding(
        padding: EdgeInsets.fromLTRB(24.w, 0.h, 24.w, 24.h),
        child: Column(
          spacing: 24.h,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PageTopText(
              title: 'Enter 4 Digit Code',
              subTitle: 'Enter 4 digit code that your receive on your email (cody.fisher45@example.com).',
              subTitleRich: RichText(text: TextSpan(
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                ),
                children: [
                  TextSpan(text: 'Enter 4 digit code that your receive on your email ().', style: TextStyle(color: Theme.of(context).colorScheme.onSecondary)),
                  TextSpan(
                    text: 'cody.fisher45@example.com',
                  ),
                  TextSpan(text: ').', style: TextStyle(color: Theme.of(context).colorScheme.onSecondary)),
                ],
              ),),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(4, (index) {
                return OtpTextField(
                  controller: _controllers[index],
                  focusNode: _focusNodes[index],
                  nextNode: index < 3 ? _focusNodes[index + 1] : null,
                  prevNode: index > 0 ? _focusNodes[index - 1] : null,
                  onChanged: (_) => setState(() {}),
                );
              }),
            ),
            Center(
              child: LoginRichText(
                firstText: 'Email not received? ',
                secondText: 'Resend code',
                routePage: Routes.enterOtp,
              ),
            ),
            Spacer(),
            CustomButton(
              title: 'Continue',
              onPressed: isAllFilled
                  ? () {
                      context.go(Routes.resetPassword);
                    }
                  : () {},
              buttonColor: isAllFilled
                  ? Theme.of(context).colorScheme.primary
                  : Theme.of(context).colorScheme.secondary,
            ),
          ],
        ),
      ),
    );
  }
}
