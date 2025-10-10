import 'package:flutter/services.dart';
import 'package:store_mobile/core/utils/imports.dart';
import '../../../core/utils/styles.dart';

class CustomTextFieldWithoutValidate extends StatelessWidget {
  const CustomTextFieldWithoutValidate({
    super.key,
    required this.label,
    required this.hint,
    this.formatter = const [],
    this.validator,
    this.isValid = false,
    required this.controller,
  });

  final TextEditingController controller;
  final String label;
  final String hint;
  final bool isValid;
  final String? Function(String?)? validator;
  final List<TextInputFormatter> formatter;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 4.h,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppStyles.rating,
        ),
        TextFormField(
          validator: validator,
          inputFormatters: formatter,
          decoration: InputDecoration(
            hintText: hint,
            constraints: BoxConstraints(maxHeight: 52.h),
            hintStyle: TextStyle(
              color: Colors.grey,
              fontSize: 14.sp,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: BorderSide(
                color: AppColors.borderColor.withValues(alpha: 0.5),
                width: 1.5.w,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: BorderSide(
                color: AppColors.borderColor.withValues(alpha: 0.5),
                width: 1.5.w,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
