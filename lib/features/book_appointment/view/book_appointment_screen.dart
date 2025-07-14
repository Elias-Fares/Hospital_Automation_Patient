import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:patient_app/configuration/router/router_utils.dart';
import 'package:patient_app/core/enums/params_values.dart';
import 'package:patient_app/core/function/join_strings.dart';
import 'package:patient_app/core/style/card_container_decoration.dart';
import 'package:patient_app/core/widgets/cards/persone_tile.dart';
import 'package:patient_app/core/widgets/appbars/sub_app_bar.dart';
import 'package:patient_app/configuration/res.dart';
import 'package:patient_app/core/style/app_colors.dart';
import 'package:patient_app/core/widgets/buttons/custom_inkwell.dart';
import 'package:patient_app/core/widgets/buttons/loading_button.dart';
import 'package:patient_app/features/book_appointment/model/medical_procedure_model.dart';
import 'package:patient_app/features/book_appointment/view_model/book_appointment_view_model.dart';
import 'package:patient_app/features/book_appointment/view_model/book_appointment_state.dart';
import 'package:patient_app/features/choose_appointment_date/view/choose_appointment_date_screen.dart';
import 'package:patient_app/features/doctor_profile/view_model/doctor_profile_view_model.dart';

part 'widget/procedure_card.dart';

class BookAppointmentScreen extends ConsumerWidget {
  const BookAppointmentScreen({super.key});
  static const routeName = "/book_appointment_screen";
  // final List<MedicalProcedure> procedures = [
  //   MedicalProcedure(
  //     id: "1",
  //     name: "Check up",
  //     description:
  //         "If you are worried about being sick it is always good to do a check up.",
  //     durationInMinutes: 15,
  //   ),
  //   MedicalProcedure(
  //     id: "2",
  //     name: "Review",
  //     description:
  //         "When the doctor already knows about you medical and you are only going for a quick review to make sure your medical state is stable.",
  //     durationInMinutes: 10,
  //   ),
  //   MedicalProcedure(
  //     id: "3",
  //     name: "Adenoid surgery",
  //     description:
  //         "When the doctor already knows about you medical and you are only going for a quick Adenoid surgery to make sure your medical state is stable.",
  //     durationInMinutes: 40,
  //   ),
  //   MedicalProcedure(
  //     id: "4",
  //     name: "Radiography",
  //     description:
  //         "When the doctor already knows about you medical and you are only going for a quick Radiography to make sure your medical state is stable.",
  //     durationInMinutes: 20,
  //   ),
  // ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final doctorProfileModel = ref
        .watch(doctorProfileViewModelProvider)
        .doctorProfileResponse
        ?.asData
        ?.value;
    final BookAppointmentState bookAppointmentState =
        ref.watch(bookAppointmentViewModelProvider);

    return Scaffold(
      appBar: SubAppBar(
        titleWidget: PersoneTile(
            imageUrl: doctorProfileModel?.imgurl ?? "",
            tile: joinStrings([
              doctorProfileModel?.firstName,
              doctorProfileModel?.lastName,
            ]),
            subtitle: doctorProfileModel?.specialty ?? ""),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            Text(
              "Who is this appointment for?",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(
              height: 10,
            ),
            RadioListTile<ParamsValues>(
              value: ParamsValues.patient,
              groupValue: bookAppointmentState.paramsValue,
              title: Text(
                "For Me",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              visualDensity: const VisualDensity(
                  horizontal: VisualDensity.minimumDensity,
                  vertical: VisualDensity.minimumDensity),
              onChanged: (value) {
                ref
                    .read(bookAppointmentViewModelProvider.notifier)
                    .selectParamValue(value);
              },
            ),
            RadioListTile<ParamsValues>(
              value: ParamsValues.child,
              groupValue: bookAppointmentState.paramsValue,
              title: Text(
                "For child I am guardian of",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              visualDensity: const VisualDensity(
                  horizontal: VisualDensity.minimumDensity,
                  vertical: VisualDensity.minimumDensity),
              onChanged: (value) {
                debugPrint(value.toString());
                ref
                    .read(bookAppointmentViewModelProvider.notifier)
                    .selectParamValue(value);
              },
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              decoration: containerCardDecoration(),
              padding: const EdgeInsets.all(16),
              child: ListView.builder(
                itemCount: doctorProfileModel?.appointmentTypes?.length ?? 0,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  final procedure = doctorProfileModel?.appointmentTypes
                      ?.elementAtOrNull(index);
                  final isSelected = bookAppointmentState.selectedProcedure ==
                      procedure?.appointmentTypesId.toString();
                  return ProcedureCard(
                    isSelected: isSelected,
                    procedureId:
                        procedure?.appointmentTypesId?.toString() ?? "",
                    procedureName: procedure?.typeName ?? "",
                    procedureDescription: procedure?.description ?? "",
                    procedureDuration:
                        procedure?.standardDuration.toString() ?? "",
                    onSelect: (id) {
                      ref
                          .read(bookAppointmentViewModelProvider.notifier)
                          .selectChoice(id);
                    },
                  );
                },
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            LoadingButton(
              title: "Next",
              onTap: () {
                context.push(RouterUtils.getNestedRoute(context,
                    routeName: ChooseAppointmentDateScreen.routeName));
              },
            )
          ],
        ),
      ),
    );
  }
}

