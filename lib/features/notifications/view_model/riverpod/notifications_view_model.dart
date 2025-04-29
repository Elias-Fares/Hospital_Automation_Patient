import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../state/notifications_state.dart';
part 'notifications_view_model.g.dart';

@riverpod
class NotificationsViewModel extends _$NotificationsViewModel {
  @override
  NotificationsState build() => NotificationsState();

}

