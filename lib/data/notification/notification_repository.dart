import '../../core/base_dio/data_state.dart';
import 'notification_remote_data_source.dart';

class NotificationRepository {
  final NotificationRemoteDataSource _dataSource;

  NotificationRepository({required NotificationRemoteDataSource dataSource})
      : _dataSource = dataSource;

  Future<DataState> notificationTrigger({required String fcm}) async {
    final response = await _dataSource.notificationTrigger(fcm: fcm);

    return response;
  }

  Future<DataState> showNotifications() async {
    final response = await _dataSource.showNotifications();
    return response;
  }
}
