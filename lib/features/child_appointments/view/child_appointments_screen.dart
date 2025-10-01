import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../configuration/router/router_utils.dart';
import '../../../core/function/date_format.dart';
import '../../../core/function/join_strings.dart';
import '../../../core/params/child_appointment_params.dart';
import '../../../core/widgets/appbars/app_bar_title_widget.dart';
import '../../../core/widgets/appbars/sub_app_bar.dart';
import '../../../core/widgets/custom_error_widget.dart';
import '../../../core/widgets/custom_loading_widget.dart';
import '../../appointment_details/view/appointment_details_screen.dart';
import '../view_model/child_appointments_view_model.dart';

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
                doctorProfileImageUrl: appointment?.doctor?.imgurl ?? "",
                doctorName: joinStrings([
                  appointment?.doctor?.firstName,
                  appointment?.doctor?.middleName,
                  appointment?.doctor?.lastName,
                ]),
                onAppointmentCardTap: () {
                  context.push(
                      RouterUtils.getNestedRoute(
                        context,
                        routeName: AppointmentDetailsScreen.routeName,
                      ),
                      extra: appointment);
                },
              );
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
