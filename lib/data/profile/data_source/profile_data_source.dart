import 'package:patient_app/core/base_dio/base_dio.dart';
import 'package:patient_app/core/base_dio/data_state.dart';
import 'package:patient_app/core/enums/params_values.dart';
import 'package:patient_app/data/profile/models/user_profile_model.dart';

class ProfileDataSource {
  final BaseDio _baseDio;

  ProfileDataSource({required BaseDio baseDio}) : _baseDio = baseDio;

  Future<DataState> getUserProfile() async {
    final response = await _baseDio.baseGet<UserProfileModel>(
        subUrl: "/user/get-profile-for",
        model: UserProfileModel(),
        queryParameters: {
          "type": ParamsValues.patient.value,
        },
        needToken: true);

    return response;
  }

  //TODO add image later
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
    final response = await _baseDio.basePost(
        subUrl: "/user/edit-profile",
        data: {
          "email": email,
          "first_name": firstName,
          "last_name": lastName,
          "middle_name": middleName,
          "phone_number": phoneNumber,
          "address_governorate": addressGovernate,
          "address_city": addressCity,
          "address_region": addressRegion,
          "address_street": addressStreet,
          "address_note": addressNote,
          "gender": gender,
        },
        needToken: true);

    return response;
  }
}
