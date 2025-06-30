part of '../department_details_screen.dart';

class DepartmentDetailsWidget extends StatelessWidget {
  const DepartmentDetailsWidget({
    super.key,
    required this.departmentName,
    required this.currentStatus,
    required this.workSchedule,
    required this.activeDoctors,
    required this.services,
  });

  final String departmentName;
  final String currentStatus;
  final List<AvailabilitySchedule> workSchedule;
  final List<DoctorModel> activeDoctors;
  final List<String> services;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: containerCardDecoration(),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          departmentName,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(
          height: 25,
        ),
        IconKeyValueWidget(
          keyTitle: "Current Status",
          value: currentStatus,
          iconData: Icons.av_timer,
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          "Availability Schedule",
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(
          height: 8,
        ),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: List.generate(
            workSchedule.length,
            (index) => KeyValueCard(
                keyTitle: workSchedule.elementAt(index).day,
                value: workSchedule.elementAt(index).schedule),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          "Services",
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(
          height: 8,
        ),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: List.generate(
            services.length,
            (index) => OutlinedCard(
              text: services.elementAt(index),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          "Active Doctors",
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(
          height: 8,
        ),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: List.generate(
            activeDoctors.length,
            (index) => DepartmentDoctorCard(
              doctorName: joinStrings([
                activeDoctors.elementAt(index).firstName,
                activeDoctors.elementAt(index).lastName,
              ]),
              doctorSpecialty: activeDoctors.elementAt(index).specialty ?? "",
              doctorImageUrl: activeDoctors.elementAt(index).imgurl ?? "",
            ),
          ),
        ),
      ]),
    );
  }
}
