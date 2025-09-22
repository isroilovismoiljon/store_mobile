import '../../../core/utils/imports.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        context.go(Routes.home);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SizedBox(
        height: 627.h,
        child: Stack(
          children: [
            Image.asset(
              'assets/images/element.png',
              width: double.infinity,
              height: 627.h,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 83.h),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: SvgPicture.asset(
                  'assets/icons/splash.svg',
                  width: 134.w,
                  height: 133.h,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
