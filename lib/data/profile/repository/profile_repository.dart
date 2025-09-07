import '../../../core/base_dio/data_state.dart';
import '../data_source/profile_data_source.dart';

class ProfileRepository {
  final ProfileDataSource _profileDataSource;

  ProfileRepository({required ProfileDataSource profileDataSource})
      : _profileDataSource = profileDataSource;

  Future<DataState> getUserProfile() async {
    final response = _profileDataSource.getUserProfile(
     );

    return response;
  }



  String? getUserName() {
    return _profileDataSource.getUserName();
  }

  Future<void> saveUserName({required String? userName}) async {
    await _profileDataSource.saveUserName(userName: userName);
  }

  Future<DataState> editUserProfile({
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
    final response = _profileDataSource.editUserProfile(
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

    return response;
  }
}
