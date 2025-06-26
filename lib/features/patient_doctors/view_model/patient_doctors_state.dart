part of 'patient_doctors_view_model.dart';
class PatientDoctorsState {
  final AsyncValue<List<DoctorModel>>? doctorsResponse;

  PatientDoctorsState({ this.doctorsResponse});

      PatientDoctorsState copyWith({
        AsyncValue<List<DoctorModel>>? doctorsResponse,
    }) => 
        PatientDoctorsState(
            doctorsResponse: doctorsResponse ?? this.doctorsResponse,
        );
}
