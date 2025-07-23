import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:patient_app/core/function/date_format.dart';
import 'package:patient_app/core/function/join_strings.dart';
import 'package:patient_app/core/params/vaccine_table_screen_param.dart';
import 'package:patient_app/core/style/app_colors.dart';
import 'package:patient_app/core/style/card_container_decoration.dart';
import 'package:patient_app/core/widgets/appbars/app_bar_title_widget.dart';
import 'package:patient_app/core/widgets/appbars/sub_app_bar.dart';
import 'package:patient_app/core/widgets/cards/icon_container.dart';
import 'package:patient_app/core/widgets/cards/loading_card.dart';
import 'package:patient_app/features/vaccination_table/view_model/vaccination_table_view_model.dart';

class VaccinationTableScreen extends ConsumerStatefulWidget {
  const VaccinationTableScreen({
    super.key,
    this.vaccineTableScreenParam,
  });
  static const routeName = "/vaccination_table_screen";
  final VaccineTableScreenParam? vaccineTableScreenParam;

  @override
  ConsumerState<VaccinationTableScreen> createState() =>
      _VaccinationTableScreenState();
}

class _VaccinationTableScreenState
    extends ConsumerState<VaccinationTableScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
      () {
        if (widget.vaccineTableScreenParam != null &&
            widget.vaccineTableScreenParam!.childId != null) {
          ref.read(vaccinationTableViewModelProvider.notifier).getVaccinesTable(
              childId: widget.vaccineTableScreenParam!.childId!.toString());
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final vaccinationTablestate = ref.watch(vaccinationTableViewModelProvider);
    return Scaffold(
      appBar: SubAppBar(
        titleWidget: AppBarTitleWidget(
            title: widget.vaccineTableScreenParam?.childName ?? "",
            imagePath: ""),
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: containerCardDecoration(),
          margin: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
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
                    verticalInside: BorderSide(color: AppColors.outlineVariant),
                    horizontalInside:
                        BorderSide(color: AppColors.outlineVariant),
                  ),
                  columns: [
                    _customDataColumn(title: "Visit"),
                    _customDataColumn(title: "Vaccine", width: 120),
                    _customDataColumn(title: "Date", width: 120),
                    _customDataColumn(title: "State", width: 120),
                    _customDataColumn(
                      title: "Administered by",
                    ),
                    _customDataColumn(title: "Next Visit"),
                  ],
                  rows: vaccinationTablestate.vaccinesTableResposne?.when(
                          data: (data) => data
                              .map(
                                (e) => _customDataRow(context,
                                    visitNumber: e.vaccine?.visitNumber ?? "",
                                    vaccine: e.vaccine?.name?.toString() ?? "",
                                    date: e.receivingDate?.getYearMonthDay() ??
                                        "Not Specified",
                                    state: e.state ?? "",
                                    nextVisit:
                                        e.nextVisitDate?.getYearMonthDay() ??
                                            "Not Specified",
                                    adminstretedBy: joinStrings([
                                      e.user?.firstName,
                                      e.user?.middleName,
                                      e.user?.lastName,
                                    ]),
                                    color:
                                        _colorSelector(state: e.state ?? "")),
                              )
                              .toList(),
                          error: (error, stackTrace) {
                            return [];
                          },
                          loading: () => List.generate(
                                5,
                                (index) => _customDataRowShimmer(context),
                              )) ??
                      [],
                ))
          ]),
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
            "$visitNumber th",
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

  DataRow _customDataRowShimmer(
    BuildContext context,
  ) {
    return const DataRow(cells: [
      DataCell(
        LoadingCard(),
      ),
      DataCell(
        LoadingCard(),
      ),
      DataCell(
        LoadingCard(),
      ),
      DataCell(
        LoadingCard(),
      ),
      DataCell(
        LoadingCard(),
      ),
      DataCell(
        LoadingCard(),
      ),
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

  Color _colorSelector({required String state}) {
    if (state.toLowerCase() == "passed") {
      return AppColors.greenText.withValues(alpha: 0.1);
    } else if (state.toLowerCase() == "missed") {
      return AppColors.error.withValues(alpha: 0.1);
    } else if (state.toLowerCase() == "upcomming") {
      return AppColors.warning.withValues(alpha: 0.1);
    } else {
      return AppColors.transparent;
    }
  }
}
