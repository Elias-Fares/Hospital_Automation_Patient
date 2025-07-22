import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:patient_app/configuration/router/router_utils.dart';
import 'package:patient_app/core/function/join_strings.dart';
import 'package:patient_app/core/style/app_colors.dart';
import 'package:patient_app/core/style/card_container_decoration.dart';
import 'package:patient_app/core/widgets/appbars/sub_app_bar.dart';
import 'package:patient_app/core/widgets/buttons/custom_inkwell.dart';
import 'package:patient_app/core/widgets/custom_error_widget.dart';
import 'package:patient_app/core/widgets/custom_loading_widget.dart';
import 'package:patient_app/features/vaccine_details/view/vaccine_details_screen.dart';
import 'package:patient_app/features/vaccine_details/view_model/vaccine_details_view_model.dart';
import 'package:patient_app/features/vaccines/view_model/vaccines_view_model.dart';
part 'widget/vaccine_card.dart';

class VaccinesScreen extends ConsumerStatefulWidget {
  const VaccinesScreen({super.key});
  static const routeName = "/vaccines_screen";

  @override
  ConsumerState<VaccinesScreen> createState() => _VaccinesScreenState();
}

class _VaccinesScreenState extends ConsumerState<VaccinesScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
      () {
        ref.read(vaccinesViewModelProvider.notifier).getVaccines();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final vaccinesState = ref.watch(vaccinesViewModelProvider);
    return Scaffold(
      appBar: const SubAppBar(
        titleWidget: Text("Vaccines"),
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: vaccinesState.vaccinesResponse?.when(
            data: (data) => ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                final vaccine = data.elementAtOrNull(index);
                return VaccineCard(
                  vaccineName: vaccine?.name ?? "",
                  vaccineDescription: vaccine?.description ?? "",
                  vaccineAgeRange: joinStrings([
                    vaccine?.minAge?.toString(),
                    vaccine?.minAgeUnit,
                    vaccine?.maxAge?.toString(),
                    vaccine?.maxAgeUnit,
                  ]),
                  onVaccineCardTap: () {
                    context.push(RouterUtils.getNestedRoute(context,
                        routeName: VaccineDetailsScreen.routeName), extra: vaccine);
                  },
                );
              },
            ),
            error: (error, stackTrace) => CustomErrorWidget(
              message: error.toString(),
              onTryAgainTap: () {
                ref.read(vaccinesViewModelProvider.notifier).getVaccines();
              },
            ),
            loading: () => const CustomLoadingWidget(),
          )),
    );
  }
}
