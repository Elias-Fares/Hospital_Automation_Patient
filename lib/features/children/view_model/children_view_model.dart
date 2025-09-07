import '../../../configuration/service_locator.dart';
import '../../../core/base_dio/data_state.dart';
import '../../../data/childern/repository/children_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'children_state.dart';
part 'children_view_model.g.dart';

@riverpod
class ChildrenViewModel extends _$ChildrenViewModel {
  @override
  ChildrenState build() => ChildrenState();

  final _childrenRepository = getIt<ChildrenRepository>();

  Future<void> getChildren({bool withRefresh = false}) async {
    if (withRefresh) {
      _childrenRepository.clearCache();
    }
    state = state.copyWith(childrenResponse: const AsyncValue.loading());

    final response = await _childrenRepository.getChildren();

    if (response is DataSuccess) {
      state = state.copyWith(childrenResponse: AsyncValue.data(response.data));
    } else {
      state = state.copyWith(
          childrenResponse: AsyncValue.error(
              response.exceptionResponse?.exceptionMessages.firstOrNull ?? "",
              StackTrace.current));
    }
  }
}
