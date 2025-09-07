import '../data_source/doctors_data_source.dart';
import '../../../core/base_dio/data_state.dart';

class DoctorsRepository {
  final DoctorsDataSource _doctorsDataSource;

  DoctorsRepository({required DoctorsDataSource doctorsDataSource})
      : _doctorsDataSource = doctorsDataSource;

  Future<DataState> getDoctors() async {
    final response = await _doctorsDataSource.getDoctors();

    return response;
  }

  Future<DataState> getDoctorProfile({required String doctorId}) async {
    final response = _doctorsDataSource.getDoctorProfile(doctorId: doctorId);

    return response;
  }

  Future<DataState> getAllDepartments() async {
    final response = await _doctorsDataSource.getAllDepartments();

    return response;
  }

  Future<DataState> getDepartmentDetails({required String id}) async {
    final response = await _doctorsDataSource.getDepartmentDetails(id: id);
    return response;
  }
}
