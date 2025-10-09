import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:store_mobile/core/utils/imports.dart';
import 'package:store_mobile/features/common/widgets/my_app_bar.dart';

class MyDetailsPage extends StatefulWidget {
  const MyDetailsPage({super.key});

  @override
  State<MyDetailsPage> createState() => _MyDetailsPageState();
}

class _MyDetailsPageState extends State<MyDetailsPage> {
  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final birthdayController = TextEditingController();
  final phoneNumberController = TextEditingController();
  String? selectedGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: MyAppBar(title: 'My Details'),
      body: Padding(
        padding: EdgeInsets.all(24.r),
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 16.h,
              children: [
                CustomTextField(
                  label: 'Full Name',
                  hintText: 'Enter your FullName...',
                  controller: fullNameController,
                  onValidChanged: (value){},
                ),
                CustomTextField(
                  label: 'Email Address',
                  hintText: 'Enter your Email...',
                  controller: emailController,
                  onValidChanged: (value){},
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 4.h,
                  children: [
                    Text(
                      'Date of Birth',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    TextFormField(
                      readOnly: true,
                      controller: birthdayController,
                      decoration: InputDecoration(
                        constraints: BoxConstraints(maxHeight: 52.h),
                        labelText: 'Date of Birth',
                        border: OutlineInputBorder(),
                        suffixIcon: Icon(Icons.calendar_today),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.r),
                          borderSide: BorderSide(
                            color: AppColors.borderColor.withValues(alpha: 0.5),
                            width: 1.5,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.r),
                          borderSide: BorderSide(
                            color: AppColors.borderColor.withValues(alpha: 0.5),
                            width: 1.5,
                          ),
                        ),
                      ),
                      onTap: () async {
                        DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1900),
                          lastDate: DateTime.now(),
                        );
                        if (pickedDate != null) {
                          // controller.text = DateFormat('dd/MM/yyyy').format(pickedDate);
                        }
                      },
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 4.h,
                  children: [
                    Text(
                      'Gender',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    DropdownButtonFormField<String>(
                      padding: EdgeInsets.zero,
                      decoration: InputDecoration(
                        labelText: 'Gender',
                        constraints: BoxConstraints(maxHeight: 52.h),
                        border: OutlineInputBorder(),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.r),
                          borderSide: BorderSide(
                            color: AppColors.borderColor.withValues(alpha: 0.5),
                            width: 1.5,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.r),
                          borderSide: BorderSide(
                            color: AppColors.borderColor.withValues(alpha: 0.5),
                            width: 1.5,
                          ),
                        ),
                      ),
                      value: selectedGender,
                      items: ['Male', 'Female']
                          .map((gender) => DropdownMenuItem(
                        value: gender,
                        child: Text(gender),
                      ))
                          .toList(),
                      onChanged: (value) {
                        selectedGender = value;
                      },
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 4.h,
                  children: [
                    Text(
                      'Phone Number',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    IntlPhoneField(
                      controller: phoneNumberController,
                      decoration: InputDecoration(
                        labelText: 'Phone Number',
                        constraints: BoxConstraints(maxHeight: 52.h),
                        border: OutlineInputBorder(),
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
                      initialCountryCode: 'US',
                      onChanged: (phone) {
                        print(phone.completeNumber); // +1234453231506
                      },
                    ),
                  ],
                ),
              ],
            ),
            Spacer(),
            CustomButton(title: 'Submit', onPressed: (){})
          ],
        ),
      ),
    );
  }
}
