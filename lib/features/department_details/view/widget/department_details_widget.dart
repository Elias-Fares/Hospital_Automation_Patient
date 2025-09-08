part of '../department_details_screen.dart';

class DepartmentDetailsWidget extends StatelessWidget {
  const DepartmentDetailsWidget({
    super.key,
    required this.departmentName,
    required this.currentStatus,
    required this.availabilitySchedule,
    required this.activeDoctors,
    required this.services,
    required this.onDoctorCardTap,
  });

  final String departmentName;
  final String currentStatus;
  final List<WorkDay> availabilitySchedule;
  final List<User> activeDoctors;
  final List<String> services;
  final void Function(int) onDoctorCardTap;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
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
              availabilitySchedule.length,
              (index) => KeyValueCard(
                  // keyTitle: "",
                  keyTitle: availabilitySchedule.elementAt(index).day ?? "",
                  value: joinStrings([
                    availabilitySchedule
                        .elementAt(index)
                        .workStartTime
                        ?.substring(0, 5),
                    availabilitySchedule
                        .elementAt(index)
                        .workStartTime
                        ?.substring(0, 5),
                  ])),
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
                onTap: () {
                  onDoctorCardTap(index);
                },
                doctorName: joinStrings([
                  activeDoctors.elementAt(index).firstName,
                  activeDoctors.elementAt(index).lastName,
                ]),
                doctorSpecialty: activeDoctors.elementAt(index).specialty ?? "",
                doctorImageUrl:
                    "${Constant.baseUrl}/${activeDoctors.elementAt(index).imgurl ?? ""}",
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
