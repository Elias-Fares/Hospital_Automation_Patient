import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:patient_app/common_widgets/app_bar_title_widget.dart';
import 'package:patient_app/common_widgets/sub_app_bar.dart';
import 'package:patient_app/configuration/res.dart';
import 'package:patient_app/core/app_colors.dart';
import 'package:patient_app/core/widgets/buttons/custom_outlined_button.dart';
import 'package:patient_app/core/widgets/buttons/loading_button.dart';

part 'widget/edit_profile_text_form_field.dart';
part 'widget/edit_profile_page.dart';
part 'widget/edit_profile_add_note_button.dart';

class EditProfileScreen extends StatefulWidget {
  static const routeName = "/edit_profile";
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  // Controllers
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController secondNameController = TextEditingController();
  final TextEditingController governorateController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController regionController = TextEditingController();
  final TextEditingController streetController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  final GlobalKey<FormState> _editProfileFormKey = GlobalKey<FormState>();

  @override
  void dispose() {
    firstNameController.dispose();
    secondNameController.dispose();
    governorateController.dispose();
    cityController.dispose();
    regionController.dispose();
    streetController.dispose();
    phoneController.dispose();
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SubAppBar(
          titleWidget: AppBarTitleWidget(
              title: "John Doe", imagePath: Res.personePlaceHolderImage)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: EditProfilePage(
          formKey: _editProfileFormKey,
          firstNameController: firstNameController,
          secondNameController: secondNameController,
          governorateController: governorateController,
          cityController: cityController,
          regionController: regionController,
          streetController: streetController,
          phoneController: phoneController,
          emailController: emailController,
          onDiscardPressed: () {},
          onSavePressed: () {},
        ),
      ),
    );
  }
}
