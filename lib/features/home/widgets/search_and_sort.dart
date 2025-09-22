import '../../../core/utils/imports.dart';

class SearchAndSort extends StatelessWidget {
  const SearchAndSort({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 8.w,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: SizedBox(
            width: double.infinity,
            height: 52.h,
            child: TextField(
              decoration: InputDecoration(
                isDense: true,
                contentPadding: EdgeInsets.symmetric(
                  vertical: 8.h,
                  horizontal: 12.w,
                ),
                constraints: BoxConstraints(maxHeight: 52.h),
                hintText: 'Search for clothes...',
                hintStyle: TextStyle(
                  color: AppColors.primary500.withValues(alpha: 0.5),
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.r),
                  borderSide: BorderSide(color: Colors.grey.withValues(alpha: 0.3)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.r),
                  borderSide: BorderSide(color: Colors.grey.withValues(alpha: 0.3)),
                ),
                prefixIcon: IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(
                    AppIcons.search,
                    height: 24.h,
                    width: 24.w,
                  ),
                ),
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(
                    AppIcons.mic,
                    height: 24.h,
                    width: 24.w,
                  ),
                ),
              ),
            ),
          ),
        ),
        Container(
          width: 52.w,
          height: 52.h,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: SvgPicture.asset(
            AppIcons.filter,
            width: 24.w,
            height: 24.h,
          ),
        ),
      ],
    );
  }
}
