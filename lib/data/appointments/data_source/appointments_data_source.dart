import 'package:patient_app/core/base_dio/base_dio.dart';
import 'package:patient_app/core/base_dio/data_state.dart';
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
}
