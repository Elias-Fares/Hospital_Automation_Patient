import '../../../core/base_dio/data_state.dart';
import '../data_source/pharmacies_data_source.dart';

class PharmaciesRepository {
  final PharmaciesDataSource _dataSource;

  PharmaciesRepository({required PharmaciesDataSource dataSource})
      : _dataSource = dataSource;

  Future<DataState> getPharmacies() async {
    final resposnse = await _dataSource.getPharmacies();

    return resposnse;
  }

  Future<DataState> getPharmacyDetails({required String id}) async {
    final resposnse = await _dataSource.getPharmacyDetails(id: id);

    return resposnse;
  }

  Future<DataState> searchForMedicine({required String searchWord}) async {
    final resposnse =
        await _dataSource.searchForMedicine(searchWord: searchWord);

    return resposnse;
  }
}
