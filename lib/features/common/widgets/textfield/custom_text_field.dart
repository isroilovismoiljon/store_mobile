import '../../../../core/imports.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    required this.label,
    required this.hintText,
    required this.controller,
    required this.onValidChanged,
  });

  final String label;
  final String hintText;
  final TextEditingController controller;
  final ValueChanged<bool> onValidChanged;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isValid = true;
  String? errorMessage;
  Color borderColor = const Color(0xFFE6E6E6);
  String? fieldIcon;
  String passwordIcon = AppIcons.eyeOff;

  void _validate(String value) {
    final text = widget.controller.text;

    setState(() {
      String passwordValidText = Validator.validatePassword(text);
      String fullNameValidText = Validator.validateFullName(text);
      bool emailValidText = Validator.isValidEmail(text);
      if (widget.label == 'Email') {
        if (emailValidText) {
          borderColor = Colors.green;
          errorMessage = null;
          fieldIcon = AppIcons.correct;
          isValid = true;
        } else {
          borderColor = const Color(0xFFED1010);
          fieldIcon = AppIcons.warningCircle;
          isValid = false;
          errorMessage = 'Please enter valid email address';
        }
      } else if (widget.label == 'Password') {
        if (passwordValidText == 'ok') {
          borderColor = Colors.green;
          errorMessage = null;
          fieldIcon = AppIcons.correct;
          isValid = true;
        } else {
          borderColor = const Color(0xFFED1010);
          fieldIcon = AppIcons.warningCircle;
          errorMessage = passwordValidText;
          isValid = false;
        }
      } else if (widget.label == 'Full Name') {
        if (fullNameValidText == 'ok') {
          borderColor = Colors.green;
          errorMessage = null;
          fieldIcon = AppIcons.correct;
          isValid = true;
        } else {
          borderColor = const Color(0xFFED1010);
          fieldIcon = AppIcons.warningCircle;
          errorMessage = fullNameValidText;
          isValid = false;
        }
      }
      if (text.isEmpty) {
        borderColor = const Color(0xFFE6E6E6);
        errorMessage = null;
      }
    });
    widget.onValidChanged(isValid);
  }

  // @override
  // void initState() {
  //   super.initState();
  //   widget.controller.addListener(_validate);
  // }
  //
  // @override
  // void dispose() {
  //   widget.controller.removeListener(_validate);
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        TextField(
          controller: widget.controller,
          onChanged: _validate,
          style: TextStyle(color: Colors.black),
          obscureText: widget.label != 'Password' ? false : (passwordIcon == AppIcons.eyeOff ? true : false),
          decoration: InputDecoration(
            constraints: BoxConstraints(maxHeight: 52.h),
            suffixIcon: fieldIcon != null && widget.controller.text.isNotEmpty
                ? IconButton(
                    onPressed: () {},
                    padding: EdgeInsets.zero,
                    // constraints: BoxConstraints(maxWidth: 24.w, maxHeight: 24.h),
                    iconSize: 24,
                    icon: SvgPicture.asset(fieldIcon!),
                  )
                : widget.controller.text.isEmpty && widget.label == 'Password'
                ? IconButton(
                    onPressed: () {
                      passwordIcon = passwordIcon == AppIcons.eye ? AppIcons.eyeOff : AppIcons.eye;
                      setState(() {});
                    },
                    icon: SvgPicture.asset(passwordIcon),
                  )
                : null,
            hintText: widget.hintText,
            hintStyle: TextStyle(
              color: Colors.grey,
              fontSize: 14,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: BorderSide(
                color: borderColor.withValues(alpha: 0.5),
                width: 1.5,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: BorderSide(
                color: borderColor.withValues(alpha: 0.5),
                width: 1.5,
              ),
            ),
          ),
        ),
        if (!isValid && errorMessage != null)
          Text(
            errorMessage!,
            style: TextStyle(
              color: Theme.of(context).colorScheme.error,
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
      ],
    );
  }
}
