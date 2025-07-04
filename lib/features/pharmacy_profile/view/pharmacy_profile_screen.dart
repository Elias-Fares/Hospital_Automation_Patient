import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:patient_app/configuration/res.dart';
import 'package:patient_app/core/style/card_container_decoration.dart';
import 'package:patient_app/core/widgets/appbars/app_bar_title_widget.dart';
import 'package:patient_app/core/widgets/appbars/sub_app_bar.dart';
import 'package:patient_app/core/widgets/cards/icon_key_value_widget.dart';
import 'package:patient_app/core/widgets/cards/icon_title_navigation_button.dart';
import 'package:patient_app/core/widgets/cards/key_value_card.dart';
import 'package:patient_app/core/widgets/cards/outlined_card.dart';
import 'package:patient_app/core/widgets/cards/profile_email_widget.dart';
import 'package:patient_app/core/widgets/cards/profile_phone_widget.dart';
import 'package:patient_app/features/doctor_profile/model/availability_schedule_model.dart';
part 'widget/pharmacy_profile_details_section.dart';
part 'widget/pharmacy_profile_navigation_section.dart';

class PharmacyProfileScreen extends ConsumerStatefulWidget {
  const PharmacyProfileScreen({super.key});
  static const routeName = "/pharmacy_profile_screen";

  @override
  ConsumerState<PharmacyProfileScreen> createState() =>
      _PharmacyProfileScreenState();
}

class _PharmacyProfileScreenState extends ConsumerState<PharmacyProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SubAppBar(
        titleWidget: AppBarTitleWidget(
          title: "Pharmacist name",
          imagePath: "",
          subtitle: "Pharmacy name",
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            PharmacyProfileDetailsSection(
              currentState: "Closed",
              pharmacyaddress:
                  "Tartous - Banias - The main square - Opposite of Falalfel Abo Adnan",
              residentialsAddress: "Tartous - Banias - The main square",
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
            ),
            const SizedBox(
              height: 24,
            ),
            PharmacyProfileNavigationSection(
              onPrescriptionTap: () {},
              onMedicinesTap: () {},
              onContractHistortTap: () {},
            ),
            const SizedBox(
              height: 40,
            )
          ],
        ),
      ),
    );
  }
}
