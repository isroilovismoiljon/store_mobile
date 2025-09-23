import 'package:store_mobile/features/home/managers/home_bloc.dart';
import 'package:store_mobile/features/home/managers/home_event.dart';
import '../../../core/utils/imports.dart';

class Like extends StatefulWidget {
  const Like({
    super.key,
    required this.isLiked,
    required this.id,
    this.containerSize = 34,
    this.iconSize = 18,
    this.onTap,
  });

  final bool isLiked;
  final int id;
  final int containerSize;
  final int iconSize;
  final VoidCallback? onTap;

  @override
  State<Like> createState() => _LikeState();
}

class _LikeState extends State<Like> {
  bool? _isLiked;

  @override
  void initState() {
    super.initState();
    _isLiked = widget.isLiked;
  }

  void _handleTap() {
    if (_isLiked!) {
      context.read<HomeBloc>().add(HomeEventUnSaveProduct(id: widget.id));
    } else {
      context.read<HomeBloc>().add(HomeEventSaveProduct(id: widget.id));
    }

    widget.onTap?.call();

    setState(() {
      _isLiked = !_isLiked!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      child: Container(
        margin: EdgeInsets.only(top: 12.h, right: 12.w),
        width: widget.containerSize.w,
        height: widget.containerSize.h,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onPrimary,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: SvgPicture.asset(
          widget.isLiked ? AppIcons.heartFilled : AppIcons.heart,
          width: widget.iconSize.w,
          height: widget.iconSize.h,
          colorFilter: ColorFilter.mode(widget.isLiked ? AppColors.red : AppColors.black, BlendMode.srcIn),
        ),
      ),
    );
  }
}
