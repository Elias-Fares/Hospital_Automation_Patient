import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:patient_app/configuration/service_locator.dart';
import 'package:patient_app/core/base_dio/data_state.dart';
import 'package:patient_app/core/services/shared_preferences_service.dart';
import 'package:patient_app/data/auth/repository/auth_repository.dart';
import 'package:patient_app/features/appointment_details/view/appointment_details_screen.dart';
import 'package:patient_app/features/appointments/view/appointments.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'log_in_view_model.g.dart';

@riverpod
class LogInViewModel extends _$LogInViewModel {
  @override
  AsyncValue? build() => null;

  final _authRepository = getIt<AuthRepository>();
  final _sharedPrefsService = getIt<SharedPreferencesService>();

  Future<void> login({
    required String email,
    required String password,
  }) async {
    state = const AsyncValue.loading();

    final response =
        await _authRepository.login(email: email, password: password);
    if (response is DataSuccess) {
      await _authRepository.saveEmail(email: email);
      await _authRepository.savePassword(password: password);
      await _authRepository.saveToken(token: response.data["token"].toString());
      state = AsyncValue.data(response.data);
    } else {
      state = AsyncValue.error(
          response.exceptionResponse?.exceptionMessages.firstOrNull ?? "",
          StackTrace.current);
    }
  }

  bool isTokenEmpty() {
    final token = _sharedPrefsService.getToken();
    final isTokenEmpty = token?.isEmpty ?? true;
    return isTokenEmpty;
  }

  void autoLogin({required BuildContext context}) {
    if (isTokenEmpty()) {
      return;
    } else {
      context.go(AppointmentsScreen.routeName);
    }
  }
}
