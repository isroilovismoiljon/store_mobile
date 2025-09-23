import 'package:store_mobile/core/utils/imports.dart';
import 'package:store_mobile/features/home/managers/home_bloc.dart';

import '../../home/managers/home_event.dart';

class MyBottomNavigationBar extends StatefulWidget {
  const MyBottomNavigationBar({
    super.key,
  });

  @override
  State<MyBottomNavigationBar> createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
  int selected = 1;

  List<Map> bottomItems = [
    {
      'id': 1,
      'title': 'Home',
      'icon': AppIcons.home,
      'route': Routes.home,
    },
    {
      'id': 2,
      'title': 'Search',
      'icon': AppIcons.search,
      'route': '',
    },
    {
      'id': 3,
      'title': 'Saved',
      'icon': AppIcons.heart,
      'route': Routes.saved,
    },
    {
      'id': 4,
      'title': 'Cart',
      'icon': AppIcons.cart,
      'route': '',
    },
    {
      'id': 5,
      'title': 'Account',
      'icon': AppIcons.user,
      'route': '',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 16.h),
      width: double.infinity,
      height: 86.h,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onPrimary,
        border: Border(
          top: BorderSide(
            color: AppColors.borderColor,
            width: 1,
          ),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ...List.generate(
            bottomItems.length,
            (index) => GestureDetector(
              onTap: () {
                setState(() {
                  selected = bottomItems[index]['id'];
                });
                final route = bottomItems[index]['route'];
                route == Routes.home ? context.go(route) : context.push(route);
                if (route == Routes.saved) context.read<HomeBloc>().add(HomeEventGetSavedProducts());
              },
              child: Column(
                children: [
                  SvgPicture.asset(
                    bottomItems[index]['icon'],
                    width: 24.w,
                    height: 24.h,
                    colorFilter: ColorFilter.mode(
                      bottomItems[index]['id'] == selected
                          ? Theme.of(context).colorScheme.primary
                          : Theme.of(context).colorScheme.onSecondary,
                      BlendMode.srcIn,
                    ),
                  ),
                  Text(
                    bottomItems[index]['title'],
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                      color: bottomItems[index]['id'] == selected
                          ? Theme.of(context).colorScheme.primary
                          : Theme.of(context).colorScheme.onSecondary,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
