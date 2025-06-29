part of 'medical_record_view_model.dart';

class MedicalRecordState {
  final AsyncValue<List<MedicalRecordModel>>? medicalRecordsResponse;

  MedicalRecordState({ this.medicalRecordsResponse});

  MedicalRecordState copyWith({AsyncValue<List<MedicalRecordModel>>? medicalRecordsResponse}) {
    return MedicalRecordState(
        medicalRecordsResponse:
            medicalRecordsResponse ?? this.medicalRecordsResponse);
  }
}
