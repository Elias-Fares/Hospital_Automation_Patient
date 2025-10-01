import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'medical_record_prescriptions_state.dart';
part 'medical_record_prescriptions_view_model.g.dart';

@riverpod
class MedicalRecordPrescriptionsViewModel extends _$MedicalRecordPrescriptionsViewModel {
  @override
  MedicalRecordPrescriptionsState build() => MedicalRecordPrescriptionsState();

}

