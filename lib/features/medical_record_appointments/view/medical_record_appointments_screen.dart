import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../configuration/router/router_utils.dart';
import '../../../core/constant/constant.dart';
import '../../../core/function/date_format.dart';
import '../../../core/function/join_strings.dart';
import '../../../core/widgets/appbars/sub_app_bar.dart';
import '../../../core/widgets/appointment_card.dart';
import '../../../data/appointments/models/appointment_model.dart';
import '../../../data/medical_records/models/medical_record_model.dart';
import '../../appointment_details/view/appointment_details_screen.dart';

class MedicalRecordAppointmentsScreen extends ConsumerStatefulWidget {
  const MedicalRecordAppointmentsScreen({
    super.key,
    required this.doctorsAppointments,
  });
  static const routeName = "/medical_record_appointments_screen";
  final MedicalRecordModel doctorsAppointments;

  @override
  ConsumerState<MedicalRecordAppointmentsScreen> createState() =>
      _MedicalRecordAppointmentsScreenState();
}

class _MedicalRecordAppointmentsScreenState
    extends ConsumerState<MedicalRecordAppointmentsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: SubAppBar(),
        body: ListView.builder(
          itemCount:
              widget.doctorsAppointments.doctorsAppointments?.length ?? 0,
          itemBuilder: (context, index) {
            final data = widget.doctorsAppointments.doctorsAppointments
                    ?.elementAt(index) ??
                AppointmentModel();
            return AppointmentCard(
              name: data.child != null
                  ? joinStrings([
                      data.child?.firstName,
                      data.child?.lastName,
                    ])
                  : joinStrings([data.user?.firstName, data.user?.lastName]),
              dateTime: data.date?.getYearMonthDay() ?? "",
              doctorName: joinStrings([
                widget.doctorsAppointments.doctorInfo?.firstName,
                widget.doctorsAppointments.doctorInfo?.middleName,
                widget.doctorsAppointments.doctorInfo?.lastName
              ]),
              doctorProfileImageUrl:
                  "${Constant.baseUrl}/${data.doctor?.imgurl}",
              type: data.appointmentType?.typeName ?? "",
            );
          },
        ));
  }
}
