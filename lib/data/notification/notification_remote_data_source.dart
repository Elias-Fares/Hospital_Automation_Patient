import '../../core/base_dio/base_dio.dart';
import '../../core/base_dio/data_state.dart';
import 'models/fake_model.dart';
import 'models/notification_model.dart';

class NotificationRemoteDataSource {
  final BaseDio _baseDio;

  NotificationRemoteDataSource({required BaseDio baseDio}) : _baseDio = baseDio;

  Future<DataState> notificationTrigger({required String fcm}) async {
    final response = await _baseDio.baseGet<FakeModel>(
      subUrl: "/user/notification-trigger",
      needToken: true,
      data: {"fcmToken": fcm},
      model: FakeModel(),
    );

    return response;
  }

  Future<DataState> showNotifications() async {
    final response = await _baseDio.get<NotificationModel>(
      subUrl: "/user/show-notification",
      needToken: true,
      model: NotificationModel(),
      isListOfModel: true,
      queryParameters: {"limit": 1000, "page": 1},
    );

    return response;
  }
}
