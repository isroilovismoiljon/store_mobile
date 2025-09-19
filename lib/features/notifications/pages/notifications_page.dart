import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_mobile/core/imports.dart';
import 'package:store_mobile/features/common/app_bar/my_app_bar.dart';
import 'package:store_mobile/features/notifications/bloc/notification/notifications_bloc.dart';
import 'package:store_mobile/features/notifications/bloc/notification/notifications_state.dart';
import 'package:store_mobile/features/notifications/pages/notifications_item.dart';

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
            child: Column(
              children: [
                ...List.generate(
                  state.notifications.length,
                  (index) {
                    return NotificationsItem(state: state, index: index,);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
