import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:patient_app/core/enums/gender_enum.dart';
import 'package:patient_app/core/validators/fields_validator.dart';
import 'package:patient_app/core/widgets/show_snack_bar_error_message.dart';
import 'package:patient_app/features/auth/view/screens/login_screen.dart';
import 'package:patient_app/features/auth/view/screens/verification_code_screen.dart';
import 'package:patient_app/features/auth/view/widgets/sign_up_page.dart';
import 'package:patient_app/features/auth/view_model/sign_up_view_model.dart';

class SignupScreen extends ConsumerStatefulWidget {
  static const routeName = "/sign_up_screen";

  const SignupScreen({super.key});

  @override
  ConsumerState<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends ConsumerState<SignupScreen> {
  final TextEditingController emailTextEditingController =
      TextEditingController();
  final TextEditingController passwordTextEditingController =
      TextEditingController();
  final TextEditingController firstNameTextEditingController =
      TextEditingController();
  final TextEditingController lastNameTextEditingController =
      TextEditingController();
  final TextEditingController phoneTextEditingController =
      TextEditingController();
  final TextEditingController confirmPasswordTextEditingController =
      TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    emailTextEditingController.dispose();
    passwordTextEditingController.dispose();
    firstNameTextEditingController.dispose();
    lastNameTextEditingController.dispose();
    phoneTextEditingController.dispose();
    confirmPasswordTextEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final signUpValue = ref.watch(signUpViewModelProvider);

    ref.listen(
      signUpViewModelProvider.select(
        (value) => value.signUpResponse,
      ),
      (_, next) {
        next?.when(
          data: (data) {
            context.push(VerificationCodeScreen.routeName);
          },
          error: (error, stackTrace) {
            showSnackBarErrorMessage(context, message: error.toString());
          },
          loading: () {},
        );
      },
    );
    return Scaffold(
        body: SafeArea(
      child: SignupPage(
        emailTextEditingController: emailTextEditingController,
        passwordTextEditingController: passwordTextEditingController,
        confirmPasswordTextEditingController:
            confirmPasswordTextEditingController,
        firstNameTextEditingController: firstNameTextEditingController,
        lastNameTextEditingController: lastNameTextEditingController,
        phoneNumberTextEditingController: phoneTextEditingController,
        isLoading: signUpValue.signUpResponse?.isLoading ?? false,
        formKey: _formKey,
        emailValidator: (val) {
          return FieldsValidator.validateEmail(email: val ?? "");
        },
        passwordValidator: (val) {
          return FieldsValidator.validateEmpty(value: val ?? "");
        },
        confirmPassWordValidator: (val) {
          return FieldsValidator.matchPassword(
              value1: passwordTextEditingController.text,
              value2: confirmPasswordTextEditingController.text);
        },
        firstNameValidator: (val) {
          return FieldsValidator.validateEmpty(value: val ?? "");
        },
        lastNameValidator: (val) {
          return FieldsValidator.validateEmpty(value: val ?? "");
        },
        phoneNumberValidator: (val) {
          return FieldsValidator.validateEmpty(value: val ?? "");
        },
        selectedGender: signUpValue.selectedGender,
        onGenderSelect: (gender) {
          ref.read(signUpViewModelProvider.notifier).setGender(gender);
        },
        signUpFunc: () {
          if (!(_formKey.currentState?.validate() ?? false)) {
            return;
          }

          ref.read(signUpViewModelProvider.notifier).signUp(
                email: emailTextEditingController.text,
                firstName: firstNameTextEditingController.text,
                lastName: lastNameTextEditingController.text,
                middleName: "name",
                password: passwordTextEditingController.text,
                phoneNumber: phoneTextEditingController.text,
              );
        },
        goToLogin: () {
          context.go(LoginScreen.routeName);
        },
      ),
    ));
  }
}
