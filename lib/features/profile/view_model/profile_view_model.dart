import 'package:flutter/material.dart';
import '../../../configuration/service_locator.dart';
import '../../../core/base_dio/data_state.dart';
import '../../../core/function/join_strings.dart';
import '../../../data/auth/repository/auth_repository.dart';
import '../../../data/profile/models/user_profile_model.dart';
import '../../../data/profile/repository/profile_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'profile_state.dart';
part 'profile_view_model.g.dart';

@Riverpod(keepAlive: true)
class ProfileViewModel extends _$ProfileViewModel {
  @override
  ProfileState build() => ProfileState();

  final _profileRepository = getIt<ProfileRepository>();
  final _authRepository = getIt<AuthRepository>();

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
    if (_profileRepository.getUserName() != null) {
      return _profileRepository.getUserName()!;
    } else {
      debugPrint(
          "debugger ${state.userProfileResponse?.asData?.value.userProfileData?.firstName}");
      return joinStrings([
        state.userProfileResponse?.asData?.value.userProfileData?.firstName,
        state.userProfileResponse?.asData?.value.userProfileData?.lastName,
      ]);
    }
  }

  String getUserImage() {
    //TODO implement it later
    return "";
  }

    Future<void> logout() async {
    await _authRepository.clearEmail();
    await _authRepository.clearPassword();
    await _authRepository.clearToken();
  
  }

  
}
