import 'package:patient_app/configuration/service_locator.dart';
import 'package:patient_app/core/base_dio/data_state.dart';
import 'package:patient_app/data/doctors/repository/doctors_repository.dart';
import 'package:patient_app/data/vaccines/models/vaccine_model.dart';
import 'package:patient_app/data/vaccines/repository/vaccine_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'vaccines_view_model.g.dart';
part 'vaccines_state.dart';

@riverpod
class VaccinesViewModel extends _$VaccinesViewModel {
  @override
  VaccinesState build() => VaccinesState();

        final _vaccinesRepository = getIt<VaccineRepository>();

  Future<void> getVaccines() async {
    state = state.copyWith(vaccinesResponse: const AsyncValue.loading());

    final response = await _vaccinesRepository.getVaccines();

    if (response is DataSuccess) {
      state =
          state.copyWith(vaccinesResponse: AsyncValue.data(response.data));
    } else {
      state = state.copyWith(
          vaccinesResponse: AsyncValue.error(
              response.exceptionResponse?.exceptionMessages.firstOrNull ?? "",
              StackTrace.current));
    }
  }

}

