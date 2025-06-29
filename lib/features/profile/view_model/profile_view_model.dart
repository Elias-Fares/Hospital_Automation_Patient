import 'package:patient_app/configuration/service_locator.dart';
import 'package:patient_app/core/base_dio/data_state.dart';
import 'package:patient_app/core/function/join_strings.dart';
import 'package:patient_app/data/profile/models/user_profile_model.dart';
import 'package:patient_app/data/profile/repository/profile_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'profile_state.dart';
part 'profile_view_model.g.dart';

@Riverpod(keepAlive: true)
class ProfileViewModel extends _$ProfileViewModel {
  @override
  ProfileState build() => ProfileState();

  final _profileRepository = getIt<ProfileRepository>();

  Future<void> getUserProfile() async {
    state = state.copyWith(userProfileResponse: const AsyncValue.loading());

    final response = await _profileRepository.getUserProfile();

    if (response is DataSuccess) {
      state =
          state.copyWith(userProfileResponse: AsyncValue.data(response.data));
      await _profileRepository.saveUserName(
          userName: joinStrings([
        state.userProfileResponse?.asData?.value.userProfileData?.firstName,
        state.userProfileResponse?.asData?.value.userProfileData?.lastName,
      ]));
    } else {
      state = state.copyWith(
          userProfileResponse: AsyncValue.error(
              response.exceptionResponse?.exceptionMessages.firstOrNull ?? "",
              StackTrace.current));
    }
  }

  String getUserName() {
    return _profileRepository.getUserName() ?? "";
  }

  String getUserImage() {
    //TODO implement it later
    return "";
  }
}
