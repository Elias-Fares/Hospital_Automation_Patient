import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:patient_app/core/style/card_container_decoration.dart';
import 'package:patient_app/core/widgets/cards/persone_tile.dart';
import 'package:patient_app/core/widgets/appbars/sub_app_bar.dart';
import 'package:patient_app/configuration/res.dart';
import 'package:patient_app/core/style/app_colors.dart';
import 'package:patient_app/core/widgets/buttons/custom_inkwell.dart';
import 'package:patient_app/core/widgets/buttons/loading_button.dart';
import 'package:patient_app/features/book_appointment/model/medical_procedure_model.dart';
import 'package:patient_app/features/book_appointment/view_model/riverpod/book_appointment_view_model.dart';
import 'package:patient_app/features/book_appointment/view_model/state/book_appointment_state.dart';

class BookAppointmentScreen extends ConsumerWidget {
  BookAppointmentScreen({super.key});
  static const routeName = "/book_appointment_screen";
  final List<MedicalProcedure> procedures = [
    MedicalProcedure(
      id: "1",
      name: "Check up",
      description:
          "If you are worried about being sick it is always good to do a check up.",
      durationInMinutes: 15,
    ),
    MedicalProcedure(
      id: "2",
      name: "Review",
      description:
          "When the doctor already knows about you medical and you are only going for a quick review to make sure your medical state is stable.",
      durationInMinutes: 10,
    ),
    MedicalProcedure(
      id: "3",
      name: "Adenoid surgery",
      description:
          "When the doctor already knows about you medical and you are only going for a quick Adenoid surgery to make sure your medical state is stable.",
      durationInMinutes: 40,
    ),
    MedicalProcedure(
      id: "4",
      name: "Radiography",
      description:
          "When the doctor already knows about you medical and you are only going for a quick Radiography to make sure your medical state is stable.",
      durationInMinutes: 20,
    ),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final BookAppointmentState bookAppointmentState =
        ref.watch(bookAppointmentViewModelProvider);
    final bookAppointmentNotifier =
        ref.read(bookAppointmentViewModelProvider.notifier);
    return Scaffold(
      appBar: const SubAppBar(
        titleWidget: PersoneTile(
            imageUrl: Res.personePlaceHolderImage,
            tile: "Doctor Name",
            subtitle: "Cardiologist"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Container(
              decoration: containerCardDecoration(),
              padding: const EdgeInsets.all(16),
              child: ListView.builder(
                itemCount: procedures.length,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  final procedure = procedures.elementAtOrNull(index);
                  final isSelected =
                      bookAppointmentState.selectedProcedure == procedure?.id;
                  return ProcedureCard(
                    isSelected: isSelected,
                    procedureId: procedure?.id ?? "",
                    procedureName: procedure?.name ?? "",
                    procedureDescription: procedure?.description ?? "",
                    procedureDuration:
                        procedure?.durationInMinutes.toString() ?? "",
                    onSelect: (id) {
                      bookAppointmentNotifier.selectChoice(id);
                    },
                  );
                },
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            const LoadingButton(title: "Next")
          ],
        ),
      ),
    );
  }
}

class ProcedureCard extends StatelessWidget {
  const ProcedureCard({
    super.key,
    required this.isSelected,
    required this.procedureName,
    required this.procedureDuration,
    required this.procedureDescription,
    this.onSelect,
    required this.procedureId,
  });

  final bool isSelected;
  final String procedureId;
  final String procedureName;
  final String procedureDuration;
  final String procedureDescription;
  final void Function(String)? onSelect;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            ChoiceChip(
              label: Text(
                procedureName,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(color: AppColors.primary),
              ),
              selected: isSelected,
              selectedColor: AppColors.primaryContainer.withOpacity(.3),
              checkmarkColor: AppColors.primary,
              backgroundColor: AppColors.white,
              onSelected: (value) {
                onSelect!(procedureId);
              },
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                  side: const BorderSide(color: AppColors.primary)),
            ),
            const Spacer(),
            Text(
              "$procedureDuration min",
              style: Theme.of(context)
                  .textTheme
                  .bodySmall
                  ?.copyWith(color: AppColors.hintTextColor),
            )
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          procedureDescription,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        const SizedBox(
          height: 8,
        ),
        const Divider(
          color: AppColors.outlineVariant,
          thickness: 0.5,
        ),
        const SizedBox(
          height: 8,
        ),
      ],
    );
  }
}
