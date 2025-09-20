import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_mobile/core/imports.dart';
import 'package:store_mobile/features/common/widgets/empty_page.dart';
import 'package:store_mobile/features/common/widgets/bottom_nav_bar/my_bottom_navigation_bar.dart';
import 'package:store_mobile/features/notifications/widgets/notifications_item.dart';

import '../../auth/pages/my_app_bar.dart';
import '../managers/notification/notifications_bloc.dart';
import '../managers/notification/notifications_state.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotificationsBloc, NotificationsState>(
      builder: (context, state) => Scaffold(
        appBar: MyAppBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(24.w, 24.h, 24.w, 86.h),
            child: state.notifications.isNotEmpty
                ? Column(
                    children: [
                      ...List.generate(
                        state.notifications.length,
                        (index) {
                          return NotificationsItem(
                            state: state,
                            index: index,
                          );
                        },
                      ),
                    ],
                  )
                : EmptyPage(
                    icon: AppIcons.bellDuotone,
                    title: 'You haven’t gotten\nany notifications yet!',
                    subTitle: 'We’ll alert you when something\ncool happens.',
                  ),
          ),
        ),
        bottomNavigationBar: MyBottomNavigationBar(),
      ),
    );
  }
}
