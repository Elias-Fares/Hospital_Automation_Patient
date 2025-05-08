part of '../doctor_profile_screen.dart';
class DoctorProfileNavigationSection extends StatelessWidget {
  const DoctorProfileNavigationSection({
    super.key,
    required this.onPrescriptionTap,
    required this.onMedicalRecordTap,
    required this.onAppointmentsTap,
  });

  final void Function() onPrescriptionTap;
  final void Function() onMedicalRecordTap;
  final void Function() onAppointmentsTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: containerCardDecoration(),
      clipBehavior: Clip.hardEdge,
      child: Column(
        children: [
                    IconTitleNavigationButton(
            iconPath: Res.appointmenProfiletIcon,
            title: "Appointments",
            onTap: onPrescriptionTap,
          ),
          IconTitleNavigationButton(
            iconPath: Res.prescriptionsIcon,
            title: "Prescription",
            onTap: onAppointmentsTap,
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
