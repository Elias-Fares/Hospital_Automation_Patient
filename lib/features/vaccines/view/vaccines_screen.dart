import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../configuration/router/router_utils.dart';
import '../../../core/function/join_strings.dart';
import '../../../core/style/app_colors.dart';
import '../../../core/widgets/appbars/sub_app_bar.dart';
import '../../../core/widgets/buttons/custom_inkwell.dart';
import '../../../core/widgets/custom_error_widget.dart';
import '../../../core/widgets/custom_loading_widget.dart';
import '../../vaccine_details/view/vaccine_details_screen.dart';
import '../view_model/vaccines_view_model.dart';
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
