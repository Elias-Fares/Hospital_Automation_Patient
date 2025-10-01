import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/constant/constant.dart';
import '../../../core/function/join_strings.dart';
import '../../../core/widgets/appbars/sub_app_bar.dart';
import '../../../data/medical_records/models/medical_record_model.dart';
import '../../../data/perscriptions/models/prescription_model.dart';
import '../../patient_prescription/view/patient_prescription_screen.dart';
import '../../patient_prescription/view_model/patient_prescription_view_model.dart';

class MedicalRecordPrescriptionsScreen extends ConsumerStatefulWidget {
  const MedicalRecordPrescriptionsScreen({
    super.key,
    required this.prescriptions,
  });
  static const routeName = "/medical_record_prescriptions_screen";
  final MedicalRecordModel prescriptions;

  @override
  ConsumerState<MedicalRecordPrescriptionsScreen> createState() =>
      _MedicalRecordPrescriptionsScreenState();
}

class _MedicalRecordPrescriptionsScreenState
    extends ConsumerState<MedicalRecordPrescriptionsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: SubAppBar(),
        body: ListView.builder(
          padding: EdgeInsets.symmetric(horizontal: 16),
          itemCount: widget.prescriptions.doctorPrescription?.length ?? 0,
          itemBuilder: (context, index) {
            final prescription =
                widget.prescriptions.doctorPrescription?.elementAt(index) ??
                    PrescriptionModel();
            return PrescriptionCard(
              doctorName: joinStrings([
                widget.prescriptions.doctorInfo?.firstName ??
                    "no doctor details",
                widget.prescriptions.doctorInfo?.lastName
              ]),
              doctorImageUrl:
                  "${Constant.baseUrl}/${prescription.doctorModel?.imgurl}",
              doctorSpecialty: prescription.doctorModel?.specialty ?? "",
              medicinesNames: ref
                  .read(patientPrescriptionViewModelProvider.notifier)
                  .getMedicinesNames(
                      prescriptionMedicines:
                          prescription.prescriptionMedicines),
              onPrescriptionCardTap: () {
                // context.push(
                //     RouterUtils.getNestedRoute(context,
                //         routeName:
                //             PrescriptionDetailsScreen.routeName),
                //     extra: prescription);
              },
            );
          },
        ));
  }
}
