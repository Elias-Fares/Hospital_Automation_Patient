import 'package:patient_app/core/base_dio/base_dio.dart';
import 'package:patient_app/core/base_dio/data_state.dart';
import 'package:patient_app/data/vaccines/models/vaccine_model.dart';

class VaccinesDataSource {
  final BaseDio _baseDio;

  VaccinesDataSource({required BaseDio baseDio}) : _baseDio = baseDio;

  Future<DataState> getVaccines() async {
    final resposnse = await  _baseDio.get<VaccineModel>(
        subUrl: "/user/show-vaccines",
        model: VaccineModel(),
        needToken: true,
        isListOfModel: true);

    return resposnse;
  }
}
