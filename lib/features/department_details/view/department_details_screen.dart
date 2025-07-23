import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:patient_app/configuration/router/router_utils.dart';
import 'package:patient_app/core/function/get_opening_status.dart';
import 'package:patient_app/core/function/join_strings.dart';
import 'package:patient_app/core/models/doctor_model.dart';
import 'package:patient_app/core/models/user.dart';
import 'package:patient_app/core/models/work_day.dart';
import 'package:patient_app/core/style/app_colors.dart';
import 'package:patient_app/core/style/card_container_decoration.dart';
import 'package:patient_app/core/widgets/appbars/sub_app_bar.dart';
import 'package:patient_app/core/widgets/buttons/custom_inkwell.dart';
import 'package:patient_app/core/widgets/cards/icon_key_value_widget.dart';
import 'package:patient_app/core/widgets/cards/key_value_card.dart';
import 'package:patient_app/core/widgets/cards/outlined_card.dart';
import 'package:patient_app/core/widgets/cards/persone_tile.dart';
import 'package:patient_app/core/widgets/custom_error_widget.dart';
import 'package:patient_app/core/widgets/custom_loading_widget.dart';
import 'package:patient_app/data/doctors/models/department_model.dart';
import 'package:patient_app/data/doctors/models/doctor_profile_model.dart'
    show WorkDay;
import 'package:patient_app/features/department_details/view_model/department_details_view_model.dart';
import 'package:patient_app/features/doctor_profile/model/availability_schedule_model.dart';
import 'package:patient_app/features/doctor_profile/view/doctor_profile_screen.dart';
import 'package:patient_app/features/patient_doctors/view/patient_doctors_screen.dart';
part 'widget/department_details_widget.dart';
part 'widget/department_doctor_card.dart';

class DepartmentDetailsScreen extends ConsumerStatefulWidget {
  const DepartmentDetailsScreen({super.key, required this.departmentId});
  static const routeName = "/department_details_screen";

  final int? departmentId;

  @override
  ConsumerState<DepartmentDetailsScreen> createState() =>
      _DepartmentDetailsScreenState();
}

class _DepartmentDetailsScreenState
    extends ConsumerState<DepartmentDetailsScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
      () {
        if (widget.departmentId == null) {
          return;
        }
        ref
            .read(departmentDetailsViewModelProvider.notifier)
            .getAllDepartments(id: widget.departmentId!.toString());
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final departmentDetailsState =
        ref.watch(departmentDetailsViewModelProvider);
    return Scaffold(
      appBar: const SubAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: departmentDetailsState.departmentDetailsResponse?.when(
              data: (data) => DepartmentDetailsWidget(
                  onDoctorCardTap: (index) {
                    final doctorId = data.users?.elementAtOrNull(index)?.userId;

                    context.push(
                        RouterUtils.getNestedRoute(context,
                            routeName: DoctorProfileScreen.routeName),
                        extra: doctorId?.toString());
                  },
                  departmentName: data.name ?? "",
                  currentStatus: getOpeningStatus(data.workDays ?? []),
                  availabilitySchedule: data.workDays ?? [],
                  activeDoctors: data.users ?? [],
                  services: data.clinicServices
                          ?.map(
                            (e) => e.name ?? "",
                          )
                          .toList() ??
                      []),
              error: (error, stackTrace) =>
                  CustomErrorWidget(message: error.toString()),
              loading: () => const CustomLoadingWidget(),
            ) ??
            const SizedBox.shrink(),
      ),
    );
  }
}
