import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:patient_app/core/constant/constant.dart';
import 'package:patient_app/core/enums/params_values.dart';
import 'package:patient_app/core/function/date_format.dart';
import 'package:patient_app/core/function/join_strings.dart';
import 'package:patient_app/core/params/prescriptions_screen_params.dart';
import 'package:patient_app/core/style/card_container_decoration.dart';
import 'package:patient_app/core/widgets/cards/icon_key_value_widget.dart';
import 'package:patient_app/core/widgets/cards/icon_title_navigation_button.dart';
import 'package:patient_app/core/widgets/cards/key_value_card.dart';
import 'package:patient_app/core/widgets/appbars/sub_app_bar.dart';
import 'package:patient_app/configuration/res.dart';
import 'package:patient_app/configuration/router/router_utils.dart';
import 'package:patient_app/core/style/app_colors.dart';
import 'package:patient_app/core/widgets/custom_error_widget.dart';
import 'package:patient_app/core/widgets/custom_loading_widget.dart';
import 'package:patient_app/core/widgets/general_image_asset.dart';
import 'package:patient_app/core/widgets/general_network_image.dart';

import 'package:patient_app/features/edit_profile/view/edit_profile_screen.dart';
import 'package:patient_app/features/patient_prescription/view/patient_prescription_screen.dart';
import 'package:patient_app/features/profile/view_model/profile_view_model.dart';
part 'widget/profile_details_widget.dart';
part 'widget/profile_navigation_section.dart';
part 'widget/profile_edit_button.dart';

class ProfileScreen extends ConsumerStatefulWidget {
  static const routeName = "/profile";
  const ProfileScreen({super.key});

  @override
  ConsumerState<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
      () {
        ref.read(profileViewModelProvider.notifier).getUserProfile();
      },
    );
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    final profileState = ref.watch(profileViewModelProvider);
    return Scaffold(
        appBar: const SubAppBar(),
        floatingActionButton: ProfileEditButton(
          onPressed: () {
            if (!(profileState.userProfileResponse?.hasValue ?? false)) {
              return;
            }
            context.push(
                RouterUtils.nestedRoute(
                    ProfileScreen.routeName, EditProfileScreen.routeName),
                extra: profileState
                    .userProfileResponse?.asData?.value.userProfileData);
          },
        ),
        body: profileState.userProfileResponse?.when(
          error: (error, stackTrace) => CustomErrorWidget(
            message: error.toString(),
            onTryAgainTap: () {
              ref.read(profileViewModelProvider.notifier).getUserProfile();
            },
          ),
          loading: () => const CustomLoadingWidget(),
          data: (data) => RefreshIndicator(
            onRefresh: () async {
              ref.read(profileViewModelProvider.notifier).getUserProfile();
            },
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  ProfileDetailsWidget(
                      name: joinStrings([
                        data.userProfileData?.firstName,
                        data.userProfileData?.lastName,
                      ]),
                      gender: data.userProfileData?.gender ?? "",
                      imagePath: data.userProfileData?.imgurl ?? "",
                      address: joinStrings([
                        data.userProfileData?.addressStreet,
                        data.userProfileData?.addressRegion,
                        data.userProfileData?.addressCity,
                        data.userProfileData?.addressGovernorate,
                      ], joinChart: " - "),
                      lastAppointment:
                          data.lastAppointment?.getYearMonthDay() ?? "",
                      nextAppointment: data.nextVisit?.getYearMonthDay() ?? ""),
                  const SizedBox(
                    height: 24,
                  ),
                  ProfileNavigationSection(
                    onPrescriptionTap: () {
                      context.push(PatientPrescriptionScreen.routeName,
                          extra: PrescriptionsScreenParams(
                              comingFrom: ParamsValues.patient));
                    },
                    onMedicalRecordTap: () {},
                    onSuspendUserAccountTap: () {},
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
