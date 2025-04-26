part of '../child_profile_screen.dart';

class ChildProfileNavigationSection extends StatelessWidget {
  const ChildProfileNavigationSection({
    super.key,
    required this.onVaccinationTap,
    required this.onAppointmentTap,
    required this.onPrescriptionTap,
    required this.onMedicalRecordTap,
  });

  final void Function() onVaccinationTap;
  final void Function() onAppointmentTap;
  final void Function() onPrescriptionTap;
  final void Function() onMedicalRecordTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: containerCardDecoration(),
      clipBehavior: Clip.hardEdge,
      child: Column(
        children: [
          IconTitleNavigationButton(
            iconPath: Res.vaccinationIcon,
            title: "Vaccination table",
            onTap: onVaccinationTap,
          ),
          IconTitleNavigationButton(
            iconPath: Res.appointmenProfiletIcon,
            title: "Appointments",
            onTap: onAppointmentTap,
          ),
          IconTitleNavigationButton(
            iconPath: Res.prescriptionsIcon,
            title: "Prescription",
            onTap: onPrescriptionTap,
          ),
          IconTitleNavigationButton(
            iconPath: Res.recordIcon,
            title: "Medical Record",
            onTap: onMedicalRecordTap,
          ),
        ],
      ),
    );
  }
}
