import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/pharmacies/models/result_class_model.dart';

class MedicineClassifierState {
  final AsyncValue<ResultClassModel>? resultClassResponse;

  MedicineClassifierState({this.resultClassResponse});

  MedicineClassifierState copyWith({
    AsyncValue<ResultClassModel>? resultClassResponse,
  }) {
    return MedicineClassifierState(
      resultClassResponse: resultClassResponse ?? this.resultClassResponse,
    );
  }
}
