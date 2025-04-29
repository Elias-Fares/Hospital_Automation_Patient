import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../state/patient_prescription_state.dart';
part 'patient_prescription_view_model.g.dart';

@riverpod
class PatientPrescriptionViewModel extends _$PatientPrescriptionViewModel {
  @override
  PatientPrescriptionState build() => PatientPrescriptionState();

}

