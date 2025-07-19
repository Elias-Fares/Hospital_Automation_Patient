import 'package:patient_app/configuration/service_locator.dart';
import 'package:patient_app/core/base_dio/data_state.dart';
import 'package:patient_app/data/doctors/models/department_model.dart';
import 'package:patient_app/data/doctors/repository/doctors_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'departments_view_model.g.dart';
part 'departments_state.dart';

@riverpod
class DepartmentsViewModel extends _$DepartmentsViewModel {
  @override
  DepartmentsState build() => DepartmentsState();

    final _doctorsRepository = getIt<DoctorsRepository>();

  Future<void> getAllDepartments() async {
    state = state.copyWith(departmentsResponse: const AsyncValue.loading());

    final response = await _doctorsRepository.getAllDepartments();

    if (response is DataSuccess) {
      state =
          state.copyWith(departmentsResponse: AsyncValue.data(response.data));
    } else {
      state = state.copyWith(
          departmentsResponse: AsyncValue.error(
              response.exceptionResponse?.exceptionMessages.firstOrNull ?? "",
              StackTrace.current));
    }
  }

}

