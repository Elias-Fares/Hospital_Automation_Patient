part of '../patient_prescription_screen.dart';

class PrescriptionCard extends StatelessWidget {
  const PrescriptionCard(
      {super.key,
      required this.doctorName,
      required this.doctorImageUrl,
      required this.doctorSpecialty,
      required this.medicinesCount});

  final String doctorName;
  final String doctorImageUrl;
  final String doctorSpecialty;

  final String medicinesCount;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(16),
      decoration: containerCardDecoration(),
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
            value: medicinesCount,
          )
        ],
      ),
    );
  }
}
