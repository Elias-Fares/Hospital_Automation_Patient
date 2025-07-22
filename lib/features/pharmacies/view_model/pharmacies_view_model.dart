import 'package:patient_app/configuration/service_locator.dart';
import 'package:patient_app/core/base_dio/data_state.dart';
import 'package:patient_app/data/pharmacies/models/pharmacy_model.dart';
import 'package:patient_app/data/pharmacies/repository/pharmacies_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'pharmacies_state.dart';
part 'pharmacies_view_model.g.dart';

@riverpod
class PharmaciesViewModel extends _$PharmaciesViewModel {
  @override
  PharmaciesState build() => PharmaciesState();

      final _pharmaciesRepository = getIt<PharmaciesRepository>();

  Future<void> getAllPharmacies() async {
    state = state.copyWith(pharmaciesResponse: const AsyncValue.loading());

    final response = await _pharmaciesRepository.getPharmacies();

    if (response is DataSuccess) {
      state =
          state.copyWith(pharmaciesResponse: AsyncValue.data(response.data));
    } else {
      state = state.copyWith(
          pharmaciesResponse: AsyncValue.error(
              response.exceptionResponse?.exceptionMessages.firstOrNull ?? "",
              StackTrace.current));
    }
  }

}

