import 'package:patient_app/configuration/service_locator.dart';
import 'package:patient_app/core/base_dio/data_state.dart';
import 'package:patient_app/data/auth/repository/auth_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'log_in_view_model.g.dart';

@riverpod
class LogInViewModel extends _$LogInViewModel {
  @override
  AsyncValue? build() => null;

  final _authRepository = getIt<AuthRepository>();

  Future<void> login({
    required String email,
    required String password,
  }) async {
    state = const AsyncValue.loading();

    final response =
        await _authRepository.login(email: email, password: password);
    if (response is DataSuccess) {
      state = AsyncValue.data(response.data);
      await _authRepository.saveEmail(email: email);
      await _authRepository.savePassword(password: password);
      await _authRepository.saveToken(token: response.data["token"].toString());
    } else {
      state = AsyncValue.error(
          response.exceptionResponse?.exceptionMessages.firstOrNull ?? "",
          StackTrace.current);
    }
  }
}
