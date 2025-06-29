import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:patient_app/core/function/join_strings.dart';
import 'package:patient_app/core/style/card_container_decoration.dart';
import 'package:patient_app/core/widgets/cards/persone_tile.dart';
import 'package:patient_app/core/widgets/appbars/sub_app_bar.dart';
import 'package:patient_app/configuration/res.dart';
import 'package:patient_app/core/style/app_colors.dart';
import 'package:patient_app/core/widgets/buttons/custom_inkwell.dart';
import 'package:patient_app/core/widgets/custom_error_widget.dart';
import 'package:patient_app/core/widgets/custom_loading_widget.dart';
import 'package:patient_app/features/doctor_profile/view/doctor_profile_screen.dart';
import 'package:patient_app/features/main_screen/main_screen.dart';
import 'package:patient_app/features/patient_doctors/view/patient_doctors_screen.dart';
import 'package:patient_app/features/patient_doctors/view_model/patient_doctors_view_model.dart';

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
  Widget build(BuildContext context) {
    final doctorsState = ref.watch(patientDoctorsViewModelProvider);
    return Scaffold(
      appBar: const SubAppBar(
        withSearch: true,
      ),
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
                        doctorImageUrl: Res.personePlaceHolderImage,
                        onTap: () {
                          context.push(RouterUtils.nestedRoute(
                              PatientDoctorsScreen.routeName,
                              DoctorProfileScreen.routeName));
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
