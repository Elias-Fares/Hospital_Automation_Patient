import 'package:patient_app/configuration/service_locator.dart';
import 'package:patient_app/core/base_dio/data_state.dart';
import 'package:patient_app/core/models/doctor_model.dart';
import 'package:patient_app/data/doctors/repository/doctors_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'patient_doctors_view_model.g.dart';
part 'patient_doctors_state.dart';

@riverpod
class PatientDoctorsViewModel extends _$PatientDoctorsViewModel {
  @override
  PatientDoctorsState build() => PatientDoctorsState();

  final _doctorsRepository = getIt<DoctorsRepository>();

  Future<void> getDoctors() async {
    state = state.copyWith(doctorsResponse: const AsyncValue.loading());

    final response = await _doctorsRepository.getDoctors();

    if (response is DataSuccess) {
      state =
          state.copyWith(doctorsResponse: AsyncValue.data(response.data));
    } else {
      state = state.copyWith(
          doctorsResponse: AsyncValue.error(
              response.exceptionResponse?.exceptionMessages.firstOrNull ?? "",
              StackTrace.current));
    }
  }
}
