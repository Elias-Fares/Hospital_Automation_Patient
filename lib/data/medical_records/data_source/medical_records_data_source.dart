import 'package:patient_app/core/base_dio/base_dio.dart';
import 'package:patient_app/core/base_dio/data_state.dart';
import 'package:patient_app/core/enums/params_values.dart';
import 'package:patient_app/data/medical_records/models/medical_record_model.dart';

class MedicalRecordsDataSource {
  final BaseDio _baseDio;

  MedicalRecordsDataSource({required BaseDio baseDio}) : _baseDio = baseDio;

  Future<DataState> getMedicalRecords({
    required ParamsValues type,
    String? childId,
  }) async {
    final Map<String, dynamic> queryMap = {
      "type": type.value,
    };
    if (childId != null) {
      queryMap["child_id"] = childId;
    }
    final response = _baseDio.get<MedicalRecordModel>(
        subUrl: "/user/get-medical-record",
        model: MedicalRecordModel(),
        isListOfModel: true,
        queryParameters: queryMap,
        needToken: true);

    return response;
  }
}
