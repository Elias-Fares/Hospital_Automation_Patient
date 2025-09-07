import '../../../core/base_dio/data_state.dart';
import '../data_source/vaccines_data_source.dart';

class VaccineRepository {
  final VaccinesDataSource _dataSource;

  VaccineRepository({required VaccinesDataSource dataSource})
      : _dataSource = dataSource;

  Future<DataState> getVaccines() async {
    final resposnse = await _dataSource.getVaccines();

    return resposnse;
  }

  Future<DataState> getVaccinesTable({required String childId}) async {
    final resposnse = await _dataSource.getVaccinesTable(childId: childId);

    return resposnse;
  }
}
