import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/constant/constant.dart';
import '../../../core/function/join_strings.dart';
import '../../../core/style/card_container_decoration.dart';
import '../../../core/widgets/cards/persone_tile.dart';
import '../../../core/widgets/appbars/sub_app_bar.dart';
import '../../../configuration/res.dart';
import '../../../core/style/app_colors.dart';
import '../../../core/widgets/buttons/custom_inkwell.dart';
import '../../../core/widgets/custom_error_widget.dart';
import '../../../core/widgets/custom_loading_widget.dart';
import '../../doctor_profile/view/doctor_profile_screen.dart';
import '../view_model/patient_doctors_view_model.dart';

import '../../../configuration/router/router_utils.dart';

part 'widget/patient_doctor_card.dart';

class PatientDoctorsScreen extends ConsumerStatefulWidget {
  const PatientDoctorsScreen({super.key});
  static const routeName = "/patient_doctors_screen";

  @override
  ConsumerState<PatientDoctorsScreen> createState() =>
      _PatientDoctorsScreenState();
}

class _PatientDoctorsScreenState extends ConsumerState<PatientDoctorsScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
      () {
        ref.read(patientDoctorsViewModelProvider.notifier).getDoctors();
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final doctorsState = ref.watch(patientDoctorsViewModelProvider);
    return Scaffold(
      appBar: const SubAppBar(),
      body: doctorsState.doctorsResponse?.when(
            error: (error, stackTrace) => CustomErrorWidget(
              message: error.toString(),
              onTryAgainTap: () {
                ref.read(patientDoctorsViewModelProvider.notifier).getDoctors();
              },
            ),
            loading: () => const CustomLoadingWidget(),
            data: (data) => SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  ListView.builder(
                    itemCount: data.length,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      final doctor = data.elementAtOrNull(index);
                      return PatientDoctorCard(
                        doctorName: joinStrings([
                          doctor?.firstName,
                          doctor?.middleName,
                          doctor?.lastName,
                        ]),
                        doctorSpecialty: doctor?.specialty ?? "",
                        doctorImageUrl: "${Constant.baseUrl}/${doctor?.imgurl}",
                        onTap: () {
                          context.push(
                              RouterUtils.nestedRoute(
                                  PatientDoctorsScreen.routeName,
                                  DoctorProfileScreen.routeName),
                              extra: doctor?.userId?.toString());
                        },
                      );
                    },
                  )
                ],
              ),
            ),
          ) ??
          const SizedBox.shrink(),
    );
  }
}
