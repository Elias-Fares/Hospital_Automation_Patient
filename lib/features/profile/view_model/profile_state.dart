part of 'profile_view_model.dart';

class ProfileState {
  final AsyncValue<UserProfileModel>? userProfileResponse;

  ProfileState({this.userProfileResponse});

  ProfileState copyWith({AsyncValue<UserProfileModel>? userProfileResponse}) {
    return ProfileState(
        userProfileResponse: userProfileResponse ?? this.userProfileResponse);
  }
}
