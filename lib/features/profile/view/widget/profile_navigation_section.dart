part of '../profile_screen.dart';

class ProfileNavigationSection extends StatelessWidget {
  const ProfileNavigationSection({
    super.key,
    required this.onPrescriptionTap,
    required this.onMedicalRecordTap,
    required this.onSuspendUserAccountTap,
  });

  final void Function() onPrescriptionTap;
  final void Function() onMedicalRecordTap;
  final void Function() onSuspendUserAccountTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: containerCardDecoration(),
      clipBehavior: Clip.hardEdge,
      child: Column(
        children: [
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
          IconTitleNavigationButton(
            iconPath: Res.logOutIcon,
            title: "log out",
            onTap: onSuspendUserAccountTap,
            textColor: AppColors.error,
          ),
        ],
      ),
    );
  }
}
