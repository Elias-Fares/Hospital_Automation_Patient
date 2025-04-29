
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:patient_app/common_widgets/app_bar_title_widget.dart';
import 'package:patient_app/common_widgets/card_container_decoration.dart';
import 'package:patient_app/common_widgets/icon_key_value_widget.dart';
import 'package:patient_app/common_widgets/persone_tile.dart';
import 'package:patient_app/common_widgets/sub_app_bar.dart';
import 'package:patient_app/configuration/res.dart';

part 'widget/prescription_card.dart';

class PatientPrescriptionScreen extends ConsumerWidget {
  const PatientPrescriptionScreen({super.key});
  static const routeName = "/patient_prescription_screen";

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
              itemBuilder: (context, index) => const PrescriptionCard(
                  doctorName: "Lorem Ipsum",
                  doctorImageUrl: Res.personePlaceHolderImage,
                  doctorSpecialty: "Lorem",
                  medicinesCount: "2",
               
                  
                  ),
            )
          ],
        ),
      ),
    );
  }
}


