part of 'vaccination_table_view_model.dart';

class VaccinationTableState {
  final AsyncValue<List<VaccineTableModel>>? vaccinesTableResposne;

  VaccinationTableState({ this.vaccinesTableResposne});

  VaccinationTableState copyWith ({AsyncValue<List<VaccineTableModel>>? vaccinesTableResposne}) => VaccinationTableState(vaccinesTableResposne: vaccinesTableResposne ?? this.vaccinesTableResposne);
  
}
