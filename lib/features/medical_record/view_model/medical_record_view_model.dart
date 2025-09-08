import '../../../configuration/service_locator.dart';
import '../../../core/base_dio/data_state.dart';
import '../../../core/enums/params_values.dart';
import '../../../data/medical_records/models/medical_record_model.dart';
import '../../../data/medical_records/repository/medical_records_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'medical_record_view_model.g.dart';
part 'medical_record_state.dart';

@riverpod
class MedicalRecordViewModel extends _$MedicalRecordViewModel {
  @override
  MedicalRecordState build() => MedicalRecordState();

  final _medicalRecordsRepository = getIt<MedicalRecordsRepository>();

  Future<void> getMedicalRecords({
    required ParamsValues type,
    String? childId,
  }) async {
    state = state.copyWith(medicalRecordsResponse: const AsyncValue.loading());

    final response = await _medicalRecordsRepository.getMedicalRecords(
        type: type, childId: childId);

    if (!ref.mounted) return;

    if (response is DataSuccess) {
      state = state.copyWith(
          medicalRecordsResponse: AsyncValue.data(response.data));
    } else {
      state = state.copyWith(
          medicalRecordsResponse: AsyncValue.error(
              response.exceptionResponse?.exceptionMessages.firstOrNull ?? "",
              StackTrace.current));
    }
  }
}
