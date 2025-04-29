import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../state/patient_doctors_state.dart';
part 'patient_doctors_view_model.g.dart';

@riverpod
class PatientDoctorsViewModel extends _$PatientDoctorsViewModel {
  @override
  PatientDoctorsState build() => PatientDoctorsState();

}

