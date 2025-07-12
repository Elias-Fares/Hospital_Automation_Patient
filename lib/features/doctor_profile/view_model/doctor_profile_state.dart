part of 'doctor_profile_view_model.dart';

class DoctorProfileState {
  final AsyncValue<DoctorProfileModel>? doctorProfileResponse;

  DoctorProfileState({this.doctorProfileResponse});

  DoctorProfileState copyWith(
          {AsyncValue<DoctorProfileModel>? doctorProfileResponse}) =>
      DoctorProfileState(
          doctorProfileResponse:
              doctorProfileResponse ?? this.doctorProfileResponse);
}
