import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'medical_record_appointments_state.dart';
part 'medical_record_appointments_view_model.g.dart';

@riverpod
class MedicalRecordAppointmentsViewModel extends _$MedicalRecordAppointmentsViewModel {
  @override
  MedicalRecordAppointmentsState build() => MedicalRecordAppointmentsState();

}

