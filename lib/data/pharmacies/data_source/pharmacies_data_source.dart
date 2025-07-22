import 'package:patient_app/core/base_dio/base_dio.dart';
import 'package:patient_app/core/base_dio/data_state.dart';
import 'package:patient_app/core/models/medicine_model.dart';
import 'package:patient_app/data/pharmacies/models/pharmacy_details_model.dart';
import 'package:patient_app/data/pharmacies/models/pharmacy_model.dart';

class PharmaciesDataSource {
  final BaseDio _baseDio;

  PharmaciesDataSource({required BaseDio baseDio}) : _baseDio = baseDio;

  Future<DataState> getPharmacies() async {
    final resposnse = await _baseDio.get<PharmacyModel>(
        subUrl: "/user/show-pharmacies",
        model: PharmacyModel(),
        needToken: true,
        isListOfModel: true);

    return resposnse;
  }

  Future<DataState> getPharmacyDetails({required String id}) async {
    final resposnse = await _baseDio.get<PharmacyDetailsModel>(
        subUrl: "/user/pharmacy-details/$id",
        model: PharmacyDetailsModel(),
        needToken: true,
        isListOfModel: true);

    if (resposnse is DataSuccess) {
      final List<PharmacyDetailsModel> models = resposnse.data;

      return DataSuccess(models.elementAtOrNull(0));
    } else {
      return resposnse;
    }

    // return resposnse;
  }

  Future<DataState> searchForMedicine({required String searchWord}) async {
    final resposnse = await _baseDio.get<MedicineModel>(
        subUrl: "/user/search-for-medicine",
        model: MedicineModel(),
        needToken: true,
        isListOfModel: true,
        queryParameters: {
          "name": searchWord,
        });

    return resposnse;
  }
}
