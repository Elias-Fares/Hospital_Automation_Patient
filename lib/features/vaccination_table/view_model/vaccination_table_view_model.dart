import 'package:dio/dio.dart';

import '../../../configuration/service_locator.dart';
import '../../../core/base_dio/data_state.dart';
import '../../../data/vaccines/models/vaccine_table_model.dart';
import '../../../data/vaccines/repository/vaccine_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'vaccination_table_state.dart';
part 'vaccination_table_view_model.g.dart';

@riverpod
class VaccinationTableViewModel extends _$VaccinationTableViewModel {
  @override
  VaccinationTableState build() {
    return VaccinationTableState();
  }

  final _vaccinesRepository = getIt<VaccineRepository>();

  Future<void> getVaccinesTable({required String childId}) async {
    state = state.copyWith(vaccinesTableResposne: const AsyncValue.loading());

    final response =
        await _vaccinesRepository.getVaccinesTable(childId: childId);

    if (!ref.mounted) return;

    if (response is DataSuccess) {
      state =
          state.copyWith(vaccinesTableResposne: AsyncValue.data(response.data));
    } else {
      state = state.copyWith(
          vaccinesTableResposne: AsyncValue.error(
              response.exceptionResponse?.exceptionMessages.firstOrNull ?? "",
              StackTrace.current));
    }
  }
}
