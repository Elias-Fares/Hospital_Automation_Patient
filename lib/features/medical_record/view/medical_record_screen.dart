import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/constant/constant.dart';
import '../../../core/enums/params_values.dart';
import '../../../core/function/join_strings.dart';
import '../../../core/params/medical_records_screen_params.dart';
import '../../../core/widgets/appbars/app_bar_title_widget.dart';
import '../../../core/style/card_container_decoration.dart';
import '../../../core/widgets/cards/icon_key_value_widget.dart';
import '../../../core/widgets/cards/persone_tile.dart';
import '../../../core/widgets/appbars/sub_app_bar.dart';
import '../../../configuration/res.dart';
import '../../../core/widgets/custom_error_widget.dart';
import '../../../core/widgets/custom_loading_widget.dart';
import '../view_model/medical_record_view_model.dart';
import '../../profile/view_model/profile_view_model.dart';
part 'widget/medical_record_card.dart';

class MedicalRecordScreen extends ConsumerStatefulWidget {
  const MedicalRecordScreen({
    super.key,
    required this.medicalRecordsScreenParams,
  });
  static const routeName = "/medical_record_screen";

  final MedicalRecordsScreenParams? medicalRecordsScreenParams;

  @override
  ConsumerState<MedicalRecordScreen> createState() =>
      _MedicalRecordScreenState();
}

class _MedicalRecordScreenState extends ConsumerState<MedicalRecordScreen> {
  late String appBarTitle;
  @override
  void initState() {
    super.initState();

    switch (widget.medicalRecordsScreenParams?.comingFrom) {
      case ParamsValues.child:
        appBarTitle = widget.medicalRecordsScreenParams?.childName ?? "";
        break;

      case ParamsValues.patient:
        appBarTitle = ref.read(profileViewModelProvider.notifier).getUserName();
        break;

      default:
        debugPrint("debugger default exc");
        appBarTitle = ref.read(profileViewModelProvider.notifier).getUserName();
    }

    debugPrint(
        "debugger $appBarTitle coming from: ${widget.medicalRecordsScreenParams?.comingFrom} the user name is ${ref.read(profileViewModelProvider.notifier).getUserName()}");

    Future.microtask(
      () {
        ref.read(medicalRecordViewModelProvider.notifier).getMedicalRecords(
            type: widget.medicalRecordsScreenParams?.comingFrom ??
                ParamsValues.patient,
            childId: widget.medicalRecordsScreenParams?.childId);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final medicalRecordsState = ref.watch(medicalRecordViewModelProvider);
    return Scaffold(
        appBar: SubAppBar(
          titleWidget: AppBarTitleWidget(
              title: appBarTitle,
              imagePath:
                  ref.read(profileViewModelProvider.notifier).getUserImage()),
        ),
        body: medicalRecordsState.medicalRecordsResponse?.when(
              error: (error, stackTrace) => CustomErrorWidget(
                message: error.toString(),
                onTryAgainTap: () {
                  ref
                      .read(medicalRecordViewModelProvider.notifier)
                      .getMedicalRecords(
                          type: widget.medicalRecordsScreenParams?.comingFrom ??
                              ParamsValues.patient,
                          childId: widget.medicalRecordsScreenParams?.childId);
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
                    ListView.builder(
                      itemCount: data.length,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        final record = data.elementAtOrNull(index);
                        return MedicalRecordCard(
                            doctorName: joinStrings([
                              record?.doctorInfo?.firstName,
                              record?.doctorInfo?.lastName,
                            ]),
                            doctorImageUrl:
                                "${Constant.baseUrl}/${record?.doctorInfo?.imgurl ?? ""}",
                            doctorSpecialty:
                                record?.doctorInfo?.specialty ?? "",
                            appointmentsCount: record
                                    ?.doctorsAppointments?.length
                                    .toString() ??
                                "0",
                            prescriptionCount:
                                record?.doctorPrescription?.length.toString() ??
                                    "0");
                      },
                    )
                  ],
                ),
              ),
            ) ??
            const SizedBox.shrink());
  }
}
