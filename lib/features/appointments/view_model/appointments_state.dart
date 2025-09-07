import '../../../data/appointments/models/appointment_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

class AppointmentsState {
  final AsyncValue<List<AppointmentModel>>? upcomingAppointments;
  final AsyncValue<List<AppointmentModel>>? passedAppointments;
  final AsyncValue<List<AppointmentModel>>? missedAppointments;

  AppointmentsState({
    this.upcomingAppointments,
    this.passedAppointments,
    this.missedAppointments,
  });

  AppointmentsState copyWith({
    AsyncValue<List<AppointmentModel>>? upcomingAppointments,
    AsyncValue<List<AppointmentModel>>? passedAppointments,
    AsyncValue<List<AppointmentModel>>? missedAppointments,
  }) {
    return AppointmentsState(
      upcomingAppointments: upcomingAppointments ?? this.upcomingAppointments,
      passedAppointments: passedAppointments ?? this.passedAppointments,
      missedAppointments: missedAppointments ?? this.missedAppointments,
    );
  }
}
