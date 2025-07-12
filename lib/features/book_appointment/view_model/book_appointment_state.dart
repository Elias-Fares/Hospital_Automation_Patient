import 'package:patient_app/core/enums/params_values.dart';

class BookAppointmentState {
  final String selectedProcedure;
  final ParamsValues paramsValue;

  BookAppointmentState({required this.selectedProcedure, required this.paramsValue});

  BookAppointmentState copyWith({
    String? selectedProcedure,
    ParamsValues? paramsValue
  }) {
    return BookAppointmentState(
      selectedProcedure: selectedProcedure ?? this.selectedProcedure,
      paramsValue: paramsValue ??  this.paramsValue
      
    );
  }
}
