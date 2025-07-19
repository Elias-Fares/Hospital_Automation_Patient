import 'package:patient_app/core/base_dio/base_dio.dart';
import 'package:patient_app/core/base_dio/data_state.dart';
import 'package:patient_app/core/enums/params_values.dart';
import 'package:patient_app/data/childern/models/child_model.dart';
import 'package:patient_app/data/childern/models/child_profile_model.dart';
import 'package:patient_app/core/models/doctor_model.dart';
import 'package:patient_app/data/doctors/models/department_model.dart';
import 'package:patient_app/data/doctors/models/doctor_profile_model.dart';

class DoctorsDataSource {
  final BaseDio _baseDio;

  DoctorsDataSource({required BaseDio baseDio}) : _baseDio = baseDio;

  Future<DataState> getDoctors() async {
    final response = await _baseDio.get<DoctorModel>(
        subUrl: "/user/list-of-doctors",
        model: DoctorModel(),
        isListOfModel: true,
        needToken: true);

    return response;
  }

  Future<DataState> getDoctorProfile({required String doctorId}) async {
    final response = await _baseDio.get<DoctorProfileModel>(
        subUrl: "/user/get-profile-for",
        model: DoctorProfileModel(),
        queryParameters: {"type": ParamsValues.doctor.value, "_id": doctorId},
        needToken: true);

    return response;
  }

  Future<DataState> getAllDepartments() async {
    final response = await _baseDio.get<DepartmentModel>(
        subUrl: "/user/show-all-clinics",
        model: DepartmentModel(),
        isListOfModel: true,
        needToken: true);

    return response;
  }

  Future<DataState> getDepartmentDetails({required String id}) async {
    final response = await _baseDio.get<DepartmentModel>(
        subUrl: "/user/get-details-for-clinic/$id",
        model: DepartmentModel(),
        needToken: true);

    return response;
  }
}
