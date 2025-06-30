import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:patient_app/configuration/router/router_utils.dart';
import 'package:patient_app/core/style/app_colors.dart';
import 'package:patient_app/core/style/card_container_decoration.dart';
import 'package:patient_app/core/widgets/appbars/sub_app_bar.dart';
import 'package:patient_app/core/widgets/buttons/custom_inkwell.dart';
import 'package:patient_app/core/widgets/cards/persone_tile.dart';
import 'package:patient_app/features/department_details/view/department_details_screen.dart';
part 'widget/department_card.dart';


class DepartmentsScreen extends ConsumerStatefulWidget {
  const DepartmentsScreen({super.key});
  static const routeName = "/departments_screen";

  @override
  ConsumerState<DepartmentsScreen> createState() => _DepartmentsScreenState();
}

class _DepartmentsScreenState extends ConsumerState<DepartmentsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SubAppBar(
        titleWidget: Text("Departments"),
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: ListView.builder(
            itemCount: 5,
            itemBuilder: (context, index) => DepartmentCard(
              departmentName: "Cardiac Surgery Department",
              status: index % 2 == 0 ? "Open" : "Closed",
              onTap: () {
                context.push(RouterUtils.getNestedRoute(context,
                    routeName: DepartmentDetailsScreen.routeName));
              },
            ),
          )),
    );
  }
}
