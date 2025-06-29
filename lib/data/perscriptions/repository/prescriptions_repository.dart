import 'package:patient_app/data/childern/data_source/children_data_source.dart';
import 'package:patient_app/data/perscriptions/data_source/prescriptions_data_source.dart';

import '../../../core/base_dio/data_state.dart';

class PrescriptionsRepository {
  final PrescriptionsDataSource _prescriptionsDataSource;

  PrescriptionsRepository({required PrescriptionsDataSource prescriptionsDataSource})
      : _prescriptionsDataSource = prescriptionsDataSource;

  Future<DataState> getPrescriptionsPharmacy({
     String? pharmacyId,
    required String type,
  }) async {
    final response = _prescriptionsDataSource.getPrescriptionsPharmacy(pharmacyId: pharmacyId, type: type);

    return response;
  }
  Future<DataState> getChildPrescription({
     String? childId,
    required String type,
  }) async {
    final response = _prescriptionsDataSource.getChildPrescription(childId: childId, type: type);

    return response;
  }

  Future<DataState> getPatientPrescription({

     String? type,
  }) async {
    final response = _prescriptionsDataSource.getPatientPrescription(type: type,);

    return response;
  }
}
