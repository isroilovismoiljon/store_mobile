import 'package:store_mobile/features/home/managers/home_bloc.dart';
import 'package:store_mobile/features/home/managers/home_event.dart';
import '../../../core/utils/imports.dart';

class Like extends StatefulWidget {
  const Like({
    super.key,
    required this.isLiked,
    required this.id,
  });

  final bool isLiked;
  final int id;

  @override
  State<Like> createState() => _LikeState();
}

class _LikeState extends State<Like> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.isLiked
            ? context.read<HomeBloc>().add(HomeEventUnSaveProduct(id: widget.id))
            : context.read<HomeBloc>().add(HomeEventSaveProduct(id: widget.id));
        setState(() {});
      },
      child: Container(
        margin: EdgeInsets.only(top: 12.h, right: 12.w),
        width: 34.w,
        height: 34.h,
        alignment: Alignment.center,
        decoration: BoxDecoration(color: Theme.of(context).colorScheme.onPrimary,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: SvgPicture.asset(
          widget.isLiked ? AppIcons.heartFilled : AppIcons.heart,
          width: 18.w,
          height: 18.h,
          colorFilter: ColorFilter.mode(widget.isLiked ? AppColors.red : AppColors.black, BlendMode.srcIn),
        ),
      ),
    );
  }
}
