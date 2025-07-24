import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:patient_app/configuration/router/router_utils.dart';
import 'package:patient_app/configuration/service_locator.dart';
import 'package:patient_app/core/constant/constant.dart';
import 'package:patient_app/core/enums/params_values.dart';
import 'package:patient_app/core/function/join_strings.dart';
import 'package:patient_app/core/managers/appointment_data_manager.dart';
import 'package:patient_app/core/style/card_container_decoration.dart';
import 'package:patient_app/core/widgets/cards/persone_tile.dart';
import 'package:patient_app/core/widgets/appbars/sub_app_bar.dart';
import 'package:patient_app/configuration/res.dart';
import 'package:patient_app/core/style/app_colors.dart';
import 'package:patient_app/core/widgets/buttons/custom_inkwell.dart';
import 'package:patient_app/core/widgets/buttons/loading_button.dart';
import 'package:patient_app/core/widgets/textfields/select_option_text_field.dart';
import 'package:patient_app/data/childern/repository/children_repository.dart';
import 'package:patient_app/features/book_appointment/model/medical_procedure_model.dart';
import 'package:patient_app/features/book_appointment/view_model/book_appointment_view_model.dart';
import 'package:patient_app/features/book_appointment/view_model/book_appointment_state.dart';
import 'package:patient_app/features/choose_appointment_date/view/choose_appointment_date_screen.dart';
import 'package:patient_app/features/doctor_profile/view_model/doctor_profile_view_model.dart';

part 'widget/procedure_card.dart';

class BookAppointmentScreen extends ConsumerStatefulWidget {
  const BookAppointmentScreen({super.key});
  static const routeName = "/book_appointment_screen";

  @override
  ConsumerState<BookAppointmentScreen> createState() =>
      _BookAppointmentScreenState();
}

class _BookAppointmentScreenState extends ConsumerState<BookAppointmentScreen> {
  late final TextEditingController selectedChildController;

  @override
  void initState() {
    super.initState();

    selectedChildController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    final doctorProfileModel = ref
        .watch(doctorProfileViewModelProvider)
        .doctorProfileResponse
        ?.asData
        ?.value;
    final BookAppointmentState bookAppointmentState =
        ref.watch(bookAppointmentViewModelProvider);

    final validationMessage = ref.watch(bookAppointmentViewModelProvider.select(
      (value) => value.validationMessage,
    ));

    return Scaffold(
      appBar: SubAppBar(
        titleWidget: PersoneTile(
            imageUrl: "${Constant.baseUrl}/${doctorProfileModel?.imgurl ?? ""}",
            title: joinStrings([
              doctorProfileModel?.firstName,
              doctorProfileModel?.lastName,
            ]),
            subtitle: doctorProfileModel?.specialty ?? ""),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            Text(
              "Who is this appointment for?",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(
              height: 10,
            ),
            RadioListTile<ParamsValues>(
              value: ParamsValues.patient,
              groupValue: bookAppointmentState.paramsValue,
              title: Text(
                "For Me",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              visualDensity: const VisualDensity(
                  horizontal: VisualDensity.minimumDensity,
                  vertical: VisualDensity.minimumDensity),
              onChanged: (value) {
                ref
                    .read(bookAppointmentViewModelProvider.notifier)
                    .selectParamValue(value);
              },
            ),
            RadioListTile<ParamsValues>(
              value: ParamsValues.child,
              groupValue: bookAppointmentState.paramsValue,
              title: Text(
                "For child I am guardian of",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              visualDensity: const VisualDensity(
                  horizontal: VisualDensity.minimumDensity,
                  vertical: VisualDensity.minimumDensity),
              onChanged: (value) {
                debugPrint(value.toString());
                ref
                    .read(bookAppointmentViewModelProvider.notifier)
                    .selectParamValue(value);
              },
            ),
            const SizedBox(
              height: 15,
            ),
            if (bookAppointmentState.showChildrenList) ...[
              SelectOptionsTextField(
                bottomSheetTitle: "Select Child",
                hintText: "Select Child",
                isLoading: bookAppointmentState.childrenResponse?.isLoading,
                textEditingController: selectedChildController,
                optionsList: ref
                    .read(bookAppointmentViewModelProvider.notifier)
                    .getChildrenNames(),
                onTap: (index) {
                  final selectedChild = bookAppointmentState
                      .childrenResponse?.asData?.value
                      .elementAtOrNull(index);

                  ref
                      .read(bookAppointmentViewModelProvider.notifier)
                      .setChildId(childId: selectedChild?.childId?.toString());

                  selectedChildController.text = joinStrings([
                    selectedChild?.child?.firstName,
                    selectedChild?.child?.lastName,
                  ]);
                },
              ),
              const SizedBox(
                height: 15,
              ),
            ],
            Container(
              decoration: containerCardDecoration(),
              padding: const EdgeInsets.all(16),
              child: ListView.builder(
                itemCount: doctorProfileModel?.appointmentTypes?.length ?? 0,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  final procedure = doctorProfileModel?.appointmentTypes
                      ?.elementAtOrNull(index);
                  final isSelected = bookAppointmentState.selectedProcedure ==
                      procedure?.appointmentTypesId.toString();
                  return ProcedureCard(
                    isSelected: isSelected,
                    procedureId:
                        procedure?.appointmentTypesId?.toString() ?? "",
                    procedureName: procedure?.typeName ?? "",
                    procedureDescription: procedure?.description ?? "",
                    procedureDuration:
                        procedure?.standardDuration.toString() ?? "",
                    onSelect: (id) {
                      ref
                          .read(bookAppointmentViewModelProvider.notifier)
                          .selectChoice(id);
                    },
                  );
                },
              ),
            ),
            if (validationMessage.isNotEmpty) ...[
              const SizedBox(
                height: 10,
              ),
              Text(
                bookAppointmentState.validationMessage,
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(color: AppColors.error),
              )
            ],
            const SizedBox(
              height: 24,
            ),
            LoadingButton(
              title: "Next",
              onTap: () async {

                ref
                    .read(bookAppointmentViewModelProvider.notifier)
                    .validatePage();

                final validationMessage = ref
                    .read(bookAppointmentViewModelProvider)
                    .validationMessage;

                if (validationMessage.isEmpty) {
                  context.push(RouterUtils.getNestedRoute(context,
                      routeName: ChooseAppointmentDateScreen.routeName));
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
