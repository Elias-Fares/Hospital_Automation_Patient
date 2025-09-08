import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../configuration/res.dart';
import '../../../core/function/date_format.dart';
import '../../../core/widgets/appbars/main_app_bar.dart';
import '../../../core/style/app_colors.dart';
import '../../../core/widgets/custom_error_widget.dart';
import '../../../core/widgets/custom_loading_widget.dart';
import '../../../core/widgets/general_image_asset.dart';
import '../view_model/riverpod/notifications_view_model.dart';

part 'widget/notification_card.dart';
part 'widget/notification_type_widget.dart';

class NotificationsScreen extends ConsumerStatefulWidget {
  static const routeName = "/notifications_screen";
  const NotificationsScreen({super.key});

  @override
  ConsumerState<NotificationsScreen> createState() =>
      _NotificationsScreenState();
}

class _NotificationsScreenState extends ConsumerState<NotificationsScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      ref.read(notificationsViewModelProvider.notifier).fetchNotifications();
    });
  }

  @override
  Widget build(BuildContext context) {
    final notificationsState = ref.watch(notificationsViewModelProvider);
    return Scaffold(
      appBar: const MainAppBar(),
      body: RefreshIndicator(
        onRefresh: () async {
          ref
              .read(notificationsViewModelProvider.notifier)
              .fetchNotifications();
        },
        triggerMode: RefreshIndicatorTriggerMode.anywhere,
        child: notificationsState.notificationsResponse?.when(
              data: (data) {

                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: ListView.builder(
                    itemCount: data.length,
                    physics: const AlwaysScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      final notification = data.elementAt(index);
                      return NotificationCard(
                        type: notification.type ?? "",
                        body: notification.message ?? "",
                        time:
                            notification.createdAt?.toReadableDateTime() ?? "",
                        // time: notification.createdAt.toString(),
                      );
                    },
                  ),
                );
              },
              error: (error, stackTrace) =>
                  CustomErrorWidget(message: error.toString()),
              loading: () => CustomLoadingWidget(),
            ) ??
            SizedBox.shrink(),
      ),
    );
  }
}
