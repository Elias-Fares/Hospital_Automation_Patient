import '../../../configuration/service_locator.dart';
import '../../../core/base_dio/data_state.dart';
import '../../../core/enums/params_values.dart';
import '../../../core/function/join_strings.dart';
import '../../../core/models/prescription_medicine_model.dart';
import '../../../data/perscriptions/repository/prescriptions_repository.dart';
import '../../../data/profile/repository/profile_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'patient_prescription_state.dart';
part 'patient_prescription_view_model.g.dart';

@riverpod
class PatientPrescriptionViewModel extends _$PatientPrescriptionViewModel {
  @override
  PatientPrescriptionState build() => PatientPrescriptionState();

  final _prescriptionsRepository = getIt<PrescriptionsRepository>();
  final _profileRepository = getIt<ProfileRepository>();

  String getUserName() {
    return _profileRepository.getUserName() ?? "";
  }

  Future<void> getPrescriptions({
    required ParamsValues comingFrom,
    String? childId,
    String? pharmacyId,
  }) async {
    state = state.copyWith(prescriptionsResponse: const AsyncValue.loading());

    DataState response;

    if (comingFrom == ParamsValues.child) {
      response = await _prescriptionsRepository.getChildPrescription(
          childId: childId, type: ParamsValues.details.value);
    } else if (comingFrom == ParamsValues.pharmacy) {
      response = await _prescriptionsRepository.getPrescriptionsPharmacy(
          pharmacyId: pharmacyId, type: ParamsValues.details.value);
    } else {
      response = await _prescriptionsRepository.getPatientPrescription();
    }

    if (response is DataSuccess) {
      state =
          state.copyWith(prescriptionsResponse: AsyncValue.data(response.data));
    } else {
      state = state.copyWith(
          prescriptionsResponse: AsyncValue.error(
              response.exceptionResponse?.exceptionMessages.firstOrNull ?? "",
              StackTrace.current));
    }
  }

  String getMedicinesNames(
      {required List<PrescriptionMedicine>? prescriptionMedicines}) {
    return joinStrings(
        prescriptionMedicines
                ?.map(
                  (e) => e.medicine?.name ?? "",
                )
                .toList() ??
            [],
        joinChart: " - ");
  }
}
