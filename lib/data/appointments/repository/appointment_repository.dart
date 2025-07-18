import 'package:dio/dio.dart';
import 'package:patient_app/core/base_dio/data_state.dart';
import 'package:patient_app/core/base_dio/errors_types_enum.dart';
import 'package:patient_app/core/entities/book_appointment_entity.dart';
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

  Future<DataState> getFreeAppointmentTime(
      {required String date,
      required String doctorId,
      required String appointmentType}) async {
    final response = await _appointmentsDataSource.getFreeAppointmentTime(
        date: date, appointmentType: appointmentType, doctorId: doctorId);

    if (response is DataSuccess) {
      final Map<String, dynamic> responseMap = response.data;

      final responseText = responseMap.values.toList().join();

      return DataSuccess(responseText);
    } else {
      return DataFailed(response.exceptionResponse ??
          ExceptionResponse(
              statusCode: -1, exceptionMessages: ["Something went wrong"]));
    }
  }

  Future<DataState> bookAppointment(
      {required BookAppointmentEntity bookAppointmentEntity}) async {



    final response = await _appointmentsDataSource.bookAppointment(
        bookAppointmentEntity: bookAppointmentEntity);

    return response;
  }
}
