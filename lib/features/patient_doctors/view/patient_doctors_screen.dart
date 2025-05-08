import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:patient_app/common_widgets/card_container_decoration.dart';
import 'package:patient_app/common_widgets/persone_tile.dart';
import 'package:patient_app/common_widgets/sub_app_bar.dart';
import 'package:patient_app/configuration/res.dart';
import 'package:patient_app/core/app_colors.dart';
import 'package:patient_app/core/widgets/buttons/custom_inkwell.dart';
import 'package:patient_app/features/doctor_profile/view/doctor_profile_screen.dart';
import 'package:patient_app/features/main_screen/main_screen.dart';

import '../../../configuration/router/router_utils.dart';

part 'widget/patient_doctor_card.dart';

class PatientDoctorsScreen extends ConsumerWidget {
  const PatientDoctorsScreen({super.key});
  static const routeName = "/patient_doctors_screen";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: const SubAppBar(
        withSearch: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            ListView.builder(
              itemCount: 4,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) => PatientDoctorCard(
                doctorName: "Lorem Ipsum",
                doctorSpecialty: "Lorem",
                doctorImageUrl: Res.personePlaceHolderImage,
                onTap: () {
                  context.push(RouterUtils.nestedRoute(
                      PatientDoctorsScreen.routeName,
                      DoctorProfileScreen.routeName));
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
