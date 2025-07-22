import 'package:patient_app/core/managers/appointment_data_manager.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'vaccine_details_state.dart';
part 'vaccine_details_view_model.g.dart';

@riverpod
class VaccineDetailsViewModel extends _$VaccineDetailsViewModel {
  @override
  VaccineDetailsState build() => VaccineDetailsState();

  void setVaccineId({required String vaccineId}) {
    ref.read(appointmentDataManagerProvider).setVaccineId(vaccineId: vaccineId);
  }
}
