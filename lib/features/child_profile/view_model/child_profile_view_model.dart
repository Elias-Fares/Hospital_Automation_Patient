import 'package:flutter/material.dart';
import '../../../configuration/service_locator.dart';
import '../../../core/base_dio/data_state.dart';
import '../../../data/childern/models/child_profile_model.dart';
import '../../../data/childern/repository/children_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'child_profile_view_model.g.dart';

@riverpod
class ChildProfileViewModel extends _$ChildProfileViewModel {
  @override
  AsyncValue<ChildProfileModel>? build() => null;

  final _childrenRepository = getIt<ChildrenRepository>();

  Future<void> getChildProfile({
    required String childId,
  }) async {
    state = const AsyncValue.loading();

    debugPrint("debugger ${state.runtimeType}");

    final response =
        await _childrenRepository.getChildProfile(childId: childId);

    if (!ref.mounted) return;

    
    if (response is DataSuccess) {
      state = AsyncValue.data(response.data);
    } else {
      state = AsyncValue.error(
          response.exceptionResponse?.exceptionMessages.firstOrNull ?? "",
          StackTrace.current);
    }
  }
}
