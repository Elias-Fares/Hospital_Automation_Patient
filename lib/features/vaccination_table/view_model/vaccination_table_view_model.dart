import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'vaccination_table_state.dart';
part 'vaccination_table_view_model.g.dart';

@riverpod
class VaccinationTableViewModel extends _$VaccinationTableViewModel {
  @override
  VaccinationTableState build() => VaccinationTableState();

}

