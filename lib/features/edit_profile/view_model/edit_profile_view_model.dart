import 'package:patient_app/configuration/service_locator.dart';
import 'package:patient_app/core/base_dio/data_state.dart';
import 'package:patient_app/data/profile/repository/profile_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'edit_profile_view_model.g.dart';

@riverpod
class EditProfileViewModel extends _$EditProfileViewModel {
  @override
  AsyncValue? build() => null;

  final _profileRepository = getIt<ProfileRepository>();

  Future<void> editUserProfile({
    required String email,
    required String firstName,
    required String middleName,
    required String lastName,
    required String phoneNumber,
    required String addressGovernate,
    required String addressRegion,
    required String addressCity,
    required String addressStreet,
    required String addressNote,
    required String gender,
  }) async {
    state = const AsyncValue.loading();
    final response = await _profileRepository.editUserProfile(
        email: email,
        firstName: firstName,
        middleName: middleName,
        lastName: lastName,
        phoneNumber: phoneNumber,
        addressGovernate: addressGovernate,
        addressRegion: addressRegion,
        addressCity: addressCity,
        addressStreet: addressStreet,
        addressNote: addressNote,
        gender: gender);

    if (response is DataSuccess) {
      state = AsyncValue.data(response.data);
    } else {
      state = AsyncValue.error(
          response.exceptionResponse?.exceptionMessages.firstOrNull ?? "",
          StackTrace.current);
    }
  }
}
