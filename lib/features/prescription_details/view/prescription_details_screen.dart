import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../configuration/res.dart';
import '../../../core/function/join_strings.dart';
import '../../../core/models/prescription_medicine_model.dart';
import '../../../core/style/card_container_decoration.dart';
import '../../../core/widgets/appbars/sub_app_bar.dart';
import '../../../core/widgets/cards/icon_key_value_widget.dart';
import '../../../core/widgets/cards/persone_tile.dart';
import '../../../data/perscriptions/models/prescription_model.dart';

class PrescriptionDetailsScreen extends ConsumerStatefulWidget {
  const PrescriptionDetailsScreen({
    super.key,
    required this.prescriptionModel,
  });
  static const routeName = "/prescription_details_screen";

  final PrescriptionModel? prescriptionModel;

  @override
  ConsumerState<PrescriptionDetailsScreen> createState() =>
      _PrescriptionDetailsScreenState();
}

class _PrescriptionDetailsScreenState
    extends ConsumerState<PrescriptionDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SubAppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PrescriptionDetailsWidget(
              code: widget.prescriptionModel?.code ?? "",
              note: widget.prescriptionModel?.note ?? "",
              doctorName: joinStrings([
                widget.prescriptionModel?.doctorModel?.firstName,
                widget.prescriptionModel?.doctorModel?.middleName,
                widget.prescriptionModel?.doctorModel?.lastName,
              ]),
              doctorSpeciality:
                  widget.prescriptionModel?.doctorModel?.specialty ?? "",
              doctorProfileImage:
                  widget.prescriptionModel?.doctorModel?.imgurl ?? "",
            ),
            const SizedBox(
              height: 16,
            ),
            IncludedMedicines(
              prescriptionMedicines:
                  widget.prescriptionModel?.prescriptionMedicines ?? [],
            )
          ],
        ),
      ),
    );
  }
}

class IncludedMedicines extends StatelessWidget {
  const IncludedMedicines({
    super.key,
    this.prescriptionMedicines,
  });
  final List<PrescriptionMedicine>? prescriptionMedicines;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: containerCardDecoration(),
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "The medicines on this prescription:",
            style: Theme.of(context).textTheme.titleSmall,
          ),
          const SizedBox(
            height: 16,
          ),
          ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: prescriptionMedicines?.length ?? 0,
            separatorBuilder: (context, index) => const SizedBox(
              height: 14,
            ),
            itemBuilder: (context, index) {
              final med = prescriptionMedicines?.elementAtOrNull(index);

              return IconKeyValueWidget(
                keyTitle:
                    "${med?.medicine?.name ?? ""} (${med?.medicine?.pharmaceuticalTiter ?? ""})",
                value: med?.howToTake ?? "",
                iconPath: Res.drawerMedicineIcon,
              );
            },
          )
        ],
      ),
    );
  }
}

class PrescriptionDetailsWidget extends StatelessWidget {
  const PrescriptionDetailsWidget({
    super.key,
    required this.code,
    required this.note,
    required this.doctorName,
    required this.doctorSpeciality,
    required this.doctorProfileImage,
  });

  final String code;
  final String note;
  final String doctorName;
  final String doctorSpeciality;
  final String doctorProfileImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: containerCardDecoration(),
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PersoneTile(
              imageUrl: doctorProfileImage,
              title: doctorName,
              subtitle: doctorSpeciality),
          const SizedBox(
            height: 16,
          ),
          IconKeyValueWidget(
            keyTitle: "Prescription Code",
            value: code,
            iconData: Icons.qr_code_sharp,
          ),
          const SizedBox(
            height: 16,
          ),
          IconKeyValueWidget(
            keyTitle: "Notes",
            value: note,
            iconData: Icons.note_alt_outlined,
          )
        ],
      ),
    );
  }
}
