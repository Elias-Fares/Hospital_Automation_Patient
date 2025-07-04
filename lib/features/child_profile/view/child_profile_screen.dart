import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:patient_app/configuration/router/router_utils.dart';
import 'package:patient_app/core/enums/params_values.dart';
import 'package:patient_app/core/function/date_format.dart';
import 'package:patient_app/core/function/join_strings.dart';
import 'package:patient_app/core/params/child_appointment_params.dart';
import 'package:patient_app/core/params/medical_records_screen_params.dart';
import 'package:patient_app/core/params/prescriptions_screen_params.dart'
    show PrescriptionsScreenParams;
import 'package:patient_app/core/style/card_container_decoration.dart';
import 'package:patient_app/core/widgets/cards/icon_key_value_widget.dart';
import 'package:patient_app/core/widgets/cards/icon_title_navigation_button.dart';
import 'package:patient_app/core/widgets/cards/key_value_card.dart';
import 'package:patient_app/core/widgets/appbars/sub_app_bar.dart';
import 'package:patient_app/configuration/res.dart';
import 'package:patient_app/core/widgets/custom_error_widget.dart';
import 'package:patient_app/core/widgets/custom_loading_widget.dart';
import 'package:patient_app/features/child_appointments/view/child_appointments_screen.dart';
import 'package:patient_app/features/child_profile/view_model/child_profile_view_model.dart';
import 'package:patient_app/features/medical_record/view/medical_record_screen.dart';
import 'package:patient_app/features/patient_prescription/view/patient_prescription_screen.dart';
import 'package:patient_app/features/vaccination_table/view/vaccination_table_screen.dart';
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
                        lastVaccination: 'Flu Shot',
                        nextVaccination: 'MMR Booster',
                        guardiansCount: data.numOfGuardian?.toString() ?? "0",
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      ChildProfileNavigationSection(onVaccinationTap: () {
                        context.push(RouterUtils.getNestedRoute(context,
                            routeName: VaccinationTableScreen.routeName));
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
