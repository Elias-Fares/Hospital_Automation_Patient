import 'package:patient_app/core/base_dio/base_dio.dart';
import 'package:patient_app/core/base_dio/data_state.dart';
import 'package:patient_app/core/entities/book_appointment_entity.dart';
import 'package:patient_app/core/enums/params_values.dart';
import 'package:patient_app/data/appointments/models/appointment_model.dart';

class AppointmentsDataSource {
  final BaseDio _baseDio;

  AppointmentsDataSource({required BaseDio baseDio}) : _baseDio = baseDio;

  Future<DataState> getAppointments({
    required String type,
    String? childId,
    String? state,
  }) async {
    final querMap = {"type": type};
    if (childId != null) {
      querMap["child_id"] = childId;
    }
    if (state != null) {
      querMap["filter"] = state;
    }

    final response = await _baseDio.get<AppointmentModel>(
      subUrl: "/user/show-appointments",
      model: AppointmentModel(),
      needToken: true,
      queryParameters: querMap,
      isListOfModel: true,
    );

    return response;
  }

  Future<DataState> getFreeAppointmentTime(
      {required String date,
      required String doctorId,
      required String appointmentType}) async {
    final response = await _baseDio.basePost(
        subUrl: "/user/showFreeAppointments/$doctorId/$appointmentType",
        needToken: true,
        data: {"date": date});

    return response;
  }

  Future<DataState> bookAppointment(
      {required BookAppointmentEntity bookAppointmentEntity}) async {
    final Map<String, dynamic> queryMap = {};

    if (bookAppointmentEntity.childId != null &&
        bookAppointmentEntity.type == ParamsValues.child.value) {
      queryMap['child_id'] = bookAppointmentEntity.childId;
    }
    if (bookAppointmentEntity.vaccineId != null) {
      queryMap['vaccin_id'] = bookAppointmentEntity.vaccineId;
    }
    final response = await _baseDio.post(
      subUrl:
          "/user/confirm-an-order/${bookAppointmentEntity.doctorId}/${bookAppointmentEntity.appointmentType}",
      needToken: true,
      queryParameters: queryMap,
      data: {
        "date": bookAppointmentEntity.date,
        "time": bookAppointmentEntity.time,
        "type": bookAppointmentEntity.type,
      },
    );

    return response;
  }
}
