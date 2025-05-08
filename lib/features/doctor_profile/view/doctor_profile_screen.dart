import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:patient_app/common_widgets/card_container_decoration.dart';
import 'package:patient_app/common_widgets/icon_key_value_widget.dart';
import 'package:patient_app/common_widgets/icon_title_navigation_button.dart';
import 'package:patient_app/common_widgets/key_value_card.dart';
import 'package:patient_app/common_widgets/outlined_card.dart';
import 'package:patient_app/common_widgets/profile_email_widget.dart';
import 'package:patient_app/common_widgets/profile_phone_widget.dart';
import 'package:patient_app/common_widgets/sub_app_bar.dart';
import 'package:patient_app/configuration/res.dart';
import 'package:patient_app/configuration/router/router_utils.dart';
import 'package:patient_app/core/app_colors.dart';
import 'package:patient_app/core/widgets/buttons/loading_button.dart';
import 'package:patient_app/core/widgets/general_image_asset.dart';
import 'package:patient_app/features/auth/view/widgets/email_widget.dart';
import 'package:patient_app/features/book_appointment/view/book_appointment_screen.dart';
import 'package:patient_app/features/main_screen/main_screen.dart';

import '../model/availability_schedule_model.dart';
part 'widget/doctor_profile_details_widget.dart';
part 'widget/doctor_profile_navigation_section.dart';
part 'widget/doctor_profile_book_appointment.dart';

class DoctorProfileScreen extends ConsumerWidget {
  const DoctorProfileScreen({super.key});
  static const routeName = "/doctor_profile_screen";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: const SubAppBar(),
      floatingActionButton: DoctorProfileBookAppointmentButton(
        onTap: () {
          context.push(RouterUtils.getNestedRoute(context,
              routeName: BookAppointmentScreen.routeName));
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            DoctorProfileDetailsWidget(
              name: "Doctor name",
              gender: "male",
              imagePath: Res.personePlaceHolderImage,
              address: "Doctor address",
              doctorSpeciality: "Cardiologist",
              doctorDepartment: "Department of Digestive Surgery",
              phoneNumber: "0999999999",
              emailAddress: "doctor@test.com",
              availabilitySchedule: [
                AvailabilitySchedule(
                    day: "Sunday", schedule: "12:30 PM - 04:00 PM"),
                AvailabilitySchedule(
                    day: "Monday", schedule: "12:30 PM - 04:00 PM"),
                AvailabilitySchedule(
                    day: "Tuesday", schedule: "12:30 PM - 04:00 PM"),
              ],
              appointmentTypes: const [
                "Check up",
                "Review",
                "Adenoid surgery",
                "Radiography",
              ],
            ),
            const SizedBox(
              height: 24,
            ),
            DoctorProfileNavigationSection(
              onPrescriptionTap: () {},
              onMedicalRecordTap: () {},
              onAppointmentsTap: () {},
            ),
            const SizedBox(
              height: 80,
            )
          ],
        ),
      ),
    );
  }
}
