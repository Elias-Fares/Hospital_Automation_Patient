import '../../../configuration/service_locator.dart';
import '../../../core/base_dio/data_state.dart';
import '../../../core/models/medicine_model.dart';
import '../../../data/pharmacies/repository/pharmacies_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'medicines_search_state.dart';
part 'medicines_search_view_model.g.dart';

@riverpod
class MedicinesSearchViewModel extends _$MedicinesSearchViewModel {
  @override
  MedicinesSearchState build() => MedicinesSearchState();

  final _pharmacyRepository = getIt<PharmaciesRepository>();

  Future<void> searchForMedicine({required String searchWord}) async {
    state = state.copyWith(medicineSearchResponse: const AsyncValue.loading());

    final response =
        await _pharmacyRepository.searchForMedicine(searchWord: searchWord);

    if (response is DataSuccess) {
      state = state.copyWith(
          medicineSearchResponse: AsyncValue.data(response.data));
    } else {
      state = state.copyWith(
          medicineSearchResponse: AsyncValue.error(
              response.exceptionResponse?.exceptionMessages.firstOrNull ?? "",
              StackTrace.current));
    }
  }
}
