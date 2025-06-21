import 'package:patient_app/core/base_dio/data_state.dart';
import 'package:patient_app/data/appointments/data_source/appointments_data_source.dart';

class AppointmentRepository {
  final AppointmentsDataSource _appointmentsDataSource;

  AppointmentRepository(
      {required AppointmentsDataSource appointmentsDataSource})
      : _appointmentsDataSource = appointmentsDataSource;

  Future<DataState> getAppointments({
    required String type,
    String? childId,
    String? state,
  }) async {
    final response = _appointmentsDataSource.getAppointments(
        type: type, childId: childId, state: state);

    return response;
  }
}
