import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'departments_state.dart';
part 'departments_view_model.g.dart';

@riverpod
class DepartmentsViewModel extends _$DepartmentsViewModel {
  @override
  DepartmentsState build() => DepartmentsState();

}

