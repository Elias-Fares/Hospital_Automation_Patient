part of 'choose_appointment_date_view_model.dart';

class ChooseAppointmentDateState {
  final AsyncValue<String?>? freeAppointmentDate;

  ChooseAppointmentDateState({ this.freeAppointmentDate});

  ChooseAppointmentDateState copyWith(
      {AsyncValue<String?>? freeAppointmentDate}) {
    return ChooseAppointmentDateState(
        freeAppointmentDate: freeAppointmentDate ?? this.freeAppointmentDate);
  }
}
