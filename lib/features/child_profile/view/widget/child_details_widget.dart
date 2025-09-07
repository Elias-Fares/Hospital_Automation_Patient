part of '../child_profile_screen.dart';

class ChildDetailsWidget extends StatelessWidget {
  const ChildDetailsWidget({
    super.key,
    required this.fatherName,
    required this.motherName,
    required this.gender,
    required this.dateOfBirth,
    required this.birthCertificate,
    required this.lastAppointment,
    required this.lastVaccination,
    required this.nextVaccination,
    required this.guardiansCount,
  });

  final String fatherName;
  final String motherName;
  final String gender;
  final String dateOfBirth;
  final String birthCertificate;
  final String lastAppointment;
  final String lastVaccination;
  final String nextVaccination;
  final String guardiansCount;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: containerCardDecoration(),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: Column(
        children: [
          IconKeyValueWidget(
              iconPath: Res.fatherIcon,
              keyTitle: "Father name",
              value: fatherName),
          const SizedBox(
            height: 20,
          ),
          IconKeyValueWidget(
              iconPath: Res.motherIcon,
              keyTitle: "Mother name",
              value: motherName),
          const SizedBox(
            height: 20,
          ),
          IconKeyValueWidget(
              iconPath: Res.genderIcon, keyTitle: "Gender", value: gender),
          const SizedBox(
            height: 20,
          ),
          IconKeyValueWidget(
              iconPath: Res.calendarIcon,
              keyTitle: "Date of birth",
              value: dateOfBirth),
          const SizedBox(
            height: 20,
          ),
          IconKeyValueWidget(
            iconPath: Res.certificateIcon,
            keyTitle: "Birth certificate",
            value: birthCertificate,
            needOnTap: true,
            onTap: () {},
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            width: 1.sw,
            // color: AppColors.error,
            child: Wrap(
              spacing: 10,
              runSpacing: 10,
              alignment: WrapAlignment.start,
              runAlignment: WrapAlignment.start,
              crossAxisAlignment: WrapCrossAlignment.start,
              verticalDirection: VerticalDirection.up,
              children: [
                guardiansCount.isEmpty
                    ? SizedBox.shrink()
                    : KeyValueCard(
                        keyTitle: "Gaurdians", value: guardiansCount),
                lastAppointment.isEmpty
                    ? SizedBox.shrink()
                    : KeyValueCard(
                        keyTitle: "Last appointment", value: lastAppointment),
                lastVaccination.isEmpty
                    ? SizedBox.shrink()
                    : KeyValueCard(
                        keyTitle: "Last vaccination", value: lastVaccination),
                nextVaccination.isEmpty
                    ? SizedBox.shrink()
                    : KeyValueCard(
                        keyTitle: "Next vaccination", value: nextVaccination),
              ],
            ),
          )
        ],
      ),
    );
  }
}
