import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../data/perscriptions/models/prescription_model.dart';

class PatientPrescriptionState {
  final AsyncValue<List<PrescriptionModel>>? prescriptionsResponse;

  PatientPrescriptionState({ this.prescriptionsResponse});

  PatientPrescriptionState copyWith(
      {AsyncValue<List<PrescriptionModel>>? prescriptionsResponse}) {
    return PatientPrescriptionState(
        prescriptionsResponse:
            prescriptionsResponse ?? this.prescriptionsResponse);
  }
}
