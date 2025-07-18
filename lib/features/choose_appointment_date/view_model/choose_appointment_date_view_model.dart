import 'package:flutter/widgets.dart';
import 'package:patient_app/configuration/service_locator.dart';
import 'package:patient_app/core/base_dio/data_state.dart';
import 'package:patient_app/core/function/is_valid_time.dart';
import 'package:patient_app/core/managers/appointment_data_manager.dart';
import 'package:patient_app/data/appointments/repository/appointment_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'choose_appointment_date_view_model.g.dart';
part 'choose_appointment_date_state.dart';

@riverpod
class ChooseAppointmentDateViewModel extends _$ChooseAppointmentDateViewModel {
  @override
  ChooseAppointmentDateState build() =>
      ChooseAppointmentDateState(showBookAppointmentButton: false);

  final _appointmentRepository = getIt<AppointmentRepository>();

  void setDate({required String? date}) {
    ref.read(appointmentDataManagerProvider).setDate(date: date);
  }

  void setTime({required String? time}) {
    ref.read(appointmentDataManagerProvider).setTime(time: time);
  }

  Future<void> getFreeAppointmentTime() async {
    final bookAppointmentEntity =
        ref.read(appointmentDataManagerProvider).current;
    if ((bookAppointmentEntity.date == null) ||
        (bookAppointmentEntity.doctorId == null) ||
        (bookAppointmentEntity.appointmentType == null)) {
      return;
    }
    state = state.copyWith(freeAppointmentDate: const AsyncValue.loading());
    state = state.copyWith(showBookAppointmentButton: false);
    final response = await _appointmentRepository.getFreeAppointmentTime(
        date: bookAppointmentEntity.date!,
        appointmentType: bookAppointmentEntity.appointmentType!,
        doctorId: bookAppointmentEntity.doctorId!);

    if (response is DataSuccess) {
      state =
          state.copyWith(freeAppointmentDate: AsyncValue.data(response.data));

      if (isValidTime(response.data.toString())) {
        setTime(time: response.data.toString());
        state = state.copyWith(showBookAppointmentButton: true);
      }
    } else {
      state = state.copyWith(
          freeAppointmentDate: AsyncValue.error(
              response.exceptionResponse?.exceptionMessages.firstOrNull ?? "",
              StackTrace.current));
    }
  }

  Future<void> bookAppointment() async {
    state = state.copyWith(bookAppointmentResponse: const AsyncValue.loading());
    final bookAppointmentEntity =
        ref.read(appointmentDataManagerProvider).current;

    final response = await _appointmentRepository.bookAppointment(
        bookAppointmentEntity: bookAppointmentEntity);

    if (response is DataSuccess) {
      state = state.copyWith(
          bookAppointmentResponse: AsyncValue.data(response.data));
    } else {
      state = state.copyWith(
          bookAppointmentResponse: AsyncValue.error(
              response.exceptionResponse?.exceptionMessages.firstOrNull ?? "",
              StackTrace.current));
    }
  }
}
