part of "../choose_appointment_date_screen.dart";

class BookAppointmentCalendar extends StatelessWidget {
  const BookAppointmentCalendar(
      {super.key,
      required this.focusedDay,
      required this.calendarFormat,
      this.selectedDayPredicate,
      this.onDaySelected,
      this.onFormatChanged,
      this.onPageChanged,
      required this.selectedDays});
  final DateTime focusedDay;
  final CalendarFormat calendarFormat;
  final bool Function(DateTime)? selectedDayPredicate;
  final void Function(DateTime, DateTime)? onDaySelected;
  final void Function(CalendarFormat)? onFormatChanged;
  final void Function(DateTime)? onPageChanged;

  final List<DateTime> selectedDays;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TableCalendar(
          calendarBuilders: CalendarBuilders(
            defaultBuilder: (context, day, focusedDay) {
              return null;

              // if (selectedDays.contains(day)) {
              //   return Container(
              //     margin: const EdgeInsets.all(4.0),
              //     alignment: Alignment.center,
              //     decoration: BoxDecoration(
              //       color: AppColors.primary
              //           .withOpacity(.3), // Change to your desired color
              //       shape: BoxShape.circle, // Or use a rectangle
              //     ),
              //     child: Text(
              //       day.day.toString(),
              //       style: Theme.of(context)
              //           .textTheme
              //           .bodyLarge
              //           ?.copyWith(color: AppColors.error), // Text color
              //     ),
              //   );
              // }
              // return null;
            },
          ),
          focusedDay: focusedDay,
          firstDay: DateTime(2025),
          lastDay: DateTime(2050),
          calendarFormat: calendarFormat,
          selectedDayPredicate: selectedDayPredicate,
          onDaySelected: onDaySelected,
          onFormatChanged: onFormatChanged,
          onPageChanged: onPageChanged,
          headerVisible: true,
          calendarStyle: CalendarStyle(
            cellMargin: EdgeInsets.zero,
            outsideDaysVisible: false,
            cellPadding: EdgeInsets.zero,
            // tablePadding:
            //     const EdgeInsets.only(bottom: 16, left: 15, right: 15),
            todayDecoration: BoxDecoration(
              color: AppColors.primary.withValues(alpha: 0.2),
              shape: BoxShape.circle,
            ),
            selectedDecoration: const BoxDecoration(
              color: AppColors.primary,
              shape: BoxShape.circle,
            ),
            isTodayHighlighted: true,
            selectedTextStyle: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: AppColors.white),
            todayTextStyle: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: AppColors.textColor),
            defaultTextStyle: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: AppColors.black),
            weekendTextStyle: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: AppColors.black),
          ),
          rowHeight: 60.h,
          headerStyle: HeaderStyle(
            formatButtonVisible: false,
            titleCentered: true,
            headerPadding: EdgeInsets.zero,
            headerMargin: EdgeInsets.zero,
            leftChevronMargin: EdgeInsets.zero,
            rightChevronMargin: EdgeInsets.zero,
            titleTextStyle: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: AppColors.primary),
            leftChevronIcon: const Icon(Icons.chevron_left,
                size: 30, color: AppColors.primary),
            rightChevronIcon: const Icon(Icons.chevron_right,
                size: 30, color: AppColors.primary),
          ),
          daysOfWeekStyle: DaysOfWeekStyle(
            weekdayStyle: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: AppColors.primaryDimmed),
            weekendStyle: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: AppColors.primaryDimmed),
          ),
        ),
      ],
    );
  }
}
