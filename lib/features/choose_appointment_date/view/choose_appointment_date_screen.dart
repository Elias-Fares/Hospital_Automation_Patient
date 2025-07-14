import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:patient_app/configuration/res.dart';
import 'package:patient_app/core/function/date_format.dart';
import 'package:patient_app/core/managers/appointment_data_manager.dart';
import 'package:patient_app/core/style/app_colors.dart';
import 'package:patient_app/core/style/card_container_decoration.dart';
import 'package:patient_app/core/widgets/appbars/sub_app_bar.dart';
import 'package:patient_app/core/widgets/cards/outlined_card.dart';
import 'package:patient_app/core/widgets/cards/persone_tile.dart';
import 'package:patient_app/core/widgets/custom_error_widget.dart';
import 'package:patient_app/core/widgets/custom_loading_widget.dart';
import 'package:patient_app/features/choose_appointment_date/view_model/choose_appointment_date_view_model.dart';
import 'package:table_calendar/table_calendar.dart';
part 'widget/book_appointment_calendar.dart';
part 'widget/available_time.dart';

class ChooseAppointmentDateScreen extends ConsumerStatefulWidget {
  const ChooseAppointmentDateScreen({super.key});
  static const routeName = "/choose_appointment_date_screen";

  @override
  ConsumerState<ChooseAppointmentDateScreen> createState() =>
      _ChooseAppointmentDateScreenState();
}

class _ChooseAppointmentDateScreenState
    extends ConsumerState<ChooseAppointmentDateScreen> {
  DateTime _focusedDay = DateTime.now().toUtc();
  DateTime? _selectedDay;
  final CalendarFormat _calendarFormat = CalendarFormat.month;

  @override
  void initState() {
    super.initState();

    Future.microtask(
      () {
        ref
            .read(chooseAppointmentDateViewModelProvider.notifier)
            .getFreeAppointmentTime();
      },
    );
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    final chooseAppointmentDateState =
        ref.watch(chooseAppointmentDateViewModelProvider);
    return Scaffold(
        appBar: const SubAppBar(
          titleWidget: PersoneTile(
              imageUrl: Res.personePlaceHolderImage,
              tile: "Doctor Name",
              subtitle: "Cardiologist"),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            debugPrint(
                ref.read(appointmentDataManagerProvider).current.toString());
          },
        ),
        body: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Container(
              decoration: containerCardDecoration(),
              padding: const EdgeInsets.all(15),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Choose Day",
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge
                          ?.copyWith(fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    BookAppointmentCalendar(
                      focusedDay: _focusedDay,
                      calendarFormat: _calendarFormat,
                      selectedDays: const [],
                      onPageChanged: (focusedDay) {
                        _focusedDay = focusedDay;
                      },
                      onFormatChanged: (format) {
                        // setState(() {
                        //   _calendarFormat = format;
                        // });
                      },
                      onDaySelected: (selectedDay, focusedDay) {
                        setState(() {
                          print(selectedDay.toString());
                          _selectedDay = selectedDay;
                        });

                        final controller = ref.read(
                            chooseAppointmentDateViewModelProvider.notifier);

                        controller.setDate(
                            date: _selectedDay?.getYearMonthDay());

                        controller.getFreeAppointmentTime();
                      },
                      selectedDayPredicate: (day) {
                        return isSameDay(day, _selectedDay);
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Divider(
                      color: AppColors.primaryDimmed,
                      thickness: .6,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    chooseAppointmentDateState.freeAppointmentDate?.when(
                          data: (data) => AvailableTime(
                              selectedDate:
                                  _selectedDay?.getYearMonthDay() ?? "",
                              availableTimeValue: data?.toString() ?? ""),
                          error: (error, stackTrace) =>
                              CustomErrorWidget(message: error.toString()),
                          loading: () => const CustomLoadingWidget(),
                        ) ??
                        const SizedBox.shrink(),
                  ]),
            )));
  }
}
