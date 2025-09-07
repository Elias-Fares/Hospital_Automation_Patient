import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../configuration/router/router_utils.dart';
import '../../../core/style/app_colors.dart';
import '../../../core/style/card_container_decoration.dart';
import '../../../core/widgets/appbars/sub_app_bar.dart';
import '../../../core/widgets/buttons/custom_inkwell.dart';
import '../../../core/widgets/custom_error_widget.dart';
import '../../../core/widgets/custom_loading_widget.dart';
import '../../department_details/view/department_details_screen.dart';
import '../view_model/departments_view_model.dart';
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
