import 'package:patient_app/configuration/service_locator.dart';
import 'package:patient_app/core/base_dio/data_state.dart';
import 'package:patient_app/data/pharmacies/models/pharmacy_details_model.dart';
import 'package:patient_app/data/pharmacies/repository/pharmacies_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'pharmacy_profile_state.dart';
part 'pharmacy_profile_view_model.g.dart';

@riverpod
class PharmacyProfileViewModel extends _$PharmacyProfileViewModel {
  @override
  PharmacyProfileState build() => PharmacyProfileState();

  final _pharmacyRepository = getIt<PharmaciesRepository>();

    Future<void> getPharmacyDetails({required String id}) async {
    state = state.copyWith(pharmacyDetailsResponse: const AsyncValue.loading());

    final response = await _pharmacyRepository.getPharmacyDetails(id: id);

    if (response is DataSuccess) {
      state =
          state.copyWith(pharmacyDetailsResponse: AsyncValue.data(response.data));
    } else {
      state = state.copyWith(
          pharmacyDetailsResponse: AsyncValue.error(
              response.exceptionResponse?.exceptionMessages.firstOrNull ?? "",
              StackTrace.current));
    }
  }


}
