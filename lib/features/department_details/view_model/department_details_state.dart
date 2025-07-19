part of 'department_details_view_model.dart';

class DepartmentDetailsState {
  final AsyncValue<DepartmentModel>? departmentDetailsResponse;

  DepartmentDetailsState({this.departmentDetailsResponse});

  DepartmentDetailsState copyWith(
          {AsyncValue<DepartmentModel>? departmentDetailsResponse}) =>
      DepartmentDetailsState(
          departmentDetailsResponse:
              departmentDetailsResponse ?? this.departmentDetailsResponse);
}
