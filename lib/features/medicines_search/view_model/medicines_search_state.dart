part of 'medicines_search_view_model.dart';

class MedicinesSearchState {
  final AsyncValue<List<MedicineModel>>? medicineSearchResponse;

  MedicinesSearchState({ this.medicineSearchResponse});

  MedicinesSearchState copyWith ({
    AsyncValue<List<MedicineModel>>? medicineSearchResponse
  }) => MedicinesSearchState(medicineSearchResponse: medicineSearchResponse ?? this.medicineSearchResponse);
}
