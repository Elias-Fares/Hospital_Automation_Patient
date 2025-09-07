import '../../../core/base_dio/base_dio.dart';
import '../../../core/base_dio/data_state.dart';
import '../../../core/enums/params_values.dart';
import '../models/medical_record_model.dart';

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
