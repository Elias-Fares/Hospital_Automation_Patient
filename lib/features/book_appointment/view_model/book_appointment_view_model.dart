import 'package:patient_app/core/enums/params_values.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'book_appointment_state.dart';
part 'book_appointment_view_model.g.dart';

@riverpod
class BookAppointmentViewModel extends _$BookAppointmentViewModel {
  @override
  BookAppointmentState build() => BookAppointmentState(
      selectedProcedure: "1", paramsValue: ParamsValues.patient);

  void selectChoice(String id) {
    state = state.copyWith(selectedProcedure: id);
  }

  void selectParamValue(ParamsValues? value) {
    state = state.copyWith(paramsValue: value);
  }
}
