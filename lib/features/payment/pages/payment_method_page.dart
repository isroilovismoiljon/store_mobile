import 'package:store_mobile/core/utils/imports.dart';
import 'package:store_mobile/core/utils/styles.dart';
import 'package:store_mobile/features/common/widgets/app_bar/my_app_bar.dart';
import 'package:store_mobile/features/payment/widgets/card_items.dart';

class PaymentMethodPage extends StatelessWidget {
  const PaymentMethodPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: 'Payment Method'),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 12,
          children: [
            Text(
              'Saved Cards',
              style: AppStyles.rating.copyWith(fontWeight: FontWeight.w600),
            ),
            CardItems(cardNumber: '9860567890334568',),
            CustomButton(
              title: 'Add New Card',
              icon: AppIcons.plus,
              isRightIcon: false,
              buttonColor: Theme.of(context).colorScheme.onPrimary,
              textColor: Theme.of(context).colorScheme.primary,
              onPressed: () {},
            ),
            Spacer(),
            CustomButton(title: 'Apply', onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
