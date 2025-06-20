import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:patient_app/configuration/router/router.dart';
import 'package:patient_app/core/style/app_colors.dart';
import 'package:patient_app/core/validators/fields_validator.dart';
import 'package:patient_app/core/widgets/show_snack_bar_error_message.dart';
import 'package:patient_app/core/widgets/show_snack_bar_success_message.dart';
import 'package:patient_app/features/app/app.dart';
import 'package:patient_app/features/auth/view/screens/add_residential_address_screen.dart';
import 'package:patient_app/features/auth/view/screens/login_screen.dart';
import 'package:patient_app/features/auth/view/widgets/verification_code_page.dart';
import 'package:patient_app/features/auth/view_models/verify_code/verify_code_view_model.dart';

class VerificationCodeScreen extends ConsumerStatefulWidget {
  static const routeName = "/verification_code_screen";

  const VerificationCodeScreen({super.key});

  @override
  ConsumerState<VerificationCodeScreen> createState() =>
      _VerificationCodeScreenState();
}

class _VerificationCodeScreenState
    extends ConsumerState<VerificationCodeScreen> {
  String _otpCode = "";
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final isVerifyLoading =
        ref.watch(verifyCodeViewModelProvider).verifyCodeResponse?.isLoading ??
            false;
    ref.listen(
      verifyCodeViewModelProvider.select(
        (value) => value.sendCodeResponse,
      ),
      (previous, next) {
        next?.when(
          data: (data) {
            showSnackBarSuccessMessage(context, message: data.toString());
          },
          error: (error, stackTrace) {
            showSnackBarErrorMessage(context, message: error.toString());
          },
          loading: () {},
        );
      },
    );
    ref.listen(
      verifyCodeViewModelProvider.select(
        (value) => value.verifyCodeResponse,
      ),
      (previous, next) {
        next?.when(
          data: (data) {
            showSnackBarSuccessMessage(context, message: data.toString());
            context.push(LoginScreen.routeName);
          },
          error: (error, stackTrace) {
            showSnackBarErrorMessage(context, message: error.toString());
          },
          loading: () {},
        );
      },
    );
    return Scaffold(
        appBar: AppBar(),
        resizeToAvoidBottomInset: false,
        body: VerificationCodePage(
          formKey: formKey,
          isLoading: isVerifyLoading,
          verifyCodeValidator: (value) {
            return FieldsValidator.validateEmpty(value: value ?? "");
          },
          onSubmit: (value) {
            _otpCode = value;

            debugPrint(_otpCode);
          },
          verifyCodePress: () {
            //TODO uncomment when you finish Auth
            // debugPrint(_otpCode.length.toString());
            // if (_otpCode.length < 4) {
            //   return;
            // }
            // ref
            //     .read(verifyCodeViewModelProvider.notifier)
            //     .verifyOTP(otp: _otpCode);

            //TODO delete it when u fininsh testign
            context.push(LoginScreen.routeName);
          },
          resendCodePress: () {
            ref.read(verifyCodeViewModelProvider.notifier).sendOTP();
          },
        ));
  }
}
