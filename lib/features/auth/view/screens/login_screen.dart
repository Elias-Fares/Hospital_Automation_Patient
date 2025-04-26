import 'dart:io';
import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:patient_app/configuration/router/router.dart';
import 'package:patient_app/core/validators/fields_validator.dart';
import 'package:patient_app/features/auth/view/screens/reset_password_screen.dart';
import 'package:patient_app/features/auth/view/screens/sign_up_screen.dart';
import 'package:patient_app/features/auth/view/widgets/login_page.dart';

class LoginScreen extends ConsumerStatefulWidget {
  static const routeName = "/login_screen";

  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenV2State();
}

class _LoginScreenV2State extends ConsumerState<LoginScreen> {
  final TextEditingController emailTextEditingController =
      TextEditingController();
  final TextEditingController passwordTextEditingController =
      TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isloading = false;

  @override
  void dispose() {
    super.dispose();
    emailTextEditingController.dispose();
    passwordTextEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final val = ref.watch(authRiverpodProvider);
    // print(val.toString());

    // ref.listen(
    //   authRiverpodProvider,
    //   (_, next) {
    //     next?.when(
    //       data: (data) {
    //         Navigator.of(context).push(MaterialPageRoute(
    //           builder: (context) => const HomeScreen(),
    //         ));
    //       },
    //       error: (error, stackTrace) {
    //         showSnackBarMessage(context, message: error.toString());
    //       },
    //       loading: () {},
    //     );
    //   },
    // );
    return Scaffold(
        body: LoginPage(
      emailTextEditingController: emailTextEditingController,
      passwordTextEditingController: passwordTextEditingController,
      isLoading: false,
      formKey: _formKey,
      emailValidator: (val) {
        return FieldsValidator.validateEmail(email: val ?? "");
      },
      passwordValidator: (val) {
        return FieldsValidator.validatePassword(password: val ?? "");
      },
      loginFunc: () {
        if (!(_formKey.currentState?.validate() ?? false)) {
          return;
        }
        // ref.read(authRiverpodProvider.notifier).loginUser(
        //     email: emailTextEditingController.text,
        //     password: passwordTextEditingController.text);
      },
      creatAccountFunc: () {
        context.push(SignupScreen.routeName);
      },
      forgotPasswordFunc: () {
        context.push(ResetPasswordScreen.routeName);
      },
    ));
  }
}
