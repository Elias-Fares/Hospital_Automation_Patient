part of 'choose_appointment_date_view_model.dart';

class ChooseAppointmentDateState {
  final AsyncValue<String?>? freeAppointmentDate;
  final AsyncValue? bookAppointmentResponse;
  final bool showBookAppointmentButton;

  ChooseAppointmentDateState({
    this.freeAppointmentDate,
    required this.showBookAppointmentButton,
     this.bookAppointmentResponse,
  });

  ChooseAppointmentDateState copyWith(
      {AsyncValue<String?>? freeAppointmentDate,
      bool? showBookAppointmentButton,
      AsyncValue? bookAppointmentResponse}) {
    return ChooseAppointmentDateState(
        freeAppointmentDate: freeAppointmentDate ?? this.freeAppointmentDate,
        showBookAppointmentButton:
            showBookAppointmentButton ?? this.showBookAppointmentButton,
        bookAppointmentResponse:
            bookAppointmentResponse ?? this.bookAppointmentResponse);
  }
}
