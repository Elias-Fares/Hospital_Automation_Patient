import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:patient_app/core/style/card_container_decoration.dart';
import 'package:patient_app/core/widgets/cards/icon_key_value_widget.dart';
import 'package:patient_app/core/widgets/cards/icon_title_navigation_button.dart';
import 'package:patient_app/core/widgets/cards/key_value_card.dart';
import 'package:patient_app/core/widgets/appbars/sub_app_bar.dart';
import 'package:patient_app/configuration/res.dart';
import 'package:patient_app/configuration/router/router_utils.dart';
import 'package:patient_app/core/style/app_colors.dart';
import 'package:patient_app/core/widgets/general_image_asset.dart';
import 'package:patient_app/features/appointments/view/appointments.dart';
import 'package:patient_app/features/edit_profile/view/edit_profile_screen.dart';
part 'widget/profile_details_widget.dart';
part 'widget/profile_navigation_section.dart';
part 'widget/profile_edit_button.dart';

class ProfileScreen extends StatelessWidget {
  static const routeName = "/profile";
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SubAppBar(),
      floatingActionButton: ProfileEditButton(
        onPressed: () {
          context.push(RouterUtils.nestedRoute(AppointmentsScreen.routeName,
              routeName, EditProfileScreen.routeName));
        },
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const ProfileDetailsWidget(
                name: "john doe",
                gender: "male",
                imagePath: Res.personePlaceHolderImage,
                address: "Lattakia - Masaya Street",
                lastAppointment: "12:00 AM",
                nextAppointment: "11/11/2025"),
            const SizedBox(
              height: 24,
            ),
            ProfileNavigationSection(
              onPrescriptionTap: () {},
              onMedicalRecordTap: () {},
              onSuspendUserAccountTap: () {},
            )
          ],
        ),
      ),
    );
  }
}

class name extends StatelessWidget {
  const name({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
