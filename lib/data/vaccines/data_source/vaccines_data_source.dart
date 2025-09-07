import '../../../core/base_dio/base_dio.dart';
import '../../../core/base_dio/data_state.dart';
import '../models/vaccine_model.dart';
import '../models/vaccine_table_model.dart';

class VaccinesDataSource {
  final BaseDio _baseDio;

  VaccinesDataSource({required BaseDio baseDio}) : _baseDio = baseDio;

  Future<DataState> getVaccines() async {
    final resposnse = await _baseDio.get<VaccineModel>(
        subUrl: "/user/show-vaccines",
        model: VaccineModel(),
        needToken: true,
        isListOfModel: true);

    return resposnse;
  }

  Future<DataState> getVaccinesTable({required String childId}) async {
    final resposnse = await _baseDio.get<VaccineTableModel>(
        subUrl: "/user/show-vaccination-table-for-single-child/$childId",
        model: VaccineTableModel(),
        needToken: true,
        isListOfModel: true);

    return resposnse;
  }
}
