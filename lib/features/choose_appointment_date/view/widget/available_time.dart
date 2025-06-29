part of '../choose_appointment_date_screen.dart';

class AvailableTime extends StatelessWidget {
  const AvailableTime(
      {super.key,
      required this.selectedDate,
      required this.availableTimeValue});

  final String selectedDate;
  final String availableTimeValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Available Time",
          style: Theme.of(context)
              .textTheme
              .titleLarge
              ?.copyWith(fontWeight: FontWeight.w700),
        ),
        const SizedBox(
          height: 6,
        ),
        Text(
          "Our system will choose the first available time for your appointment at $selectedDate",
          style: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(color: AppColors.hintTextColor),
        ),
        const SizedBox(
          height: 10,
        ),
        OutlinedCard(
          text: availableTimeValue,
          icon: const Icon(
            Icons.access_time,
            color: AppColors.primary,
            size: 20,
          ),
        )
      ],
    );
  }
}
