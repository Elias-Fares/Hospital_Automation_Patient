import 'package:flutter/material.dart';
import 'package:patient_app/common_widgets/card_container_decoration.dart';
import 'package:patient_app/common_widgets/icon_key_value_widget.dart';
import 'package:patient_app/common_widgets/icon_title_navigation_button.dart';
import 'package:patient_app/common_widgets/key_value_card.dart';
import 'package:patient_app/common_widgets/sub_app_bar.dart';
import 'package:patient_app/configuration/res.dart';
part 'widget/child_profile_title.dart';
part 'widget/child_details_widget.dart';
part 'widget/child_profile_navigation_section.dart';

class ChildProfileScreen extends StatelessWidget {
  static const routeName = "children_profile_screen";
  const ChildProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SubAppBar(
          titleWidget: ChildProfileTitle(
        childName: "Child name",
      )),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            const ChildDetailsWidget(
              fatherName: 'John Doe',
              motherName: 'Jane Doe',
              gender: 'Male',
              dateOfBirth: '2020-05-10',
              birthCertificate: 'ABC12345',
              lastAppointment: '2024-03-15',
              lastVaccination: 'Flu Shot',
              nextVaccination: 'MMR Booster',
              guardiansCount: '2',
            ),
            const SizedBox(
              height: 24,
            ),
            ChildProfileNavigationSection(
                onVaccinationTap: () {},
                onAppointmentTap: () {},
                onPrescriptionTap: () {},
                onMedicalRecordTap: () {}),
            const SizedBox(
              height: 24,
            ),
          ],
        ),
      ),
    );
  }
}
