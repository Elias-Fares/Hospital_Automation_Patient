part of '../appointments.dart';

class AppointmentTabView extends StatelessWidget {
  const AppointmentTabView(
      {super.key, required this.appointments, required this.onRefresh});

  final List<AppointmentModel> appointments;
  final Future<void> Function() onRefresh;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: onRefresh,
      child: ListView.builder(
        itemCount: appointments.length,
        physics: const AlwaysScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          final data = appointments.elementAt(index);
          return AppointmentCard(
            name: data.child != null
                ? joinStrings([
                    data.child?.firstName,
                    data.child?.lastName,
                  ])
                : joinStrings([data.user?.firstName, data.user?.lastName]),
            dateTime: data.date?.getYearMonthDay() ?? "",
            doctorName: joinStrings([
              data.doctor?.firstName,
              data.doctor?.middleName,
              data.doctor?.lastName
            ]),
            doctorProfileImageUrl:
                "${Constant.baseUrl}/${data.doctor?.imgurl ?? ""}",
            type: data.appointmentType?.typeName ?? "",
            onAppointmentCardTap: () {
              context.push(
                  RouterUtils.getNestedRoute(
                    context,
                    routeName: AppointmentDetailsScreen.routeName,
                  ),
                  extra: data);
            },
          );
        },
      ),
    );
  }
}
