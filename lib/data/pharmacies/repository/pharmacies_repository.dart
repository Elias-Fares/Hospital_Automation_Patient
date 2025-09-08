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

  Future<DataState> getMedicineClass(
      {required String medicineName,
      required String composition1,
      String? composition2}) async {
    final resposnse = await _dataSource.getMedicineClass(
        medicineName: medicineName,
        composition1: composition1,
        composition2: composition2);

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
