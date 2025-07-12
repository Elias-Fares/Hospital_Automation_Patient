part of '../patient_prescription_screen.dart';

class PrescriptionCard extends StatelessWidget {
  const PrescriptionCard(
      {super.key,
      required this.doctorName,
      required this.doctorImageUrl,
      required this.doctorSpecialty,
      required this.medicinesNames,
      this.onPrescriptionCardTap});

  final String doctorName;
  final String doctorImageUrl;
  final String doctorSpecialty;

  final String medicinesNames;
  final void Function()? onPrescriptionCardTap;

  @override
  Widget build(BuildContext context) {
    return CustomInkwell(
      onTap: onPrescriptionCardTap,
      color: AppColors.white,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
        child: Column(
          children: [
            PersoneTile(
                imageUrl: doctorImageUrl,
                tile: doctorName,
                subtitle: doctorSpecialty),
            const SizedBox(
              height: 20,
            ),
            IconKeyValueWidget(
              iconPath: Res.medicineIcon,
              keyTitle: "Medicines",
              value: medicinesNames,
            )
          ],
        ),
      ),
    );
  }
}
