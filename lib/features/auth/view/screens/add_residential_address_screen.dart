import 'dart:io';
import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:patient_app/configuration/router/router.dart';
import 'package:patient_app/core/validators/fields_validator.dart';
import 'package:patient_app/features/auth/view/screens/upload_profile_image_screen.dart';
import 'package:patient_app/features/auth/view/widgets/add_residential_address_page.dart';
import 'package:patient_app/features/auth/view/widgets/login_page.dart';

class AddResidentialAddressScreen extends ConsumerStatefulWidget {
  static const routeName = "/add_residential_address";

  const AddResidentialAddressScreen({super.key});

  @override
  ConsumerState<AddResidentialAddressScreen> createState() =>
      _AddResidentialAddressScreenV2State();
}

class _AddResidentialAddressScreenV2State
    extends ConsumerState<AddResidentialAddressScreen> {
  final TextEditingController governateTextEditingController =
      TextEditingController();
  final TextEditingController cityTextEditingController =
      TextEditingController();
  final TextEditingController regionTextEditingController =
      TextEditingController();
  final TextEditingController streetTextEditingController =
      TextEditingController();
  final TextEditingController noteTextEditingController =
      TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isloading = false;

  @override
  void dispose() {
    super.dispose();
    governateTextEditingController.dispose();
    cityTextEditingController.dispose();
    regionTextEditingController.dispose();

    streetTextEditingController.dispose();
    noteTextEditingController.dispose();
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
        appBar: AppBar(),
        body: AddResidentialAddressPage(
          formKey: _formKey,
          governateTextEditingController: governateTextEditingController,
          cityTextEditingController: cityTextEditingController,
          regionTextEditingController: regionTextEditingController,
          streetTextEditingController: streetTextEditingController,
          noteTextEditingController: noteTextEditingController,
          isLoading: false,
          cityValidator: (value) =>
              FieldsValidator.validateEmpty(value: value ?? ""),
          governateValidator: (value) =>
              FieldsValidator.validateEmpty(value: value ?? ""),
          regionValidator: (value) =>
              FieldsValidator.validateEmpty(value: value ?? ""),
          streetValidator: (value) =>
              FieldsValidator.validateEmpty(value: value ?? ""),
          submit: () {
            context.push(UploadProfileImageScreen.routeName);
          },
        ));
  }
}
