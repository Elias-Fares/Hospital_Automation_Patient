import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../configuration/router/router_utils.dart';
import '../../../core/enums/params_values.dart';
import '../../../core/function/date_format.dart';
import '../../../core/function/join_strings.dart';
import '../../../core/params/child_appointment_params.dart';
import '../../../core/params/medical_records_screen_params.dart';
import '../../../core/params/prescriptions_screen_params.dart'
    show PrescriptionsScreenParams;
import '../../../core/params/vaccine_table_screen_param.dart';
import '../../../core/style/app_colors.dart';
import '../../../core/style/card_container_decoration.dart';
import '../../../core/widgets/cards/icon_key_value_widget.dart';
import '../../../core/widgets/cards/icon_title_navigation_button.dart';
import '../../../core/widgets/cards/key_value_card.dart';
import '../../../core/widgets/appbars/sub_app_bar.dart';
import '../../../configuration/res.dart';
import '../../../core/widgets/cards/svg_container.dart';
import '../../../core/widgets/custom_error_widget.dart';
import '../../../core/widgets/custom_loading_widget.dart';
import '../../child_appointments/view/child_appointments_screen.dart';
import '../view_model/child_profile_view_model.dart';
import '../../medical_record/view/medical_record_screen.dart';
import '../../patient_prescription/view/patient_prescription_screen.dart';
import '../../vaccination_table/view/vaccination_table_screen.dart';
part 'widget/child_profile_title.dart';
part 'widget/child_details_widget.dart';
part 'widget/child_profile_navigation_section.dart';

class ChildProfileScreen extends ConsumerStatefulWidget {
  static const routeName = "/children_profile_screen";
  const ChildProfileScreen({
    super.key,
    this.childId,
  });
  final String? childId;

  @override
  ConsumerState<ChildProfileScreen> createState() => _ChildProfileScreenState();
}

class _ChildProfileScreenState extends ConsumerState<ChildProfileScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
      () {
        if (widget.childId == null) {
          return;
        }
        ref
            .read(childProfileViewModelProvider.notifier)
            .getChildProfile(childId: widget.childId!);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final childProfileState = ref.watch(childProfileViewModelProvider);

    return Scaffold(
        appBar: SubAppBar(
            titleWidget: ChildProfileTitle(
          childName: joinStrings([
            childProfileState?.asData?.value.childProfileData?.firstName,
            childProfileState?.asData?.value.childProfileData?.lastName,
          ]),
        )),
        body: childProfileState?.when(
              error: (error, stackTrace) => CustomErrorWidget(
                message: error.toString(),
                onTryAgainTap: () {
                  ref
                      .read(childProfileViewModelProvider.notifier)
                      .getChildProfile(childId: widget.childId!);
                },
              ),
              loading: () => const CustomLoadingWidget(),
              data: (data) {
                return SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    children: [
                      //TODO tell mariam to add last vaccine and
                      ChildDetailsWidget(
                        fatherName: joinStrings([
                          data.childProfileData?.fatherFirstName,
                          data.childProfileData?.fatherLastName,
                        ]),
                        motherName: joinStrings([
                          data.childProfileData?.motherFirstName,
                          data.childProfileData?.motherLastName,
                        ]),
                        gender: data.childProfileData?.gender ?? "",
                        dateOfBirth: data.childProfileData?.dateOfBirth
                                ?.getYearMonthDay() ??
                            "",
                        birthCertificate: "Birth Certificate.jpg",
                        lastAppointment:
                            data.lastAppointment?.getYearMonthDay() ?? "",
                        lastVaccination:
                            data.vaccinesInfo?.lastVaccineName ?? "",
                        nextVaccination:
                            data.vaccinesInfo?.nextVaccineName ?? "",
                        guardiansCount: data.numOfGuardian?.toString() ?? "0",
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      ChildProfileNavigationSection(onVaccinationTap: () {
                        context.push(
                            RouterUtils.getNestedRoute(context,
                                routeName: VaccinationTableScreen.routeName),
                            extra: VaccineTableScreenParam(
                                childId: data.childProfileData?.childId,
                                childName: joinStrings([
                                  data.childProfileData?.firstName,
                                  data.childProfileData?.lastName,
                                ]),
                                imageUrl: ""));
                      }, onAppointmentTap: () {
                        context.push(
                            RouterUtils.getNestedRoute(context,
                                routeName: ChildAppointmentsScreen.routeName),
                            extra: ChildAppointmentParams(
                              childId:
                                  data.childProfileData?.childId?.toString(),
                              childName: joinStrings([
                                data.childProfileData?.firstName,
                                data.childProfileData?.lastName,
                              ]),
                            ));
                      }, onPrescriptionTap: () {
                        context.push(PatientPrescriptionScreen.routeName,
                            extra: PrescriptionsScreenParams(
                                comingFrom: ParamsValues.child,
                                childId:
                                    data.childProfileData?.childId?.toString(),
                                childName: joinStrings([
                                  data.childProfileData?.firstName,
                                  data.childProfileData?.lastName,
                                ])));
                      }, onMedicalRecordTap: () {
                        context.push(MedicalRecordScreen.routeName,
                            extra: MedicalRecordsScreenParams(
                              comingFrom: ParamsValues.child,
                              childId:
                                  data.childProfileData?.childId?.toString(),
                              childName: joinStrings([
                                data.childProfileData?.firstName,
                                data.childProfileData?.lastName,
                              ]),
                            ));
                      }),
                      const SizedBox(
                        height: 24,
                      ),
                    ],
                  ),
                );
              },
            ) ??
            const SizedBox.shrink());
  }
}
