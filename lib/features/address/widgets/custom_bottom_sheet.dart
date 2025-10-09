import 'package:store_mobile/core/utils/imports.dart';
import '../../../core/utils/styles.dart';

class CustomBottomSheet extends StatefulWidget {
  const CustomBottomSheet({
    super.key, required this.addressOptions
  });
  final List addressOptions;

  @override
  State<CustomBottomSheet> createState() => _CustomBottomSheetState();
}

class _CustomBottomSheetState extends State<CustomBottomSheet> {

  bool defaultAddress = false;
  String selectedAddress = 'Home';

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        color: Theme.of(context).colorScheme.onPrimary,
      ),
      constraints: BoxConstraints(maxHeight: 600.h),
      padding: EdgeInsets.all(25.r),
      child: Column(
        spacing: 16.h,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Address',
                style: AppStyles.bottomSheet,
              ),
              GestureDetector(
                onTap: (){
                  Navigator.of(context, rootNavigator: true).pop();
                },
                child: SvgPicture.asset(
                  AppIcons.cancel,
                  width: 24.w,
                  height: 24.h,
                ),
              ),
            ],
          ),
          Divider(
            color: AppColors.borderColor,
          ),
          Column(
            spacing: 4.h,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Address Nickname',
                style: AppStyles.rating,
              ),
              DropdownButtonFormField<String>(
                value: selectedAddress,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
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
                items: widget.addressOptions.map((value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    selectedAddress = newValue!;
                  });
                },
              ),
            ],
          ),
          Column(
            spacing: 4.h,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Full Address',
                style: AppStyles.rating,
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Enter your full address...',
                  constraints: BoxConstraints(maxHeight: 52.h),
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
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
              ),
            ],
          ),
          Row(
            spacing: 8.w,
            children: [
              Checkbox(
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6), // 🔹 radius shu yerda
                ),
                side: BorderSide(color: AppColors.borderColor, width: 1.w),
                value: defaultAddress,
                onChanged: (value) {
                  defaultAddress = !defaultAddress;
                  setState(() {});
                },
              ),
              Text(
                'Make this as a default address',
                style: AppStyles.productDescription,
              ),
            ],
          ),
          CustomButton(title: 'Add', onPressed: () {}),
        ],
      ),
    );
  }
}
