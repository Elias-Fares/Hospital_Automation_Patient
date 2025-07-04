part of '../vaccines_screen.dart';

class VaccineCard extends StatelessWidget {
  const VaccineCard({
    super.key,
    required this.vaccineName,
    required this.vaccineDescription,
    required this.vaccineAgeRange, this.onVaccineCardTap,
  });

  final String vaccineName;

  final String vaccineDescription;
  final String vaccineAgeRange;
  final void Function()? onVaccineCardTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: CustomInkwell(
        onTap: onVaccineCardTap,
        borderRadius: BorderRadius.circular(8),
        color: AppColors.white,
        child: Container(
          // decoration: containerCardDecoration(),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                vaccineName,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(fontWeight: FontWeight.w700),
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                vaccineDescription,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(fontWeight: FontWeight.w400),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                vaccineAgeRange,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.w400,
                    color: AppColors.onSurfaceVariant),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
