import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../configuration/router/router_utils.dart';
import '../../../core/constant/constant.dart';
import '../../../core/enums/params_values.dart';
import '../../../core/function/join_strings.dart';
import '../../../core/params/prescriptions_screen_params.dart';
import '../../../core/style/app_colors.dart';
import '../../../core/widgets/appbars/app_bar_title_widget.dart';
import '../../../core/widgets/buttons/custom_inkwell.dart';
import '../../../core/widgets/cards/icon_key_value_widget.dart';
import '../../../core/widgets/cards/persone_tile.dart';
import '../../../core/widgets/appbars/sub_app_bar.dart';
import '../../../configuration/res.dart';
import '../../../core/widgets/custom_error_widget.dart';
import '../../../core/widgets/custom_loading_widget.dart';
import '../view_model/patient_prescription_view_model.dart';
import '../../prescription_details/view/prescription_details_screen.dart';

part 'widget/prescription_card.dart';

class PatientPrescriptionScreen extends ConsumerStatefulWidget {
  const PatientPrescriptionScreen({
    super.key,
    required this.prescriptionsScreenParams,
  });
  static const routeName = "/patient_prescription_screen";

  final PrescriptionsScreenParams prescriptionsScreenParams;

  @override
  ConsumerState<PatientPrescriptionScreen> createState() =>
      _PatientPrescriptionScreenState();
}

class _PatientPrescriptionScreenState
    extends ConsumerState<PatientPrescriptionScreen> {
  String? appBarTitle;
  @override
  void initState() {
    super.initState();

    switch (widget.prescriptionsScreenParams.comingFrom) {
      case ParamsValues.child:
        appBarTitle = widget.prescriptionsScreenParams.childName;
        break;
      case ParamsValues.doctor:
        appBarTitle = widget.prescriptionsScreenParams.doctorName;
        break;
      case ParamsValues.patient:
        appBarTitle = ref
            .read(patientPrescriptionViewModelProvider.notifier)
            .getUserName();
        break;

      default:
    }

    Future.microtask(
      () async {
        await ref
            .read(patientPrescriptionViewModelProvider.notifier)
            .getPrescriptions(
                comingFrom: widget.prescriptionsScreenParams.comingFrom,
                childId: widget.prescriptionsScreenParams.childId,
                pharmacyId: widget.prescriptionsScreenParams.pharmacyId);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final prescriptionsState = ref.watch(patientPrescriptionViewModelProvider);
    return Scaffold(
        appBar: SubAppBar(
          titleWidget:
              AppBarTitleWidget(title: appBarTitle ?? "", imagePath: ""),
        ),
        body: prescriptionsState.prescriptionsResponse?.when(
              error: (error, stackTrace) => CustomErrorWidget(
                message: error.toString(),
                onTryAgainTap: () {
                  ref
                      .read(patientPrescriptionViewModelProvider.notifier)
                      .getPrescriptions(
                          comingFrom:
                              widget.prescriptionsScreenParams.comingFrom);
                },
              ),
              loading: () => const CustomLoadingWidget(),
              data: (data) => SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 15,
                    ),
                    ListView.separated(
                      itemCount: data.length,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      separatorBuilder: (context, index) => const SizedBox(
                        height: 8,
                      ),
                      itemBuilder: (context, index) {
                        final prescription = data.elementAtOrNull(index);
                        return PrescriptionCard(
                          doctorName: joinStrings([
                            prescription?.doctorModel?.firstName ??
                                "no doctor details",
                            prescription?.doctorModel?.lastName
                          ]),
                          doctorImageUrl:
                              "${Constant.baseUrl}/${prescription?.doctorModel?.imgurl}",
                          doctorSpecialty:
                              prescription?.doctorModel?.specialty ?? "",
                          medicinesNames: ref
                              .read(
                                  patientPrescriptionViewModelProvider.notifier)
                              .getMedicinesNames(
                                  prescriptionMedicines:
                                      prescription?.prescriptionMedicines),
                          onPrescriptionCardTap: () {
                            context.push(
                                RouterUtils.getNestedRoute(context,
                                    routeName:
                                        PrescriptionDetailsScreen.routeName),
                                extra: prescription);
                          },
                        );
                      },
                    )
                  ],
                ),
              ),
            ) ??
            const SizedBox.shrink());
  }
}
