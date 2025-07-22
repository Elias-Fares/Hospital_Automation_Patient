import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:patient_app/configuration/res.dart';
import 'package:patient_app/core/function/join_strings.dart';
import 'package:patient_app/core/style/card_container_decoration.dart';
import 'package:patient_app/core/widgets/appbars/sub_app_bar.dart';
import 'package:patient_app/core/widgets/buttons/loading_button.dart';
import 'package:patient_app/core/widgets/cards/icon_key_value_widget.dart';
import 'package:patient_app/data/vaccines/models/vaccine_model.dart';
import 'package:patient_app/features/patient_doctors/view/patient_doctors_screen.dart';
import 'package:patient_app/features/vaccine_details/view_model/vaccine_details_view_model.dart';
part 'widget/vaccine_details_page.dart';

class VaccineDetailsScreen extends ConsumerWidget {
  const VaccineDetailsScreen({
    super.key,
    required this.vaccine,
  });
  static const routeName = "/vaccine_details_screen";

  final VaccineModel? vaccine;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: SubAppBar(
        titleWidget: Text(
          "Vaccine name",
          style: Theme.of(context)
              .textTheme
              .titleMedium
              ?.copyWith(fontWeight: FontWeight.w700),
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: LoadingButton(
          title: "Book Vaccine",
          onTap: () {
            if (vaccine != null && vaccine!.vaccinesId != null) {
              ref
                  .read(vaccineDetailsViewModelProvider.notifier)
                  .setVaccineId(vaccineId: vaccine!.vaccinesId!.toString());

              context.push(PatientDoctorsScreen.routeName);
            }
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: SingleChildScrollView(
        child: VaccineDetailsPage(
            fromAge: joinStrings([
              vaccine?.minAge?.toString(),
              vaccine?.minAgeUnit?.toLowerCase()
            ]),
            toAge: joinStrings([
              vaccine?.maxAge?.toString(),
              vaccine?.maxAgeUnit?.toLowerCase()
            ]),
            availability: vaccine?.state?.toLowerCase() ?? "",
            description: vaccine?.description ?? "",
            interactions: vaccine?.interactions
                    ?.map(
                      (e) => e.description ?? "",
                    )
                    .toList() ??
                []),
      ),
    );
  }
}
