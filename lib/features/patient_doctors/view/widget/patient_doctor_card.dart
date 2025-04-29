
part of '../patient_doctors_screen.dart';

class PatientDoctorCard extends StatelessWidget {
  const PatientDoctorCard({
    super.key,
    required this.doctorName,
    required this.doctorImageUrl,
    required this.doctorSpecialty,

  });

  final String doctorName;
  final String doctorImageUrl;
  final String doctorSpecialty;


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(16),
      decoration: containerCardDecoration(),
      child: PersoneTile(
          imageUrl: doctorImageUrl,
          tile: doctorName,
          subtitle: doctorSpecialty),
    );
  }
}
