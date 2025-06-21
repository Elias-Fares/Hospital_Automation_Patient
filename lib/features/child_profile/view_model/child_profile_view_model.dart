import 'package:patient_app/configuration/service_locator.dart';
import 'package:patient_app/core/base_dio/data_state.dart';
import 'package:patient_app/data/auth/repository/auth_repository.dart';
import 'package:patient_app/data/childern/repository/children_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'child_profile_view_model.g.dart';

@riverpod
class ChildProfileViewModel extends _$ChildProfileViewModel {
  @override
  AsyncValue? build() => null;

  final _childrenRepository = getIt<ChildrenRepository>();

  Future<void> getChildProfile({
    required String childId,
  }) async {
    state = const AsyncValue.loading();

    final response =
        await _childrenRepository.getChildProfile(childId: childId);
    if (response is DataSuccess) {
      state = AsyncValue.data(response.data);
    } else {
      state = AsyncValue.error(
          response.exceptionResponse?.exceptionMessages.firstOrNull ?? "",
          StackTrace.current);
    }
  }
}
