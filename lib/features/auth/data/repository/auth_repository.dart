import 'package:patient_app/core/base_dio/data_state.dart';
import 'package:patient_app/features/auth/data/data_source/auth_data_source.dart';

import '../models/user_model.dart';

class AuthRepository {
  final AuthDataSource _authDataSource;

  AuthRepository({required AuthDataSource authDataSource})
      : _authDataSource = authDataSource;

  Future<DataState<UserModel>> signUp({
    required String email,
    required String firstName,
    required String lastName,
    required String middleName,
    required String password,
    required String phoneNumber,
    required String gender,
  }) async {
    final response = await _authDataSource.signUp(
        email: email,
        firstName: firstName,
        lastName: lastName,
        middleName: middleName,
        password: password,
        phoneNumber: phoneNumber,
        gender: gender);

    return response;
  }

  Future<DataState> sendOTP({required String email}) async {
    final response = await _authDataSource.sendOTP(email: email);

    return response;
  }

  Future<DataState> verifyOTP(
      {required String email, required String otp}) async {
    final response = await _authDataSource.verifyOTP(email: email, otp: otp);

    return response;
  }

  Future<DataState> login(
      {required String email, required String password}) async {
    final response =
        await _authDataSource.login(email: email, password: password);

    return response;
  }

  Future<DataState> logout() async {
    final response = await _authDataSource.logout();

    return response;
  }

  Future<DataState> resetPassword(
      {required String email, required String password}) async {
    final response =
        await _authDataSource.resetPassword(email: email, password: password);

    return response;
  }

  Future<DataState> deleteAccount() async {
    final response = await _authDataSource.deleteAccount();

    return response;
  }
}
