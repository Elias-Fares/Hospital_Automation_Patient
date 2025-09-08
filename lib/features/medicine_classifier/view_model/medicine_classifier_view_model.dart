import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../configuration/service_locator.dart';
import '../../../core/base_dio/data_state.dart';
import '../../../data/pharmacies/repository/pharmacies_repository.dart';
import 'medicine_classifier_state.dart';
part 'medicine_classifier_view_model.g.dart';

@riverpod
class MedicineClassifierViewModel extends _$MedicineClassifierViewModel {
  @override
  MedicineClassifierState build() => MedicineClassifierState();

  final _pharmacyRepository = getIt<PharmaciesRepository>();

  Future<void> getMedicineClass(
      {required String medicineName,
      required String composition1,
      String? composition2}) async {
    state = state.copyWith(resultClassResponse: const AsyncValue.loading());

    final response = await _pharmacyRepository.getMedicineClass(
        medicineName: medicineName,
        composition1: composition1,
        composition2: composition2);

    if (response is DataSuccess) {
      state =
          state.copyWith(resultClassResponse: AsyncValue.data(response.data));
    } else {
      state = state.copyWith(
          resultClassResponse: AsyncValue.error(
              response.exceptionResponse?.exceptionMessages.firstOrNull ?? "",
              StackTrace.current));
    }
  }
}
