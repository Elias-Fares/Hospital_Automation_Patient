part of '../department_details_screen.dart';

class DepartmentDoctorCard extends StatelessWidget {
  const DepartmentDoctorCard({
    super.key,
    required this.doctorName,
    required this.doctorImageUrl,
    required this.doctorSpecialty,
    this.onTap,
  });

  final String doctorName;
  final String doctorImageUrl;
  final String doctorSpecialty;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: CustomInkwell(
        onTap: onTap,
        color: AppColors.backgroundColor,
        borderRadius: BorderRadius.circular(8),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: containerCardDecoration(color: AppColors.transparent),
          child: PersoneTile(
              imageUrl: doctorImageUrl,
              title: doctorName,
              subtitle: doctorSpecialty),
        ),
      ),
    );
  }
}
