import 'package:patient_app/features/auth/view_model/states/sign_up_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'sign_up_view_model.g.dart';

@riverpod
class SignUpViewModel extends _$SignUpViewModel {
  @override
  SignupState build() => SignupState();

  void togglePasswordVisibility() {
    state = state.copyWith(isPasswordVisible: !state.isPasswordVisible);
  }

  Future<void> signUp({
    required String email,
    required String password,
  }) async {
    state = state.copyWith(asyncValue: const AsyncValue.loading());
  }
}

@riverpod
class TogglePasswordVisibilityProvider
    extends _$TogglePasswordVisibilityProvider {
  @override
  bool build() => true;

  void toggle() {
    state = !state;
  }
}

@riverpod
class SignUpUserProvider extends _$SignUpUserProvider {
  @override
  AsyncValue<dynamic>? build() {
    return null;
  }

  Future<void> signUp({
    required String email,
    required String password,
  }) async {}
}
