import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:patient_app/core/enums/gender_enum.dart';

class SignUpState {
  final AsyncValue? signUpResponse;
  final bool isPasswordVisible;
  final bool isConfirmPasswordVisible;
  final GenderEnum selectedGender;

  SignUpState(
      {this.signUpResponse,
      required this.isPasswordVisible,
      required this.isConfirmPasswordVisible,
     required this.selectedGender, 
      });

  SignUpState copyWith({
    AsyncValue? signUpResponse,
    bool? isPasswordVisible,
    bool? isConfirmPasswordVisible,
    GenderEnum? selectedGender
  }) =>
      SignUpState(
          signUpResponse: signUpResponse ?? this.signUpResponse,
          isPasswordVisible: isPasswordVisible ?? this.isPasswordVisible,
          isConfirmPasswordVisible:
              isConfirmPasswordVisible ?? this.isConfirmPasswordVisible,
              selectedGender: selectedGender ?? this.selectedGender
              );
}
