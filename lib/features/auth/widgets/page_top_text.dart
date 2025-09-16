import '../../../core/imports.dart';

class PageTopText extends StatelessWidget {
  const PageTopText({
    super.key,
    required this.title,
    required this.subTitle,
    this.subTitleRich,
  });

  final String title;
  final String subTitle;
  final RichText? subTitleRich;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 32.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        subTitleRich == null ? Text(
          subTitle,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
            color: Theme.of(context).colorScheme.onSecondary,
          ),
        ) : subTitleRich!
      ],
    );
  }
}
