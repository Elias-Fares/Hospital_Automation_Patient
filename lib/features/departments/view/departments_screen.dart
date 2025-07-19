import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:patient_app/configuration/router/router_utils.dart';
import 'package:patient_app/core/style/app_colors.dart';
import 'package:patient_app/core/style/card_container_decoration.dart';
import 'package:patient_app/core/widgets/appbars/sub_app_bar.dart';
import 'package:patient_app/core/widgets/buttons/custom_inkwell.dart';
import 'package:patient_app/core/widgets/cards/persone_tile.dart';
import 'package:patient_app/core/widgets/custom_error_widget.dart';
import 'package:patient_app/core/widgets/custom_loading_widget.dart';
import 'package:patient_app/features/department_details/view/department_details_screen.dart';
import 'package:patient_app/features/department_details/view_model/department_details_view_model.dart';
import 'package:patient_app/features/departments/view_model/departments_view_model.dart';
part 'widget/department_card.dart';

class DepartmentsScreen extends ConsumerStatefulWidget {
  const DepartmentsScreen({super.key});
  static const routeName = "/departments_screen";

  @override
  ConsumerState<DepartmentsScreen> createState() => _DepartmentsScreenState();
}

class _DepartmentsScreenState extends ConsumerState<DepartmentsScreen> {
  @override
  void initState() {
    super.initState();

    Future.microtask(
      () {
        ref.read(departmentsViewModelProvider.notifier).getAllDepartments();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final departmentsState = ref.watch(departmentsViewModelProvider);
    return Scaffold(
      appBar: const SubAppBar(
        titleWidget: Text("Departments"),
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: departmentsState.departmentsResponse?.when(
            data: (data) => ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                final department = data.elementAtOrNull(index);
                return DepartmentCard(
                  departmentName: department?.name ?? "",
                  // status: index % 2 == 0 ? "Open" : "Closed",
                  status: "",
                  onTap: () {
                    context.push(
                        RouterUtils.getNestedRoute(context,
                            routeName: DepartmentDetailsScreen.routeName),
                        extra: department?.clinicId);
                  },
                );
              },
            ),
            error: (error, stackTrace) => CustomErrorWidget(
              message: error.toString(),
              onTryAgainTap: () {
                ref
                    .read(departmentsViewModelProvider.notifier)
                    .getAllDepartments();
              },
            ),
            loading: () => const CustomLoadingWidget(),
          )),
    );
  }
}
