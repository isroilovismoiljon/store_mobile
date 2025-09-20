import '../../../core/imports.dart';

class Like extends StatelessWidget {
  const Like({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){

      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.r),
        child: Container(
          margin: EdgeInsets.only(top: 12.h, right: 12.w),
          width: 34.w,
          height: 34.h,
          alignment: Alignment.center,
          decoration: BoxDecoration(color: Theme.of(context).colorScheme.onPrimary),
          child: SvgPicture.asset(
            AppIcons.heart,
            width: 18.w,
            height: 18.h,
            colorFilter: ColorFilter.mode(AppColors.black, BlendMode.srcIn),
          ),
        ),
      ),
    );
  }
}
