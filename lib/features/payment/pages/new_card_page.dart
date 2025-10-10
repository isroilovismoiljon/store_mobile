import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:store_mobile/core/utils/imports.dart';
import 'package:store_mobile/data/models/card/add_card_model.dart';
import 'package:store_mobile/features/common/widgets/dialog/success_dialog.dart';
import 'package:store_mobile/features/common/widgets/my_app_bar.dart';

import '../../../core/utils/styles.dart';
import '../../address/widgets/custom_text_field_without_validate.dart';
import '../managers/payment_bloc/card_bloc.dart';
import '../managers/payment_bloc/card_event.dart';

class NewCardPage extends StatefulWidget {
  const NewCardPage({super.key});

  @override
  State<NewCardPage> createState() => _NewCardPageState();
}

class _NewCardPageState extends State<NewCardPage> {
  final formKey = GlobalKey<FormState>();
  final cardNumberController = TextEditingController();
  final expiryDateController = TextEditingController();
  final securityCodeController = TextEditingController();

  bool emailValid = false;
  bool expiryValid = false;
  bool cvcValid = false;

  String convertExpiryDate(String input) {
    final parts = input.split('/');
    final month = parts[0];
    final year = parts[1];
    return "20$year-$month-01";
  }

  @override
  void dispose() {
    cardNumberController.dispose();
    expiryDateController.dispose();
    securityCodeController.dispose();
    super.dispose();
  }

  void _updateState(VoidCallback fn) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) setState(fn);
    });
  }

  MaskTextInputFormatter expiryDateFormatter = MaskTextInputFormatter(
    mask: '##/##',
    filter: {"#": RegExp(r'\d')},
    type: MaskAutoCompletionType.eager,
  );

  MaskTextInputFormatter cardNumberFormatter = MaskTextInputFormatter(
    mask: '#### #### #### ####',
    filter: {"#": RegExp(r'\d')},
    type: MaskAutoCompletionType.eager,
  );

  MaskTextInputFormatter phoneNumberFormatter = MaskTextInputFormatter(
    mask: '+ 998 ## ### ## ##',
    filter: {"#": RegExp(r'\d')},
    type: MaskAutoCompletionType.lazy,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: 'New Card'),
      body: Padding(
        padding: EdgeInsets.fromLTRB(24.w, 20.h, 24.w, 31.h),
        child: Form(
          key: formKey,
          autovalidateMode: AutovalidateMode.always,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 16.h,
            children: [
              Text("Add Debit or Credit Card", style: AppStyles.rating),
              CustomTextFieldWithoutValidate(
                label: 'Card number',
                hint: 'Enter your card number',
                controller: cardNumberController,
                formatter: [cardNumberFormatter],
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    _updateState(() => emailValid = false);
                    return "Card number should not be empty";
                  }
                  if (value.length != 19) {
                    _updateState(() => emailValid = false);
                    return "Card number should be 16 digits.";
                  }
                  _updateState(() => emailValid = true);
                  return null;
                },
                isValid: true,
              ),
              Row(
                spacing: 11.w,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomTextFieldWithoutValidate(
                    label: 'Expiry Date',
                    hint: 'MM/YY',
                    controller: expiryDateController,
                    formatter: [expiryDateFormatter],
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        _updateState(() => expiryValid = false);
                        return "Expiry date should not be empty";
                      }
                      final regex = RegExp(r'^(0[1-9]|1[0-2])\d{2}$');
                      if (!regex.hasMatch(value)) {
                        _updateState(() => expiryValid = false);
                        return "Expiry date must be in MM/YY format";
                      }
                      _updateState(() => expiryValid = true);
                      return null;
                    },
                    isValid: expiryValid,
                  ),
                  CustomTextFieldWithoutValidate(
                    label: 'Security Code',
                    hint: 'CVC',
                    controller: securityCodeController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        _updateState(() => cvcValid = false);
                        return "Card number should not be empty";
                      }
                      if (value.length != 3) {
                        _updateState(() => cvcValid = false);
                        return "Code should be 3 digits.";
                      }
                      _updateState(() => cvcValid = true);
                      return null;
                    },
                    isValid: cvcValid,
                  ),
                ],
              ),
              Spacer(),
              CustomButton(
                title: 'Add Card',
                onPressed: emailValid && expiryValid && cvcValid
                  ? () {
                  showDialog(
                    context: context,
                    barrierDismissible: true,
                    builder: (context) {
                      return SuccessDialog(
                        title: 'Congratulations!',
                        subTitle: 'Your new card has been added.',
                        buttonText: 'Thanks',
                        buttonRouteName: Routes.paymentMethod,
                      );
                    },
                  );
                  context.read<CardBloc>().add(
                    AddCardEvent(
                      AddCardModel(
                        cardNumber: cardNumberController.text,
                        expiryDate: convertExpiryDate(expiryDateController.text),
                        securityCode: securityCodeController.text,
                      ),
                    ),
                  );
                } : (){},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
