part of 'appointments.dart';

class AppointmentsScreen extends StatelessWidget {
  static const routeName = "/appointments";
  final List<Map<String, String>> upcomingAppointments = const [
    {
      'name': 'Mariam Saoud',
      'tag': 'Vaccination',
      'time': '20 Dec - 11:05 AM',
      'doctor': 'Magferah Ahmad',
    },
    {
      'name': 'Mariam Ahmad',
      'tag': 'Check up',
      'time': '20 Dec - 12:25 PM',
      'doctor': 'Maram Mansoura',
    },
    {
      'name': 'Jana Fares',
      'tag': 'Adenoid surgery',
      'time': '20 Dec - 01:15 PM',
      'doctor': 'Elias Fares',
    },
  ];

  // final List<Map<String, String>> dec2Appointments = const [

  // ];

  const AppointmentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: const MainAppBar(),
        body: Column(
          children: [
            const AppointmentsTabBar(),
            const SizedBox(
              height: 15,
            ),
            Expanded(
              child: TabBarView(
                children: [
                  // appointmentsList(),
                  AppointmentTabView(appointments: upcomingAppointments),
                  const Center(child: Text('No passed appointments')),
                  const Center(child: Text('No missed appointments')),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}



/**
 * 
 *      'name': 'Mariam Ahmad',
      'tag': 'Check up',
      'time': '20 Dec - 12:25 PM',
      'doctor': 'Maram Mansoura',
 */

