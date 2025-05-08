import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../state/book_appointment_state.dart';
part 'book_appointment_view_model.g.dart';

@riverpod
class BookAppointmentViewModel extends _$BookAppointmentViewModel {
  @override
  BookAppointmentState build() => BookAppointmentState(selectedProcedure: "1");

  void selectChoice(String id) {
    state = state.copyWith(selectedProcedure: id);
  }
}
