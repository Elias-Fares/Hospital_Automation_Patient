import '../../../core/base_dio/base_dio.dart';
import '../../../core/base_dio/data_state.dart';
import '../models/prescription_model.dart';

class PrescriptionsDataSource {
  final BaseDio _baseDio;

  PrescriptionsDataSource({required BaseDio baseDio}) : _baseDio = baseDio;

  Future<DataState> getPrescriptionsPharmacy({
    String? pharmacyId,
    required String type,
  }) async {
    final response = _baseDio.get<PrescriptionModel>(
        subUrl: "/user/get-prescription-pharmacy/$pharmacyId",
        model: PrescriptionModel(),
        isListOfModel: true,
        queryParameters: {
          "type": type,
        },
        needToken: true);

    return response;
  }

  Future<DataState> getChildPrescription({
    String? childId,
    required String type,
  }) async {
    final response = _baseDio.get<PrescriptionModel>(
        subUrl: "/user/show-prescriptions-for-child/$childId",
        model: PrescriptionModel(),
        isListOfModel: true,
        queryParameters: {
          "type": type,
        },
        needToken: true);

    return response;
  }

  Future<DataState> getPatientPrescription({
    String? type,
  }) async {
    final response = _baseDio.get<PrescriptionModel>(
        subUrl: "/user/get-prescription-for-patient",
        model: PrescriptionModel(),
        isListOfModel: true,
        // queryParameters: {
        //   "type": type,
        // },
        needToken: true);

    return response;
  }
}
