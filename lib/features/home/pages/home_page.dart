import '../../../core/imports.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(
              left: 24.w,
              top: 59.h,
            ),
            height: 844.h,
            child: Stack(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    bottom: 83.h,
                  ),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Define yourself in your unique way.',
                      style: TextStyle(
                        fontSize: 64.sp,
                        fontWeight: FontWeight.w600,
                      ).copyWith(height: 1.2.h),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Image.asset(
                    'assets/images/onboarding.png',
                    width: 358.w,
                    height: 697.h,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 341.w,
            height: 64.h,
            child: Padding(
              padding: EdgeInsets.only(top: 10.h),
              child: CustomButton(
                title: 'Get Started',
                buttonColor: Colors.black,
                textColor: Colors.white,
                onPressed: () {
                  context.push(Routes.signUp);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
