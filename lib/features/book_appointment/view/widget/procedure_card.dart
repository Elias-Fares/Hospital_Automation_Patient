part of '../book_appointment_screen.dart';
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
      crossAxisAlignment: CrossAxisAlignment.start,
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

