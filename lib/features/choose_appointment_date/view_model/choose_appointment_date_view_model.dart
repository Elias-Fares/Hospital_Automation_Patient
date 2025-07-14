import 'package:patient_app/configuration/service_locator.dart';
import 'package:patient_app/core/base_dio/data_state.dart';
import 'package:patient_app/core/managers/appointment_data_manager.dart';
import 'package:patient_app/data/appointments/repository/appointment_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'choose_appointment_date_view_model.g.dart';
part 'choose_appointment_date_state.dart';

@riverpod
class ChooseAppointmentDateViewModel extends _$ChooseAppointmentDateViewModel {
  @override
  ChooseAppointmentDateState build() => ChooseAppointmentDateState();

  final _appointmentRepository = getIt<AppointmentRepository>();

  Future<void> getFreeAppointmentTime() async {
    final bookAppointmentEntity =
        ref.read(appointmentDataManagerProvider).current;
    if ((bookAppointmentEntity.date == null) ||
        (bookAppointmentEntity.doctorId == null) ||
        (bookAppointmentEntity.appointmentType == null)) {
      return;
    }
    state = state.copyWith(freeAppointmentDate: const AsyncValue.loading());
    final response = await _appointmentRepository.getFreeAppointmentTime(
        date: bookAppointmentEntity.date!,
        appointmentType: bookAppointmentEntity.appointmentType!,
        doctorId: bookAppointmentEntity.doctorId!);

    if (response is DataSuccess) {
      final Map<String, dynamic> responseMap = response.data;

      final responseText = responseMap.values.toList().join();

      state =
          state.copyWith(freeAppointmentDate: AsyncValue.data(responseText));
    } else {
      state = state.copyWith(
          freeAppointmentDate: AsyncValue.error(
              response.exceptionResponse?.exceptionMessages.firstOrNull ?? "",
              StackTrace.current));
    }
  }

  void setDate({required String? date}) {
    ref.read(appointmentDataManagerProvider).setDate(date: date);
  }
}
