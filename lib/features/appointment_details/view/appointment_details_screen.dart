import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../configuration/res.dart';
import '../../../configuration/router/router_utils.dart';
import '../../../core/constant/constant.dart';
import '../../../core/function/date_format.dart';
import '../../../core/function/join_strings.dart';
import '../../../core/style/app_colors.dart';
import '../../../core/style/card_container_decoration.dart';
import '../../../core/widgets/appbars/app_bar_title_widget.dart';
import '../../../core/widgets/appbars/sub_app_bar.dart';
import '../../../core/widgets/buttons/custom_inkwell.dart';
import '../../../core/widgets/cards/icon_key_value_widget.dart';
import '../../../core/widgets/cards/outlined_card.dart';
import '../../../core/widgets/cards/persone_tile.dart';
import '../../../data/appointments/models/appointment_model.dart';
import '../../doctor_profile/view/doctor_profile_screen.dart';

class AppointmentDetailsScreen extends ConsumerStatefulWidget {
  const AppointmentDetailsScreen({super.key, this.appointmentModel});
  static const routeName = "/appointment_details_screen";
  final AppointmentModel? appointmentModel;

  @override
  ConsumerState<AppointmentDetailsScreen> createState() =>
      _AppointmentDetailsScreenState();
}

class _AppointmentDetailsScreenState
    extends ConsumerState<AppointmentDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SubAppBar(
        titleWidget: AppBarTitleWidget(
          title: widget.appointmentModel?.child != null
              ? joinStrings([
                  widget.appointmentModel?.child?.firstName,
                  widget.appointmentModel?.child?.lastName,
                ])
              : joinStrings([
                  widget.appointmentModel?.user?.firstName,
                  widget.appointmentModel?.user?.lastName
                ]),
        ),
      ),
      body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: AppointmentDetailsPage(
            doctorName: joinStrings([
              widget.appointmentModel?.doctor?.firstName,
              widget.appointmentModel?.doctor?.middleName,
              widget.appointmentModel?.doctor?.lastName,
            ]),
            speciality: widget.appointmentModel?.doctor?.specialty ?? "",
            doctorProfileImage: Constant.baseUrl +
                (widget.appointmentModel?.doctor?.imgurl ?? ""),
            dateAndTime: joinStrings([
              widget.appointmentModel?.date?.getYearMonthDay(),
              widget.appointmentModel?.time?.substring(0, 5),
            ], joinChart: " - "),
            departmentName: widget.appointmentModel?.clinic?.name ?? "",
            recommendedVisitDate:
                widget.appointmentModel?.recommendedVisitDate?.toString() ??
                    "No next recommended visit",
            status: widget.appointmentModel?.state ?? "",
            notes: widget.appointmentModel?.recommndedVisitNote?.toString() ??
                "No next recommended visit notes",
            medicalDiagnosis: widget.appointmentModel?.medicalDiagnosis ?? "",
            viewDoctorProfile: () {
              context.push(
                  RouterUtils.getNestedRoute(context,
                      routeName: DoctorProfileScreen.routeName),
                  extra: widget.appointmentModel?.doctorId?.toString());
            },
          )),
    );
  }
}

class AppointmentDetailsPage extends StatelessWidget {
  const AppointmentDetailsPage({
    super.key,
    required this.doctorName,
    required this.speciality,
    required this.doctorProfileImage,
    required this.departmentName,
    required this.dateAndTime,
    required this.status,
    required this.recommendedVisitDate,
    required this.notes,
    required this.medicalDiagnosis,
    required this.viewDoctorProfile,
  });

  final String doctorName;
  final String speciality;
  final String doctorProfileImage;
  final String departmentName;
  final String dateAndTime;
  final String status;
  final String recommendedVisitDate;
  final String notes;
  final String medicalDiagnosis;
  final void Function() viewDoctorProfile;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: containerCardDecoration(),
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              PersoneTile(
                  imageUrl: doctorProfileImage,
                  title: doctorName,
                  subtitle: speciality),
              CustomInkwell(
                onTap: viewDoctorProfile,
                color: AppColors.white,
                borderRadius: BorderRadius.circular(30),
                child: const OutlinedCard(text: "View Profile"),
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          IconKeyValueWidget(
            keyTitle: "Department",
            value: departmentName,
            iconData: Icons.local_hospital_outlined,
          ),
          const SizedBox(
            height: 20,
          ),
          IconKeyValueWidget(
            keyTitle: "Date & Time",
            value: dateAndTime,
            iconData: Icons.event,
          ),
          const SizedBox(
            height: 20,
          ),
          IconKeyValueWidget(
            keyTitle: "Status",
            value: status,
            iconData: Icons.verified_outlined,
          ),
          const SizedBox(
            height: 20,
          ),
          IconKeyValueWidget(
            keyTitle: "Next recommended visit",
            value: recommendedVisitDate,
            iconData: Icons.pending_actions,
          ),
          const SizedBox(
            height: 20,
          ),
          IconKeyValueWidget(
            keyTitle: "Note",
            value: notes,
            iconData: Icons.description_outlined,
          ),
          const SizedBox(
            height: 20,
          ),
          IconKeyValueWidget(
            keyTitle: "Medical diagnosis",
            value: departmentName,
            iconPath: Res.diagnosis,
          ),
        ],
      ),
    );
  }
}
