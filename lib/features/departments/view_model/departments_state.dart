part of 'departments_view_model.dart';

class DepartmentsState {
  final AsyncValue<List<DepartmentModel>>? departmentsResponse;

  DepartmentsState({this.departmentsResponse});

  DepartmentsState copyWith(
          {AsyncValue<List<DepartmentModel>>? departmentsResponse}) =>
      DepartmentsState(
          departmentsResponse: departmentsResponse ?? this.departmentsResponse);
}
