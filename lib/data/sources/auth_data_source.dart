import 'package:dio/dio.dart';
import 'package:patient_app/core/base_dio/base_dio.dart';
import 'package:patient_app/core/base_dio/data_state.dart';
import 'package:patient_app/core/constant/constant.dart';
import 'package:patient_app/data/models/user_model.dart';

class AuthDataSource {
  final BaseDio baseDio;

  AuthDataSource({required this.baseDio});

  Future<DataState<UserModel>> signUp({
    required String email,
    required String firstName,
    required String lastName,
    required String middleName,
    required String password,
    required String phoneNumber,
    required String gender,
  }) async {
    final response = await baseDio
        .post<UserModel>(subUrl: "/user/sign-up", model: UserModel(), data: {
      "role": Constant.role,
      "email": email,
      "first_name": firstName,
      "last_name": lastName,
      "middle_name": middleName,
      "password": password,
      "phone_number": phoneNumber,
      "gender": gender
    });

    return response;
  }

  Future<DataState> sendOTP({required String email}) async {
    final response = await baseDio.basePost(subUrl: "/user/send-otp", data: {
      "email": email,
    });

    return response;
  }

  Future<DataState> verifyOTP(
      {required String email, required String otp}) async {
    final response = await baseDio.basePost(subUrl: "/user/verify-otp", data: {
      "email": email,
      "otp": otp,
    });

    return response;
  }

  Future<DataState> login(
      {required String email, required String password}) async {
    final response = await baseDio.basePost(subUrl: "/user/login", data: {
      "email": email,
      "password": password,
    });

    return response;
  }

  Future<DataState> logout() async {
    final response =
        await baseDio.post(subUrl: "/user/logout", needToken: true);

    return response;
  }

  Future<DataState> resetPassword(
      {required String email, required String password}) async {
    final response = await baseDio.post(subUrl: "/user/reset-password", data: {
      "email": email,
      "password": password,
    });

    return response;
  }

  Future<DataState> deleteAccount() async {
    final response =
        await baseDio.delete(subUrl: "/user/delete-account", needToken: true);

    return response;
  }

  Future<DataState> addAddress({
    required String governate,
    required String city,
    required String region,
    required String street,
    required String note,
  }) async {
    final response = await baseDio
        .basePost(subUrl: "/user/add-address", needToken: true, data: {
      "address_governorate": governate,
      "address_city": city,
      "address_region": region,
      "address_street": street,
      "address_note": note
    });

    return response;
  }

  Future<DataState> uploadProfileImage({required String imagePath}) async {
    String fileName = imagePath.split('/').last;
    FormData body = FormData.fromMap({
      "image": await MultipartFile.fromFile(imagePath, filename: fileName),
    });
    final response = await baseDio.basePost(
        subUrl: "/user/add-image", needToken: true, data: body);

    return response;
  }
}
