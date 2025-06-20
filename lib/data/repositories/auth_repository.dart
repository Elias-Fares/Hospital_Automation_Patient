import 'package:patient_app/core/base_dio/data_state.dart';
import 'package:patient_app/data/sources/auth_data_source.dart';
import 'package:patient_app/services/shared_preferences_service.dart';

import '../models/user_model.dart';

class AuthRepository {
  final AuthDataSource _authDataSource;
  final SharedPreferencesService _sharedPreferencesService;

  AuthRepository(
      {required AuthDataSource authDataSource,
      required SharedPreferencesService sharedPreferencesService})
      : _authDataSource = authDataSource,
        _sharedPreferencesService = sharedPreferencesService;

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

  Future<void> saveToken({required String? token}) async {
    await _sharedPreferencesService.saveToken(token: token);
  }

  String? getToken() {
    return _sharedPreferencesService.getToken();
  }

  Future<void> clearToken() async {
    await _sharedPreferencesService.clearToken();
  }

  Future<void> saveEmail({required String? email}) async {
    await _sharedPreferencesService.saveEmail(email: email);
  }

  String? getEmail() {
    return _sharedPreferencesService.getEmail();
  }

  Future<void> clearEmail() async {
    await _sharedPreferencesService.clearEmail();
  }

  Future<void> savePassword({required String? password}) async {
    await _sharedPreferencesService.savePassword(password: password);
  }

  String? getPassword() {
    return _sharedPreferencesService.getPassword();
  }

  Future<void> clearPassword() async {
    await _sharedPreferencesService.clearPassword();
  }

  Future<DataState> addAddress({
    required String governate,
    required String city,
    required String region,
    required String street,
    required String note,
  }) async {
    final response = await _authDataSource.addAddress(
        governate: governate,
        city: city,
        region: region,
        street: street,
        note: note);

    return response;
  }

  Future<DataState> uploadProfileImage({required String imagePath}) async {


    final response =
        await _authDataSource.uploadProfileImage(imagePath: imagePath);

    return response;
  }
}
