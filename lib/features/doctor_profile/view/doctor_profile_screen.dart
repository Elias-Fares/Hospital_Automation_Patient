import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:patient_app/core/function/join_strings.dart';
import 'package:patient_app/core/models/work_day.dart';
import 'package:patient_app/core/style/card_container_decoration.dart';
import 'package:patient_app/core/widgets/cards/icon_key_value_widget.dart';
import 'package:patient_app/core/widgets/cards/icon_title_navigation_button.dart';
import 'package:patient_app/core/widgets/cards/key_value_card.dart';
import 'package:patient_app/core/widgets/cards/outlined_card.dart';
import 'package:patient_app/core/widgets/cards/profile_email_widget.dart';
import 'package:patient_app/core/widgets/cards/profile_phone_widget.dart';
import 'package:patient_app/core/widgets/appbars/sub_app_bar.dart';
import 'package:patient_app/configuration/res.dart';
import 'package:patient_app/configuration/router/router_utils.dart';
import 'package:patient_app/core/style/app_colors.dart';
import 'package:patient_app/core/widgets/buttons/loading_button.dart';
import 'package:patient_app/core/widgets/custom_error_widget.dart';
import 'package:patient_app/core/widgets/custom_loading_widget.dart';
import 'package:patient_app/core/widgets/general_network_image.dart';
import 'package:patient_app/data/doctors/models/doctor_profile_model.dart';
import 'package:patient_app/features/book_appointment/view/book_appointment_screen.dart';
import 'package:patient_app/features/department_details/view/department_details_screen.dart';
import 'package:patient_app/features/doctor_profile/view_model/doctor_profile_view_model.dart';

part 'widget/doctor_profile_details_widget.dart';
part 'widget/doctor_profile_navigation_section.dart';
part 'widget/doctor_profile_book_appointment.dart';

class DoctorProfileScreen extends ConsumerStatefulWidget {
  const DoctorProfileScreen({super.key, required this.doctorId});
  static const routeName = "/doctor_profile_screen";
  final String? doctorId;

  @override
  ConsumerState<DoctorProfileScreen> createState() =>
      _DoctorProfileScreenState();
}

class _DoctorProfileScreenState extends ConsumerState<DoctorProfileScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
      () {
        if (widget.doctorId == null) {
          return;
        }
        ref
            .read(doctorProfileViewModelProvider.notifier)
            .getDoctorProfile(doctorId: widget.doctorId!);
      },
    );
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    final doctorProfileState = ref.watch(doctorProfileViewModelProvider);

    return Scaffold(
      appBar: const SubAppBar(),
      floatingActionButton:
          (doctorProfileState.doctorProfileResponse?.isLoading ?? true)
              ? const SizedBox.shrink()
              : DoctorProfileBookAppointmentButton(
                  onTap: () {
                    ref
                        .read(doctorProfileViewModelProvider.notifier)
                        .setDoctorId();
                    context.push(
                      RouterUtils.getNestedRoute(context,
                          routeName: BookAppointmentScreen.routeName),
                      // extra: doctorProfileState.doctorProfileResponse?.asData
                      //     ?.value.appointmentTypes
                    );
                  },
                ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: doctorProfileState.doctorProfileResponse?.when(
            error: (error, stackTrace) =>
                CustomErrorWidget(message: error.toString()),
            loading: () => const CustomLoadingWidget(),
            data: (data) => SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  DoctorProfileDetailsWidget(
                      onDepartmentTap: () {
                        context.push(
                            RouterUtils.getNestedRoute(context,
                                routeName: DepartmentDetailsScreen.routeName),
                            extra: data.clinicId);
                      },
                      name: joinStrings([
                        data.firstName,
                        data.middleName,
                        data.lastName,
                      ]),
                      gender: data.gender ?? "",
                      imagePath: data.imgurl ?? "",
                      address: joinStrings([
                        data.addressGovernorate,
                        data.addressCity,
                        data.addressRegion,
                        data.addressRegion
                      ], joinChart: " - "),
                      doctorSpeciality: data.specialty ?? "",
                      doctorDepartment: data.clinic?.name ?? "",
                      phoneNumber: data.phoneNumber ?? "",
                      emailAddress: data.email ?? "",
                      availabilitySchedule: data.workDays ?? [],
                      appointmentTypes: data.appointmentTypes ?? []),

                  const SizedBox(
                    height: 80,
                  ),

                  // DoctorProfileNavigationSection(
                  //   onPrescriptionTap: () {},
                  //   onMedicalRecordTap: () {},
                  //   onAppointmentsTap: () {},
                  // ),
                ],
              ),
            ),
          ) ??
          const SizedBox.shrink(),
    );
  }
}
