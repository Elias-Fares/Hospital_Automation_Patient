import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../data/notification/models/notification_model.dart';

class NotificationsState {
  final AsyncValue? notificationTriggerResponse;
  final AsyncValue<List<NotificationModel>>? notificationsResponse;

  NotificationsState(
      {this.notificationTriggerResponse, this.notificationsResponse});

  NotificationsState copyWith(
      {AsyncValue? notificationTriggerResponse,
      AsyncValue<List<NotificationModel>>? notificationsResponse}) {
    return NotificationsState(
        notificationTriggerResponse:
            notificationTriggerResponse ?? this.notificationTriggerResponse,
        notificationsResponse:
            notificationsResponse ?? this.notificationsResponse);
  }
}
