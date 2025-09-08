import '../../../core/base_dio/base_dio.dart';
import '../../../core/base_dio/data_state.dart';
import '../../../core/models/medicine_model.dart';
import '../models/pharmacy_details_model.dart';
import '../models/pharmacy_model.dart';
import '../models/result_class_model.dart';

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
    );

    return resposnse;
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

  Future<DataState> getMedicineClass(
      {required String medicineName,
      required String composition1,
      String? composition2}) async {
    final bodyMap = {"name": medicineName, "composition1": composition1};

    if (composition2 != null && composition2.isNotEmpty) {
      bodyMap["composition2"] = composition2;
    }
    final resposnse = await _baseDio.post<ResultClassModel>(
        subUrl: "/user/predict-for-medicine-class",
        model: ResultClassModel(),
        needToken: true,
        data: bodyMap);

    return resposnse;
  }
}
