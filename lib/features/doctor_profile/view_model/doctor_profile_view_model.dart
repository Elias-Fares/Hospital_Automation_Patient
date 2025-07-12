import 'package:patient_app/configuration/service_locator.dart';
import 'package:patient_app/core/base_dio/data_state.dart';
import 'package:patient_app/data/doctors/models/doctor_profile_model.dart';
import 'package:patient_app/data/doctors/repository/doctors_repository.dart';
import 'package:patient_app/data/profile/repository/profile_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'doctor_profile_view_model.g.dart';
part 'doctor_profile_state.dart';

@riverpod
class DoctorProfileViewModel extends _$DoctorProfileViewModel {
  @override
  DoctorProfileState build() => DoctorProfileState();

  final _doctorsRepository = getIt<DoctorsRepository>();

  Future<void> getDoctorProfile({required String doctorId}) async {
    state = state.copyWith(doctorProfileResponse: const AsyncValue.loading());
    final response =
        await _doctorsRepository.getDoctorProfile(doctorId: doctorId);
    if (response is DataSuccess) {
      state =
          state.copyWith(doctorProfileResponse: AsyncValue.data(response.data));
    } else {
      state = state.copyWith(
          doctorProfileResponse: AsyncValue.error(
              response.exceptionResponse?.exceptionMessages.firstOrNull ?? "",
              StackTrace.current));
    }
  }
}
