import '../../../configuration/service_locator.dart';
import '../../../core/base_dio/data_state.dart';
import '../../../core/enums/params_values.dart';
import '../../../data/appointments/models/appointment_model.dart';
import '../../../data/appointments/repository/appointment_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'child_appointments_view_model.g.dart';

@riverpod
class ChildAppointmentsViewModel extends _$ChildAppointmentsViewModel {
  @override
  AsyncValue<List<AppointmentModel>>? build() => null;

  final _appointmentsRepository = getIt<AppointmentRepository>();

  Future<void> getChildAppointments({
    required String? childId,
  }) async {
    if (childId == null) {
      return;
    }
    state = const AsyncValue.loading();

    final response = await _appointmentsRepository.getAppointments(
        type: ParamsValues.children.value, childId: childId);

    if (response is DataSuccess) {
      state = AsyncValue.data(response.data);
    } else {
      state = AsyncValue.error(
          response.exceptionResponse?.exceptionMessages.firstOrNull ?? "",
          StackTrace.current);
    }
  }
}
