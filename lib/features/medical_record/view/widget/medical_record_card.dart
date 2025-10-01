part of '../medical_record_screen.dart';

class MedicalRecordCard extends StatelessWidget {
  const MedicalRecordCard({
    super.key,
    required this.doctorName,
    required this.doctorImageUrl,
    required this.doctorSpecialty,
    required this.appointmentsCount,
    required this.prescriptionCount,
    this.onAppointmentTap,
    this.onPrescriptionTap,
  });

  final String doctorName;
  final String doctorImageUrl;
  final String doctorSpecialty;

  final String appointmentsCount;
  final String prescriptionCount;

  final void Function()? onAppointmentTap;

  final void Function()? onPrescriptionTap;

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
              title: doctorName,
              subtitle: doctorSpecialty),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconKeyValueWidget(
                iconPath: Res.appointmenProfiletIcon,
                keyTitle: "Appointments",
                value: appointmentsCount,
                onTap: onAppointmentTap,
                needOnTap: true,
                withArrow: false,
              ),
              IconKeyValueWidget(
                iconPath: Res.appointmenProfiletIcon,
                keyTitle: "Prescription",
                value: prescriptionCount,
                onTap: onPrescriptionTap,
                needOnTap: true,
                withArrow: false,
              ),
            ],
          )
        ],
      ),
    );
  }
}
