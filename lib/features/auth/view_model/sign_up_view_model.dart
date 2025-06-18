import 'package:patient_app/configuration/service_locator.dart';
import 'package:patient_app/core/base_dio/data_state.dart';
import 'package:patient_app/core/enums/gender_enum.dart';
import 'package:patient_app/features/auth/data/repository/auth_repository.dart';
import 'package:patient_app/features/auth/view_model/states/sign_up_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'sign_up_view_model.g.dart';

@riverpod
class SignUpViewModel extends _$SignUpViewModel {
  @override
  SignUpState build() => SignUpState(
      isConfirmPasswordVisible: false,
      isPasswordVisible: false,
      selectedGender: GenderEnum.male);

  final _authRepository = getIt<AuthRepository>();

  void togglePasswordVisibility() {
    state = state.copyWith(isPasswordVisible: !state.isPasswordVisible);
  }

  Future<void> signUp({
    required String email,
    required String firstName,
    required String lastName,
    required String middleName,
    required String password,
    required String phoneNumber,

  }) async {
    state = state.copyWith(signUpResponse: const AsyncValue.loading());

    final response = await _authRepository.signUp(
        email: email,
        firstName: firstName,
        lastName: lastName,
        middleName: middleName,
        password: password,
        phoneNumber: phoneNumber,
        gender: state.selectedGender.getTitle());
    if (response is DataSuccess) {
      state = state.copyWith(signUpResponse: AsyncValue.data(response.data));
    } else {
      state = state.copyWith(
          signUpResponse: AsyncValue.error(
              response.exceptionResponse?.exceptionMessages.firstOrNull ?? "",
              StackTrace.current));
    }
  }

  void setGender(GenderEnum gender) {
    state = state.copyWith(selectedGender: gender);
  }
}
