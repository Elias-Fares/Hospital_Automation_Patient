import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:patient_app/common_widgets/main_app_bar.dart';
import 'package:patient_app/configuration/res.dart';
import 'package:patient_app/core/app_colors.dart';
import 'package:patient_app/features/app_drawer/view/app_drawer_screen.dart';

final GlobalKey<ScaffoldState> mainScreenScaffoldKey =
    GlobalKey<ScaffoldState>();

class MainScreen extends StatefulWidget {
  const MainScreen({super.key, required this.statefulNavigationShell});
  final StatefulNavigationShell statefulNavigationShell;

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: mainScreenScaffoldKey,
      body: widget.statefulNavigationShell,
      drawer: AppDrawerScreen(
        mainScreenKey: mainScreenScaffoldKey,
      ),

      bottomNavigationBar: NavigationBar(
        selectedIndex: widget.statefulNavigationShell.currentIndex,
        onDestinationSelected: (index) {
          widget.statefulNavigationShell.goBranch(index, initialLocation: true);
        },
        height: 70,
        backgroundColor: AppColors.backgroundColor,
        indicatorColor: AppColors.primaryContainer,
        destinations: [
          NavigationDestination(
              icon: Image.asset(Res.appointmentIcon), label: "Appointments"),
          NavigationDestination(
            icon: Image.asset(Res.childNavigationBarIcon),
            label: 'Children',
          ),
          NavigationDestination(
            icon: Stack(
              children: [
                Image.asset(
                  Res.notificationIcon,
                  width: 30,
                  height: 30,
                ),
                const Positioned(
                  right: 0,
                  child: CircleAvatar(
                    radius: 8,
                    backgroundColor: AppColors.error,
                    child: Text('3',
                        style: TextStyle(fontSize: 10, color: Colors.white)),
                  ),
                )
              ],
            ),
            label: 'Notifications',
          ),
        ],
      ),
    );
  }
}


// class HomePage extends StatelessWidget {
//   final List<Map<String, String>> todayAppointments = [
//     {
//       'name': 'Mariam Saoud',
//       'tag': 'Vaccination',
//       'time': '20 Dec - 11:05 AM',
//       'doctor': 'Magferah Ahmad',
//     },
//     {
//       'name': 'Mariam Ahmad',
//       'tag': 'Check up',
//       'time': '20 Dec - 12:25 PM',
//       'doctor': 'Maram Mansoura',
//     },
//   ];

//   final List<Map<String, String>> dec2Appointments = [
//     {
//       'name': 'Jana Fares',
//       'tag': 'Adenoid surgery',
//       'time': '20 Dec - 01:15 PM',
//       'doctor': 'Elias Fares',
//     },
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 3,
//       child: Scaffold(
//         appBar: AppBar(
//           backgroundColor: Colors.white,
//           elevation: 0,
//           leading: Icon(Icons.menu, color: Colors.black),
//           title: Text('MediCare', style: TextStyle(color: Colors.black)),
//         ),
//         body: Column(
//           children: [
//             Container(
//               color: Colors.white,
//               child: TabBar(
//                 indicatorColor: Colors.deepPurple,
//                 labelColor: Colors.deepPurple,
//                 unselectedLabelColor: Colors.grey,
//                 tabs: [
//                   Tab(child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [Text("Upcoming"), SizedBox(width: 6), badge(12)],
//                   )),
//                   Tab(child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [Text("Passed"), SizedBox(width: 6), badge(1)],
//                   )),
//                   Tab(child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [Text("Missed"), SizedBox(width: 6), badge(99)],
//                   )),
//                 ],
//               ),
//             ),
//             Expanded(
//               child: TabBarView(
//                 children: [
//                   appointmentsList(),
//                   Center(child: Text('No passed appointments')),
//                   Center(child: Text('No missed appointments')),
//                 ],
//               ),
//             ),
//           ],
//         ),
//         bottomNavigationBar: BottomNavigationBar(
//           currentIndex: 0,
//           items: [
//             BottomNavigationBarItem(
//               icon: Icon(Icons.calendar_today),
//               label: 'Appointments',
//             ),
            // BottomNavigationBarItem(
            //   icon: Icon(Icons.child_care),
            //   label: 'Children',
            // ),
            // BottomNavigationBarItem(
            //   icon: Stack(
            //     children: [
            //       Icon(Icons.notifications),
            //       Positioned(
            //         right: 0,
            //         child: CircleAvatar(
            //           radius: 8,
            //           backgroundColor: Colors.red,
            //           child: Text('3', style: TextStyle(fontSize: 10, color: Colors.white)),
            //         ),
            //       )
            //     ],
            //   ),
            //   label: 'Notifications',
            // ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget appointmentsList() => ListView(
//         padding: const EdgeInsets.all(16),
//         children: [
//           Text("Today", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
//           ...todayAppointments.map((e) => appointmentCard(e)),
//           SizedBox(height: 16),
//           Text("2 Dec", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
//           ...dec2Appointments.map((e) => appointmentCard(e)),
//         ],
//       );

//   Widget appointmentCard(Map<String, String> data) => Card(
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
//         elevation: 2,
//         margin: EdgeInsets.symmetric(vertical: 8),
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Row(
//                     children: [
//                       CircleAvatar(
//                         backgroundColor: Colors.blue.shade100,
//                         child: Icon(Icons.person, color: Colors.blue),
//                       ),
//                       SizedBox(width: 12),
//                       Text(data['name']!, style: TextStyle(fontWeight: FontWeight.bold)),
//                     ],
//                   ),
//                   OutlinedButton(
//                     onPressed: () {},
//                     style: OutlinedButton.styleFrom(
//                       shape: StadiumBorder(),
//                       side: BorderSide(color: Colors.blue),
//                     ),
//                     child: Text(data['tag']!),
//                   )
//                 ],
//               ),
//               SizedBox(height: 16),
//               Row(
//                 children: [
//                   Icon(Icons.calendar_today, size: 18, color: Colors.grey),
//                   SizedBox(width: 6),
//                   Text(data['time']!),
//                   SizedBox(width: 16),
//                   Icon(Icons.person, size: 18, color: Colors.grey),
//                   SizedBox(width: 6),
//                   Text('Dr. ${data['doctor']}'),
//                 ],
//               )
//             ],
//           ),
//         ),
//       );

//   Widget badge(int count) => Container(
//         padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
//         decoration: BoxDecoration(
//           color: Colors.deepPurple.withOpacity(0.1),
//           borderRadius: BorderRadius.circular(12),
//         ),
//         child: Text(
//           count > 99 ? '99+' : count.toString(),
//           style: TextStyle(fontSize: 12, color: Colors.deepPurple),
//         ),
//       );
// }
