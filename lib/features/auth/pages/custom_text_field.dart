import '../../../core/core.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    required this.label,
    required this.hintText,
    required this.controller,
  });

  final String label;
  final String hintText;
  final TextEditingController controller;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isValid = true;
  String? errorMessage;
  Color borderColor = const Color(0xFFE6E6E6);
  String? fieldIcon;
  String passwordIcon = AppIcons.eye;

  void _validate() {
    final text = widget.controller.text;

    setState(() {
      String passwordValidText = Validator.validatePassword(text);
      String fullNameValidText = Validator.validatePassword(text);
      if (text.isEmpty) {
        borderColor = const Color(0xFFE6E6E6);
      }
      if (widget.label == 'Email') {
        if (Validator.isValidEmail(text)) {
          borderColor = Colors.green;
        } else {
          borderColor = const Color(0xFFED1010);
          fieldIcon = AppIcons.warningCircle;
          errorMessage = 'Please enter valid email address';
        }
      } else if (widget.label == 'Password') {
        if (text.isEmpty) {
          if (passwordValidText == 'ok') {
            borderColor = Colors.green;
          } else {
            borderColor = const Color(0xFFED1010);
            fieldIcon = AppIcons.warningCircle;
            errorMessage = passwordValidText;
          }
        }
      } else if (widget.label == 'Full Name') {
        if (text.isEmpty) {
          if (fullNameValidText == 'ok') {
            borderColor = Colors.green;
          } else {
            borderColor = const Color(0xFFED1010);
            fieldIcon = AppIcons.warningCircle;
            errorMessage = passwordValidText;
          }
        }
      }
    });
  }

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_validate);
  }

  @override
  void dispose() {
    widget.controller.removeListener(_validate);
    super.dispose();
  }

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
          decoration: InputDecoration(
            suffix: Row(
              spacing: 5.w,
              children: [
                widget.label == 'Password'
                    ? IconButton(
                        onPressed: () {
                          passwordIcon = passwordIcon == AppIcons.eye ? AppIcons.eyeOff : AppIcons.eye;
                          setState(() {});
                        },
                        icon: SvgPicture.asset(passwordIcon),
                      )
                    : Text(
                        '.',
                        style: TextStyle(
                          color: Colors.transparent,
                        ),
                      ),
                fieldIcon == null
                    ? Text(
                        '.',
                        style: TextStyle(
                          color: Colors.transparent,
                        ),
                      )
                    : SvgPicture.asset(fieldIcon!),
              ],
            ),
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
        if (isValid)
          Text(
            'Please enter valid email address',
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
