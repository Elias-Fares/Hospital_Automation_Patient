import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:patient_app/configuration/res.dart';
import 'package:patient_app/core/function/date_format.dart';
import 'package:patient_app/core/function/join_strings.dart';
import 'package:patient_app/core/params/child_appointment_params.dart';
import 'package:patient_app/core/widgets/appbars/app_bar_title_widget.dart';
import 'package:patient_app/core/widgets/appbars/main_app_bar.dart';
import 'package:patient_app/core/widgets/appbars/sub_app_bar.dart';
import 'package:patient_app/core/widgets/custom_error_widget.dart';
import 'package:patient_app/core/widgets/custom_loading_widget.dart';
import 'package:patient_app/features/appointments/view/appointments.dart';
import 'package:patient_app/features/child_appointments/view_model/child_appointments_view_model.dart';

import '../../../core/widgets/appointment_card.dart';

class ChildAppointmentsScreen extends ConsumerStatefulWidget {
  const ChildAppointmentsScreen({
    super.key,
    required this.childAppointmentParams,
  });
  static const routeName = "/child_appointments_screen";

  final ChildAppointmentParams childAppointmentParams;

  @override
  ConsumerState<ChildAppointmentsScreen> createState() =>
      _ChildAppointmentsScreenState();
}

class _ChildAppointmentsScreenState
    extends ConsumerState<ChildAppointmentsScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
      () {
        ref
            .read(childAppointmentsViewModelProvider.notifier)
            .getChildAppointments(
                childId: widget.childAppointmentParams.childId);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final childAppointmentsState =
        ref.watch(childAppointmentsViewModelProvider);
    return Scaffold(
        appBar: SubAppBar(
          titleWidget: AppBarTitleWidget(
              title: widget.childAppointmentParams.childName ?? "",
              imagePath: widget.childAppointmentParams.imagePath),
        ),
        body: childAppointmentsState?.when(
          data: (data) => ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              final appointment = data.elementAtOrNull(index);
              return AppointmentCard(
                  name: widget.childAppointmentParams.childName ?? "",
                  type: appointment?.appointmentType?.typeName ?? "",
                  dateTime: appointment?.date?.getYearMonthDay() ?? "",
                  doctorName: joinStrings([
                    appointment?.doctor?.firstName,
                    appointment?.doctor?.middleName,
                    appointment?.doctor?.lastName,
                  ]));
            },
          ),
          error: (error, stackTrace) => CustomErrorWidget(
            message: error.toString(),
            onTryAgainTap: () {
              ref
                  .read(childAppointmentsViewModelProvider.notifier)
                  .getChildAppointments(
                      childId: widget.childAppointmentParams.childId);
            },
          ),
          loading: () => const CustomLoadingWidget(),
        ));
  }
}
