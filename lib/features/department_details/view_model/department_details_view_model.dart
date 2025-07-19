import 'package:patient_app/configuration/service_locator.dart';
import 'package:patient_app/core/base_dio/data_state.dart';
import 'package:patient_app/data/doctors/models/department_model.dart';
import 'package:patient_app/data/doctors/repository/doctors_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'department_details_view_model.g.dart';
part 'department_details_state.dart';

@riverpod
class DepartmentDetailsViewModel extends _$DepartmentDetailsViewModel {
  @override
  DepartmentDetailsState build() => DepartmentDetailsState();
  final _doctorsRepository = getIt<DoctorsRepository>();

  Future<void> getAllDepartments({required String id}) async {
    state =
        state.copyWith(departmentDetailsResponse: const AsyncValue.loading());

    final response = await _doctorsRepository.getDepartmentDetails(id: id);

    if (response is DataSuccess) {
      state = state.copyWith(
          departmentDetailsResponse: AsyncValue.data(response.data));
    } else {
      state = state.copyWith(
          departmentDetailsResponse: AsyncValue.error(
              response.exceptionResponse?.exceptionMessages.firstOrNull ?? "",
              StackTrace.current));
    }
  }
}
