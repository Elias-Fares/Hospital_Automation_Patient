part of '../appointments.dart';
class AppointmentTabView extends StatelessWidget {
  const AppointmentTabView(
      {super.key, required this.appointments});

  final List<Map<String, String>> appointments;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: appointments.length,
      itemBuilder: (context, index) {
        final data = appointments.elementAt(index);
        return AppointmentCard(
          name: data["name"]!,
          dateTime: data["time"]!,
          doctorName: data["doctor"]!,
          type: data["tag"]!,
        );
      },
    );
  }
}
