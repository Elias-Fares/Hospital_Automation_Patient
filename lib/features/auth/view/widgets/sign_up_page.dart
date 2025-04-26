import 'package:flutter/material.dart';
import 'package:patient_app/core/app_colors.dart';
import 'package:patient_app/core/widgets/buttons/custom_text_button.dart';
import 'package:patient_app/core/widgets/buttons/loading_button.dart';
import 'package:patient_app/features/auth/view/widgets/auth_text_form_field.dart';
import 'package:patient_app/features/auth/view/widgets/select_gender_buttons.dart';

class SignupPage extends StatelessWidget {
  final FormFieldValidator<String>? emailValidator;
  final FormFieldValidator<String>? passwordValidator;
  final FormFieldValidator<String>? confirmPassWordValidator;
  final FormFieldValidator<String>? phoneNumberValidator;
  final FormFieldValidator<String>? firstNameValidator;
  final FormFieldValidator<String>? lastNameValidator;

  final TextEditingController? emailTextEditingController;
  final TextEditingController? passwordTextEditingController;
  final TextEditingController? firstNameTextEditingController;
  final TextEditingController? lastNameTextEditingController;
  final TextEditingController? confirmPasswordTextEditingController;
  final TextEditingController? phoneNumberTextEditingController;
  final VoidCallback signUpFunc;

  final VoidCallback goToLogin;
  final bool isLoading;

  final GlobalKey<FormState> formKey;

  const SignupPage({
    super.key,
    this.emailValidator,
    this.passwordValidator,
    this.emailTextEditingController,
    this.passwordTextEditingController,
    required this.isLoading,
    required this.formKey,
    this.firstNameTextEditingController,
    this.lastNameTextEditingController,
    this.confirmPasswordTextEditingController,
    this.phoneNumberTextEditingController,
    this.confirmPassWordValidator,
    this.phoneNumberValidator,
    this.firstNameValidator,
    this.lastNameValidator,
    required this.signUpFunc,
    required this.goToLogin,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 25,
              ),
              Text(
                "Sign Up",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "New user? Create account here.",
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(color: AppColors.hintTextColor),
              ),
              const SizedBox(
                height: 20,
              ),
              AuthTextFormField(
                textEditingController: firstNameTextEditingController,
                validator: firstNameValidator,
                label: "First Name*",
              ),
              const SizedBox(
                height: 22,
              ),
              AuthTextFormField(
                textEditingController: lastNameTextEditingController,
                validator: lastNameValidator,
                label: "Last Name*",
              ),
              const SizedBox(
                height: 22,
              ),
              AuthTextFormField(
                textEditingController: emailTextEditingController,
                validator: emailValidator,
                label: "Email Address*",
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(
                height: 22,
              ),
              AuthTextFormField(
                textEditingController: phoneNumberTextEditingController,
                validator: phoneNumberValidator,
                label: "Phone Number*",
                keyboardType: TextInputType.phone,
              ),
              const SizedBox(
                height: 22,
              ),
              AuthTextFormField(
                textEditingController: passwordTextEditingController,
                validator: passwordValidator,
                label: "Password*",
                keyboardType: TextInputType.visiblePassword,
              ),
              const SizedBox(
                height: 22,
              ),
              AuthTextFormField(
                textEditingController: confirmPasswordTextEditingController,
                validator: confirmPassWordValidator,
                label: "Confirm Password*",
                keyboardType: TextInputType.visiblePassword,
              ),
              const SizedBox(
                height: 22,
              ),
              Text(
                "Gender",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(
                height: 14,
              ),
              const SelectGenderButtons(),
              const SizedBox(
                height: 22,
              ),
              LoadingButton(
                title: "Sign up",
                onTap: signUpFunc,
              ),
              const SizedBox(
                height: 22,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already have account?"),
                  CustomTextButton(
                      text: "Log In Here",
                      fontWeight: FontWeight.w500,
                      textColor: AppColors.primary,
                      onTap: goToLogin)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
