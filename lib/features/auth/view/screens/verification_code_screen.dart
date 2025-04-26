import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:patient_app/configuration/router/router.dart';
import 'package:patient_app/core/app_colors.dart';
import 'package:patient_app/features/app/app.dart';
import 'package:patient_app/features/auth/view/screens/add_residential_address_screen.dart';
import 'package:patient_app/features/auth/view/widgets/verification_code_page.dart';

class VerificationCodeScreen extends StatefulWidget {
  static const routeName = "/verification_code_screen";

  const VerificationCodeScreen({super.key});

  @override
  State<VerificationCodeScreen> createState() => _VerificationCodeScreenState();
}

class _VerificationCodeScreenState extends State<VerificationCodeScreen> {
  TextEditingController codetextEditingController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: VerificationCodePage(
          formKey: formKey,
          isLoading: false,
          verifyCodeValidator: (value) {
            return null;
          },
          verifyCodeTextEditingController: codetextEditingController,
          onSubmitCode: (code) {
            codetextEditingController.text = code;
          },
          verifyCodePress: () {
            context.push(AddResidentialAddressScreen.routeName);
          },
          resendCodePress: () {},
        ));
  }
}
