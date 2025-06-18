import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:patient_app/core/widgets/appbars/app_bar_title_widget.dart';
import 'package:patient_app/core/style/card_container_decoration.dart';
import 'package:patient_app/core/widgets/cards/icon_key_value_widget.dart';
import 'package:patient_app/core/widgets/cards/persone_tile.dart';
import 'package:patient_app/core/widgets/appbars/sub_app_bar.dart';
import 'package:patient_app/configuration/res.dart';
part 'widget/medical_record_card.dart';

class PatientMedicalRecordScreen extends ConsumerWidget {
  const PatientMedicalRecordScreen({super.key});
  static const routeName = "/patient_medical_record_screen";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: const SubAppBar(
        titleWidget: AppBarTitleWidget(
            title: "Patient Name", imagePath: Res.personePlaceHolderImage),
        withSearch: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            const SizedBox(
              height: 15,
            ),
            ListView.builder(
              itemCount: 4,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) => const MedicalRecordCard(
                  doctorName: "Lorem Ipsum",
                  doctorImageUrl: Res.personePlaceHolderImage,
                  doctorSpecialty: "Lorem",
                  appointmentsCount: "2",
                  prescriptionCount: "6"),
            )
          ],
        ),
      ),
    );
  }
}
