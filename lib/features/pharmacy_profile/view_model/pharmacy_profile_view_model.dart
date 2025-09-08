import 'package:url_launcher/url_launcher.dart';

import '../../../configuration/service_locator.dart';
import '../../../core/base_dio/data_state.dart';
import '../../../data/pharmacies/models/pharmacy_details_model.dart';
import '../../../data/pharmacies/repository/pharmacies_repository.dart';
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

  Future<void> makePhoneCall({required String? phoneNumber}) async {
    if (phoneNumber == null) return;
    final Uri launchUri = Uri(scheme: "tel", path: phoneNumber);

    if (await canLaunchUrl(launchUri)) {
      await launchUrl(launchUri);
    } else {
      throw 'Could not launch $launchUri';
    }
  }

  Future<void> sendEmail({required String? email}) async {
    if (email == null) return;
    final Uri emailUri = Uri(scheme: "mailto", path: email);

    if (await canLaunchUrl(emailUri)) {
      await launchUrl(emailUri);
    } else {
      throw 'Could not launch $emailUri';
    }
  }



}
