import 'package:store_mobile/core/utils/imports.dart';
import 'package:store_mobile/core/utils/styles.dart';

class CardItems extends StatefulWidget {
  const CardItems({
    super.key,
    required this.cardNumber,
  });

  final String cardNumber;

  @override
  State<CardItems> createState() => _CardItemsState();
}

class _CardItemsState extends State<CardItems> {
  String maskCardNumber(String number) {
    if (number.length != 16) {
      throw ArgumentError("Son 16 xonali bo'lishi kerak");
    }
    String lastFour = number.substring(12);
    return "**** **** **** $lastFour";
  }

  String cardIcon = AppIcons.visa;
  String getCardType(String cardNumber) {
    final cleanNumber = cardNumber.replaceAll(' ', '');
    if (cleanNumber.isEmpty) return AppIcons.visa;
    ;

    if (cleanNumber.startsWith('4')) {
      return AppIcons.visa;
        //"Visa";
    } else if (RegExp(r'^(51|52|53|54|55)').hasMatch(cleanNumber)) {
      cardIcon = AppIcons.masterCard;
    } else if (cleanNumber.startsWith('8600')) {
      return AppIcons.visa;
        //"UzCard";
    } else if (cleanNumber.startsWith('9860')) {
      return AppIcons.visa;
        //"Humo";
    } else if (cleanNumber.startsWith('34') || cleanNumber.startsWith('37')) {
      return AppIcons.visa;
        //"American Express";
    } else if (cleanNumber.startsWith('35')) {
      return AppIcons.visa;
        //"JCB";
    } else if (cleanNumber.startsWith('30') || cleanNumber.startsWith('36') || cleanNumber.startsWith('38')) {
      return AppIcons.visa;
      //"Diners Club";
    }
    cardIcon = AppIcons.visa;
    return cardIcon;
  }

  // void main() {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(color: AppColors.borderColor),
      ),
      padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 20.w),
      width: double.infinity,
      height: 52.h,
      child: Row(
        spacing: 6,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgPicture.asset(
            getCardType(widget.cardNumber),
            width: 37.w,
            height: 12.h,
            fit: BoxFit.cover,
          ),
          SizedBox(
            width: 8.w,
          ),
          Text(
            maskCardNumber(widget.cardNumber),
            style: AppStyles.cartItemTitle,
          ),
          Container(
            decoration: BoxDecoration(
              color: AppColors.primary100,
              borderRadius: BorderRadius.circular(6.r),
            ),
            padding: EdgeInsets.symmetric(vertical: 3.h, horizontal: 9.w),
            child: Text(
              'Default',
              style: AppStyles.s10w400surface,
            ),
          ),
          Spacer(),
          Radio(
            value: widget.cardNumber,
            groupValue: widget.cardNumber,
            onChanged: (value) {
              value = widget.cardNumber;
            },
          ),
        ],
      ),
    );
  }
}
