import 'package:patient_app/core/base_dio/base_dio.dart';
import 'package:patient_app/core/base_dio/data_state.dart';
import 'package:patient_app/core/enums/params_values.dart';
import 'package:patient_app/data/childern/models/child_model.dart';
import 'package:patient_app/data/childern/models/child_profile_model.dart';
import 'package:patient_app/data/doctors/models/doctor_model.dart';

class DoctorsDataSource {
  final BaseDio _baseDio;

  DoctorsDataSource({required BaseDio baseDio}) : _baseDio = baseDio;

  Future<DataState> getDoctors() async {
    final response =await _baseDio.get<DoctorModel>(
        subUrl: "/user/list-of-doctors",
        model: DoctorModel(),
        isListOfModel: true,
        needToken: true);

    return response;
  }
}
