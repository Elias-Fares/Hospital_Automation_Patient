import 'package:patient_app/core/base_dio/base_dio.dart';
import 'package:patient_app/core/base_dio/data_state.dart';
import 'package:patient_app/core/enums/params_values.dart';
import 'package:patient_app/data/childern/models/child_model.dart';
import 'package:patient_app/data/childern/models/child_profile_model.dart';

class PrescriptionsDataSource {
  final BaseDio _baseDio;

  PrescriptionsDataSource({required BaseDio baseDio}) : _baseDio = baseDio;

  // Future<DataState> getChildren() async {
  //   final response = _baseDio.get<ChildModel>(
  //       subUrl: "/user/get-children",
  //       model: ChildModel(),
  //       isListOfModel: true,
  //       needToken: true);

  //   return response;
  // }
  // Future<DataState> getChildProfile({
  //   required String childId,
  // }) async {
  //   final response = _baseDio.baseGet<ChildProfileModel>(
  //       subUrl: "/user/get-profile-for",
  //       model: ChildProfileModel(),
  //       queryParameters: {
  //         "type": ParamsValues.child.value,
  //         "_id":childId,
  //       },
  //       needToken: true);

  //   return response;
  // }

}
