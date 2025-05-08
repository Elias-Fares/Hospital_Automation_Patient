part of '../appointments.dart';

class AppointmentCard extends StatelessWidget {
  const AppointmentCard({
    super.key,
    required this.name,
    required this.type,
    required this.dateTime,
    required this.doctorName,
  });

  final String name;
  final String type;
  final String dateTime;
  final String doctorName;

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.all(16.0),
        margin: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
        decoration: BoxDecoration(
            color: AppColors.white, borderRadius: BorderRadius.circular(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const GeneralImageAssets(
                  path: Res.childCardIcon,
                  width: 40,
                  height: 40,
                ),
                const SizedBox(width: 12),
                Text(name,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(fontSize: 15)),
                const Spacer(),
                OutlinedCard(text: type)
              ],
            ),
            const SizedBox(height: 16),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  Res.calendarIcon,
                  width: 24,
                  height: 24,
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Date & Time",
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall
                          ?.copyWith(color: AppColors.hintTextColor),
                    ),
                    Text(dateTime),
                  ],
                ),
                const Spacer(),
                ClipOval(
                  child: Image.asset(
                    Res.personePlaceHolderImage,
                    width: 24,
                    height: 24,
                  ),
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Date & Time",
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall
                          ?.copyWith(color: AppColors.hintTextColor),
                    ),
                    Text(dateTime),
                  ],
                ),
              ],
            )
          ],
        ),
      );
}
