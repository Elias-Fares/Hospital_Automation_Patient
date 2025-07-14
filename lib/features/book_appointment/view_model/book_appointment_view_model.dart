import 'package:patient_app/core/enums/params_values.dart';
import 'package:patient_app/core/managers/appointment_data_manager.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'book_appointment_state.dart';
part 'book_appointment_view_model.g.dart';

@riverpod
class BookAppointmentViewModel extends _$BookAppointmentViewModel {
  @override
  BookAppointmentState build() => BookAppointmentState(
      selectedProcedure: "", paramsValue: ParamsValues.patient);

  void selectChoice(String id) {
    state = state.copyWith(selectedProcedure: id);
    ref
        .read(appointmentDataManagerProvider)
        .setAppointmentType(appointmentType: id);
  }

  void selectParamValue(ParamsValues? value) {
    state = state.copyWith(paramsValue: value);
    ref.read(appointmentDataManagerProvider).setType(type: value?.value);
  }
}
