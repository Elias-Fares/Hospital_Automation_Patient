import 'package:patient_app/data/childern/data_source/children_data_source.dart';
import 'package:patient_app/data/doctors/data_source/doctors_data_source.dart';
import 'package:patient_app/data/perscriptions/data_source/prescriptions_data_source.dart';

import '../../../core/base_dio/data_state.dart';

class DoctorsRepository {
  final DoctorsDataSource _doctorsDataSource;

  DoctorsRepository({required DoctorsDataSource doctorsDataSource})
      : _doctorsDataSource = doctorsDataSource;

  Future<DataState> getDoctors() async {
    final response = await _doctorsDataSource.getDoctors();

    return response;
  }
}
