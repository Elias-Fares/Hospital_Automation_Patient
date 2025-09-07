import '../../../core/enums/params_values.dart';
import '../data_source/medical_records_data_source.dart';

import '../../../core/base_dio/data_state.dart';

class MedicalRecordsRepository {
  final MedicalRecordsDataSource _medicalRecordsDataSource;

  MedicalRecordsRepository({required MedicalRecordsDataSource medicalRecordsDataSource})
      : _medicalRecordsDataSource = medicalRecordsDataSource;
  Future<DataState> getMedicalRecords({
    required ParamsValues type,
    String? childId,
  }) async {
   
    final response = _medicalRecordsDataSource.getMedicalRecords(type: type,childId: childId);

    return response;
  }

}
