import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:patient_app/core/function/join_strings.dart';
import 'package:patient_app/core/models/doctor_model.dart';
import 'package:patient_app/core/style/app_colors.dart';
import 'package:patient_app/core/style/card_container_decoration.dart';
import 'package:patient_app/core/widgets/appbars/sub_app_bar.dart';
import 'package:patient_app/core/widgets/buttons/custom_inkwell.dart';
import 'package:patient_app/core/widgets/cards/icon_key_value_widget.dart';
import 'package:patient_app/core/widgets/cards/key_value_card.dart';
import 'package:patient_app/core/widgets/cards/outlined_card.dart';
import 'package:patient_app/core/widgets/cards/persone_tile.dart';
import 'package:patient_app/features/doctor_profile/model/availability_schedule_model.dart';
import 'package:patient_app/features/patient_doctors/view/patient_doctors_screen.dart';
part 'widget/department_details_widget.dart';
part 'widget/department_doctor_card.dart';

class DepartmentDetailsScreen extends StatefulWidget {
  const DepartmentDetailsScreen({super.key});
  static const routeName = "/department_details_screen";

  @override
  State<DepartmentDetailsScreen> createState() =>
      _DepartmentDetailsScreenState();
}

class _DepartmentDetailsScreenState extends State<DepartmentDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SubAppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            DepartmentDetailsWidget(
                departmentName: "Department of Digestive Surgery",
                currentStatus: "Open",
                workSchedule: [
                  AvailabilitySchedule(
                      day: "Sunday", schedule: "12:30 PM - 04:00 PM"),
                  AvailabilitySchedule(
                      day: "Monday", schedule: "12:30 PM - 04:00 PM"),
                  AvailabilitySchedule(
                      day: "Tuesday", schedule: "12:30 PM - 04:00 PM"),
                  AvailabilitySchedule(
                      day: "Wedensday", schedule: "12:30 PM - 04:00 PM"),
                ],
                activeDoctors: [
                  DoctorModel(
                      firstName: "Elias",
                      middleName: "Philip",
                      lastName: "Fares",
                      specialty: "General",
                      imgurl: ""),
                  DoctorModel(
                      firstName: "Elias",
                      middleName: "Philip",
                      lastName: "Fares",
                      specialty: "General",
                      imgurl: ""),
                  DoctorModel(
                      firstName: "Elias",
                      middleName: "Philip",
                      lastName: "Fares",
                      specialty: "General",
                      imgurl: ""),
                ],
                services: const [
                  "X-ray Machine",
                  "CT Scanner",
                  "Service",
                ])
          ],
        ),
      ),
    );
  }
}
