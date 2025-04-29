import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:patient_app/common_widgets/card_container_decoration.dart';
import 'package:patient_app/common_widgets/persone_tile.dart';
import 'package:patient_app/common_widgets/sub_app_bar.dart';
import 'package:patient_app/configuration/res.dart';

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
              itemBuilder: (context, index) => const PatientDoctorCard(
                doctorName: "Lorem Ipsum",
                doctorSpecialty: "Lorem",
                doctorImageUrl: Res.personePlaceHolderImage,
              ),
            )
          ],
        ),
      ),
    );
  }
}
