import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../configuration/service_locator.dart';
import '../../../../core/base_dio/data_state.dart';
import '../../../../core/services/notifications_service.dart';
import '../../../../data/notification/notification_repository.dart';
import '../state/notifications_state.dart';
part 'notifications_view_model.g.dart';

@Riverpod(keepAlive: true)
class NotificationsViewModel extends _$NotificationsViewModel {
  @override
  NotificationsState build() => NotificationsState();

  final _notificationRepository = getIt<NotificationRepository>();


    Future<void> notificationTrigger() async {
    final fcmToken = await NotificationService.getFCMToken();
    if (fcmToken == null || fcmToken.isEmpty) return;
    state = state.copyWith(notificationTriggerResponse: AsyncValue.loading());
    final response = await _notificationRepository.notificationTrigger(fcm: fcmToken);

    if (response is DataSuccess) {
      state = state.copyWith(
        notificationTriggerResponse: AsyncValue.data(response.data),
      );
    } else {
      state = state.copyWith(
        notificationTriggerResponse: AsyncValue.error(
          response.exceptionResponse?.exceptionMessages.firstOrNull ?? "",
          StackTrace.current,
        ),
      );
    }
  }

    Future<void> fetchNotifications() async {
    state = state.copyWith(notificationsResponse: AsyncValue.loading());
    final response = await _notificationRepository.showNotifications();
    if (response is DataSuccess) {
      state = state.copyWith(
        notificationsResponse: AsyncValue.data(response.data),
      );
    } else {
      state = state.copyWith(
        notificationsResponse: AsyncValue.error(
          response.exceptionResponse?.exceptionMessages.firstOrNull ?? "",
          StackTrace.current,
        ),
      );
    }
  }
}
