import 'package:patient_app/core/base_dio/base_dio.dart';
import 'package:patient_app/core/base_dio/data_state.dart';
import 'package:patient_app/core/enums/params_values.dart';
import 'package:patient_app/data/childern/models/child_model.dart';
import 'package:patient_app/data/childern/models/child_profile_model.dart';
import 'package:patient_app/data/perscriptions/models/prescription_model.dart';

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
