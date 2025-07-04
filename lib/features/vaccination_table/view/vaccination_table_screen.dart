import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:patient_app/core/style/app_colors.dart';
import 'package:patient_app/core/style/card_container_decoration.dart';
import 'package:patient_app/core/widgets/appbars/app_bar_title_widget.dart';
import 'package:patient_app/core/widgets/appbars/sub_app_bar.dart';
import 'package:patient_app/core/widgets/cards/icon_container.dart';
import 'package:patient_app/core/widgets/cards/svg_container.dart';

class VaccinationTableScreen extends ConsumerStatefulWidget {
  const VaccinationTableScreen({super.key});
  static const routeName = "/vaccination_table_screen";

  @override
  ConsumerState<VaccinationTableScreen> createState() =>
      _VaccinationTableScreenState();
}

class _VaccinationTableScreenState
    extends ConsumerState<VaccinationTableScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SubAppBar(
        titleWidget: AppBarTitleWidget(title: "Child Name", imagePath: ""),
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: containerCardDecoration(),
          margin: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Row(
                  children: [
                    const IconContainer(iconData: Icons.vaccines_outlined),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      "Vaccination card",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                    columnSpacing: 0,
                    checkboxHorizontalMargin: 0,
                    horizontalMargin: 0,
                    dividerThickness: 0,
                    border: const TableBorder(
                      verticalInside:
                          BorderSide(color: AppColors.outlineVariant),
                      horizontalInside:
                          BorderSide(color: AppColors.outlineVariant),
                    ),
                    columns: [
                      _customDataColumn(title: "Visit"),
                      _customDataColumn(title: "Vaccine", width: 170),
                      _customDataColumn(title: "Date", width: 150),
                      _customDataColumn(title: "State", width: 80),
                      _customDataColumn(title: "Administered by", width: 120),
                      _customDataColumn(title: "Next Visit"),
                    ],
                    rows: [
                      _customDataRow(
                        context,
                        visitNumber: "1th",
                        vaccine: "rubella",
                        date: "20/11/2025",
                        state: "Taken",
                        adminstretedBy: "Dr.lorem ipsum",
                        nextVisit: "20/11/2025",
                      ),
                      _customDataRow(context,
                          visitNumber: "1th",
                          vaccine: "rubella",
                          date: "20/11/2025",
                          state: "Taken",
                          adminstretedBy: "Dr.lorem ipsum",
                          nextVisit: "20/11/2025",
                          color: AppColors.transparentPrimaryContainer),
                      _customDataRow(context,
                          visitNumber: "1th",
                          vaccine: "rubella",
                          date: "20/11/2025",
                          state: "Taken",
                          adminstretedBy: "Dr.lorem ipsum",
                          nextVisit: "20/11/2025",
                          color: AppColors.errorContainer),
                      _customDataRow(
                        context,
                        visitNumber: "1th",
                        vaccine: "rubella",
                        date: "20/11/2025",
                        state: "Taken",
                        adminstretedBy: "Dr.lorem ipsum",
                        nextVisit: "20/11/2025",
                      ),
                    ]),
              )
            ],
          ),
        ),
      ),
    );
  }

  DataRow _customDataRow(BuildContext context,
      {required String visitNumber,
      required String vaccine,
      required String date,
      required String state,
      required String adminstretedBy,
      required String nextVisit,
      Color? color}) {
    return DataRow(color: WidgetStatePropertyAll(color), cells: [
      DataCell(
        Center(
          child: Text(
            visitNumber,
            style: Theme.of(context).textTheme.labelMedium,
          ),
        ),
      ),
      DataCell(Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(vaccine, style: Theme.of(context).textTheme.bodyMedium),
      )),
      DataCell(Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(date,
            style: Theme.of(context)
                .textTheme
                .bodySmall
                ?.copyWith(color: AppColors.hintTextColor)),
      )),
      DataCell(Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(state, style: Theme.of(context).textTheme.bodySmall),
      )),
      DataCell(Padding(
        padding: const EdgeInsets.all(8.0),
        child:
            Text(adminstretedBy, style: Theme.of(context).textTheme.bodySmall),
      )),
      DataCell(Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(nextVisit, style: Theme.of(context).textTheme.bodySmall),
      )),
    ]);
  }

  DataColumn _customDataColumn({required String title, double? width}) {
    return DataColumn(
      label: Container(
        height: 50,
        width: width,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        decoration: const BoxDecoration(
            color: AppColors.primaryContainer,
            border:
                Border(right: BorderSide(color: AppColors.backgroundColor))),
        child: Text(
          title,
          style: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
