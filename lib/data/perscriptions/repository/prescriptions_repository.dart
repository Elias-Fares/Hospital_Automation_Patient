import 'package:patient_app/data/childern/data_source/children_data_source.dart';
import 'package:patient_app/data/perscriptions/data_source/prescriptions_data_source.dart';

import '../../../core/base_dio/data_state.dart';

class PrescriptionsRepository {
  final PrescriptionsDataSource _prescriptionsDataSource;

  PrescriptionsRepository({required PrescriptionsDataSource prescriptionsDataSource})
      : _prescriptionsDataSource = prescriptionsDataSource;


}
