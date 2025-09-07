import '../../../core/base_dio/base_dio.dart';
import '../../../core/base_dio/data_state.dart';
import '../../../core/enums/params_values.dart';
import '../models/child_model.dart';
import '../models/child_profile_model.dart';

class ChildrenDataSource {
  final BaseDio _baseDio;

  ChildrenDataSource({required BaseDio baseDio}) : _baseDio = baseDio;

  Future<DataState> getChildren() async {
    final response = await _baseDio.get<ChildModel>(
        subUrl: "/user/get-children",
        model: ChildModel(),
        isListOfModel: true,
        needToken: true);

    return response;
  }
  Future<DataState> getChildProfile({
    required String childId,
  }) async {
    final response =await _baseDio.baseGet<ChildProfileModel>(
        subUrl: "/user/get-profile-for",
        model: ChildProfileModel(),
        queryParameters: {
          "type": ParamsValues.child.value,
          "_id":childId,
        },
        needToken: true);

    return response;
  }

}
