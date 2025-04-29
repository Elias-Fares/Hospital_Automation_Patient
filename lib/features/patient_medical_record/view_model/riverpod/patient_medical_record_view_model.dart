import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../state/patient_medical_record_state.dart';
part 'patient_medical_record_view_model.g.dart';

@riverpod
class PatientMedicalRecordViewModel extends _$PatientMedicalRecordViewModel {
  @override
  PatientMedicalRecordState build() => PatientMedicalRecordState();

}

