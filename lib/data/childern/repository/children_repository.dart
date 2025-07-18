import 'package:patient_app/data/childern/data_source/children_data_source.dart';
import 'package:patient_app/data/childern/models/child_model.dart';

import '../../../core/base_dio/data_state.dart';

// not cached repository

// class ChildrenRepository {
//   final ChildrenDataSource _childrenDataSource;

//   ChildrenRepository({required ChildrenDataSource childrenDataSource})
//       : _childrenDataSource = childrenDataSource;

//   Future<DataState> getChildren() async {
//     final response = _childrenDataSource.getChildren();

//     return response;
//   }

//   Future<DataState> getChildProfile({
//     required String childId,
//   }) async {
//     final response = _childrenDataSource.getChildProfile(childId: childId);

//     return response;
//   }
// }


// the cached repository

class ChildrenRepository {
  final ChildrenDataSource _childrenDataSource;

  List<ChildModel>? _cachedChildren; // Or use your Child model type
  bool _isFetching = false; // Optional: prevent multiple parallel calls

  ChildrenRepository({required ChildrenDataSource childrenDataSource})
      : _childrenDataSource = childrenDataSource;

  Future<DataState> getChildren() async {
    // If we already have cached data, return it immediately
    if (_cachedChildren != null) {
      return DataSuccess(_cachedChildren);
    }

    // Prevent duplicate simultaneous fetches (optional safeguard)
    if (_isFetching) {
      // Wait for the fetch to complete (could be improved by storing a Future)
      return Future.delayed(const Duration(milliseconds: 100), getChildren);
    }

    _isFetching = true;

    final response = await _childrenDataSource.getChildren();
    _isFetching = false;

    if (response is DataSuccess) {
      _cachedChildren = response.data; // Cache the data for later
    }

    return response;
  }

  Future<DataState> getChildProfile({
    required String childId,
  }) async {
    // No caching here (you could add similar logic if needed)
    final response = await _childrenDataSource.getChildProfile(childId: childId);
    return response;
  }

  /// Optional: Clear the cache if you want to force a refresh later
  void clearCache() {
    _cachedChildren = null;
  }
}
