import '../../../core/imports.dart';

class OrWithDivider extends StatelessWidget {
  const OrWithDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        children: [
          Expanded(
            child: Divider(
              color: AppColors.primary100,
              thickness: 1,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              'Or',
              style: TextStyle(
                color: AppColors.primary500,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Expanded(
            child: Divider(
              color: AppColors.primary100,
              thickness: 1,
            ),
          ),
        ],
      ),
    );
  }
}
