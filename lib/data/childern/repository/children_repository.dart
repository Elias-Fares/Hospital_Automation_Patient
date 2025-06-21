import 'package:patient_app/data/childern/data_source/children_data_source.dart';

import '../../../core/base_dio/data_state.dart';

class ChildrenRepository {
  final ChildrenDataSource _childrenDataSource;

  ChildrenRepository({required ChildrenDataSource childrenDataSource})
      : _childrenDataSource = childrenDataSource;

  Future<DataState> getChildren() async {
    final response = _childrenDataSource.getChildren();

    return response;
  }

  Future<DataState> getChildProfile({
    required String childId,
  }) async {
    final response = _childrenDataSource.getChildProfile(childId: childId);

    return response;
  }
}
