import 'package:flutter/material.dart';
import '../../../configuration/service_locator.dart';
import '../../../core/base_dio/data_state.dart';
import '../../../core/managers/appointment_data_manager.dart';
import '../../../core/models/doctor_model.dart';
import '../../../data/doctors/repository/doctors_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'patient_doctors_view_model.g.dart';
part 'patient_doctors_state.dart';

@riverpod
class PatientDoctorsViewModel extends _$PatientDoctorsViewModel {
  @override
  PatientDoctorsState build() {
    ref.onDispose(
      () {
        clearEntity();
        debugPrint("PatientDoctorsViewModel Disposed!");
      },
    );
    return PatientDoctorsState();
  }

  final _doctorsRepository = getIt<DoctorsRepository>();

  Future<void> getDoctors() async {
    state = state.copyWith(doctorsResponse: const AsyncValue.loading());

    final response = await _doctorsRepository.getDoctors();

    if (response is DataSuccess) {
      state = state.copyWith(doctorsResponse: AsyncValue.data(response.data));
    } else {
      state = state.copyWith(
          doctorsResponse: AsyncValue.error(
              response.exceptionResponse?.exceptionMessages.firstOrNull ?? "",
              StackTrace.current));
    }
  }

  void clearEntity() {
    ref.read(appointmentDataManagerProvider).reset();
  }
}
