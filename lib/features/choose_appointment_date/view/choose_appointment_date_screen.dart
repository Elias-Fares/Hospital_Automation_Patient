import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../core/constant/constant.dart';
import '../../../core/function/date_format.dart';
import '../../../core/function/join_strings.dart';
import '../../../core/style/app_colors.dart';
import '../../../core/style/card_container_decoration.dart';
import '../../../core/widgets/appbars/sub_app_bar.dart';
import '../../../core/widgets/buttons/loading_button.dart';
import '../../../core/widgets/cards/outlined_card.dart';
import '../../../core/widgets/cards/persone_tile.dart';
import '../../../core/widgets/custom_error_widget.dart';
import '../../../core/widgets/custom_loading_widget.dart';
import '../../../core/widgets/show_snack_bar_error_message.dart';
import '../../../core/widgets/show_snack_bar_success_message.dart';
import '../../appointment_details/view_model/appointment_details_view_model.dart';
import '../../appointments/view/appointments.dart';
import '../../appointments/view_model/appointments_view_model.dart';
import '../view_model/choose_appointment_date_view_model.dart';
import '../../doctor_profile/view_model/doctor_profile_view_model.dart';
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
        _selectedDay = _focusedDay;
        ref
            .read(chooseAppointmentDateViewModelProvider.notifier)
            .setDate(date: _selectedDay?.getYearMonthDay());
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

    final doctorProfileModel = ref
        .watch(doctorProfileViewModelProvider)
        .doctorProfileResponse
        ?.asData
        ?.value;

    ref.listen(
      chooseAppointmentDateViewModelProvider.select(
        (value) => value.bookAppointmentResponse,
      ),
      (previous, next) {
        next?.when(
          data: (data) {
            showSnackBarSuccessMessage(context,
                message: "The appointment has been booked successfully.");

            Future.delayed(
              Duration(seconds: 1),
              () {
                if (context.mounted) context.go(AppointmentsScreen.routeName);
                ref
                    .read(appointmentsViewModelProvider.notifier)
                    .getBothMissedAppointments();
                ref
                    .read(appointmentsViewModelProvider.notifier)
                    .getBothPassedAppointments();
                ref
                    .read(appointmentsViewModelProvider.notifier)
                    .getBothUpcomingAppointments();
              },
            );
          },
          error: (error, stackTrace) {
            showSnackBarErrorMessage(context, message: error.toString());
          },
          loading: () {},
        );
      },
    );
    return Scaffold(
        appBar: SubAppBar(
          titleWidget: PersoneTile(
              imageUrl:
                  "${Constant.baseUrl}/${doctorProfileModel?.imgurl ?? ""}",
              title: joinStrings([
                doctorProfileModel?.firstName,
                doctorProfileModel?.lastName,
              ]),
              subtitle: doctorProfileModel?.specialty ?? ""),
        ),
        // floatingActionButton: FloatingActionButton(
        //   onPressed: () {
        //     debugPrint(
        //         ref.read(appointmentDataManagerProvider).current.toString());
        //   },
        // ),
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
                        // setState(() {

                        // });

                        print(selectedDay.toString());
                        _selectedDay = selectedDay;

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
                    chooseAppointmentDateState.freeAppointmentDate?.when(
                          data: (data) => Column(
                            children: [
                              const Divider(
                                color: AppColors.primaryDimmed,
                                thickness: .6,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              AvailableTime(
                                  selectedDate:
                                      _selectedDay?.getYearMonthDay() ?? "",
                                  availableTimeValue: data?.toString() ?? ""),
                              if (chooseAppointmentDateState
                                  .showBookAppointmentButton) ...[
                                const SizedBox(
                                  height: 14,
                                ),
                                LoadingButton(
                                  title: "Confirm",
                                  isLoading: chooseAppointmentDateState
                                          .bookAppointmentResponse?.isLoading ??
                                      false,
                                  onTap: () {
                                    ref
                                        .read(
                                            chooseAppointmentDateViewModelProvider
                                                .notifier)
                                        .bookAppointment();
                                  },
                                )
                              ]
                            ],
                          ),
                          error: (error, stackTrace) => CustomErrorWidget(
                            message: error.toString(),
                            onTryAgainTap: () {
                              final controller = ref.read(
                                  chooseAppointmentDateViewModelProvider
                                      .notifier);
                              controller.getFreeAppointmentTime();
                            },
                          ),
                          loading: () => const CustomLoadingWidget(),
                        ) ??
                        const SizedBox.shrink(),
                  ]),
            )));
  }
}
