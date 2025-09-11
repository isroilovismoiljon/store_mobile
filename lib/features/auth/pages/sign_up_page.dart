import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(24.w, 59.h, 24.w, 10.h),
        child: Column(
          children: [
            Text('Create an account'),
          ],
        ),
      ),
    );
  }
}
