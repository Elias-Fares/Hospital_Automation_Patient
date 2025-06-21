import 'package:patient_app/configuration/service_locator.dart';
import 'package:patient_app/core/base_dio/data_state.dart';
import 'package:patient_app/core/enums/params_values.dart';
import 'package:patient_app/data/appointments/repository/appointment_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'appointments_state.dart';
part 'appointments_view_model.g.dart';

@riverpod
class AppointmentsViewModel extends _$AppointmentsViewModel {
  @override
  AppointmentsState build() => AppointmentsState();

  final _appointmentsRepository = getIt<AppointmentRepository>();

  Future<void> getBothUpcomingAppointments() async {
    state = state.copyWith(upcomingAppointments: const AsyncValue.loading());

    final response = await _appointmentsRepository.getAppointments(
        type: ParamsValues.both.value,
        state: ParamsValues.upcomming.value);

    if (response is DataSuccess) {
      state =
          state.copyWith(upcomingAppointments: AsyncValue.data(response.data));
    } else {
      state = state.copyWith(
          upcomingAppointments: AsyncValue.error(
              response.exceptionResponse?.exceptionMessages.firstOrNull ?? "",
              StackTrace.current));
    }
  }

  Future<void> getBothPassedAppointments() async {
    state = state.copyWith(passedAppointments: const AsyncValue.loading());

    final response = await _appointmentsRepository.getAppointments(
        type: ParamsValues.both.value, state: ParamsValues.passed.value);

    if (response is DataSuccess) {
      state =
          state.copyWith(passedAppointments: AsyncValue.data(response.data));
    } else {
      state = state.copyWith(
          passedAppointments: AsyncValue.error(
              response.exceptionResponse?.exceptionMessages.firstOrNull ?? "",
              StackTrace.current));
    }
  }

  Future<void> getBothMissedAppointments() async {
    state = state.copyWith(missedAppointments: const AsyncValue.loading());

    final response = await _appointmentsRepository.getAppointments(
        type: ParamsValues.both.value, state: ParamsValues.missed.value);

    if (response is DataSuccess) {
      state =
          state.copyWith(missedAppointments: AsyncValue.data(response.data));
    } else {
      state = state.copyWith(
          missedAppointments: AsyncValue.error(
              response.exceptionResponse?.exceptionMessages.firstOrNull ?? "",
              StackTrace.current));
    }
  }
}
