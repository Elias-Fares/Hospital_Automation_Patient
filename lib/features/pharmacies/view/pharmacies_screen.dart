import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:patient_app/configuration/router/router_utils.dart';
import 'package:patient_app/core/constant/constant.dart';
import 'package:patient_app/core/function/join_strings.dart';
import 'package:patient_app/core/style/app_colors.dart';
import 'package:patient_app/core/style/card_container_decoration.dart';
import 'package:patient_app/core/widgets/appbars/sub_app_bar.dart';
import 'package:patient_app/core/widgets/buttons/custom_inkwell.dart';
import 'package:patient_app/core/widgets/cards/pharmacy_card.dart';
import 'package:patient_app/core/widgets/custom_error_widget.dart';
import 'package:patient_app/core/widgets/custom_loading_widget.dart';
import 'package:patient_app/core/widgets/general_network_image.dart';
import 'package:patient_app/features/pharmacies/view_model/pharmacies_view_model.dart';
import 'package:patient_app/features/pharmacy_profile/view/pharmacy_profile_screen.dart';


class PharmaciesScreen extends ConsumerStatefulWidget {
  const PharmaciesScreen({super.key});
  static const routeName = "/pharmacies_screen";

  @override
  ConsumerState<PharmaciesScreen> createState() => _PharmaciesScreenState();
}

class _PharmaciesScreenState extends ConsumerState<PharmaciesScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.microtask(
      () {
        ref.read(pharmaciesViewModelProvider.notifier).getAllPharmacies();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final pharmaciesState = ref.watch(pharmaciesViewModelProvider);
    return Scaffold(
        appBar: const SubAppBar(
          titleWidget: Text("Pharmacies"),
        ),
        body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: pharmaciesState.pharmaciesResponse?.when(
              data: (data) => ListView.separated(
                itemCount: data.length,
                separatorBuilder: (context, index) => const SizedBox(
                  height: 8,
                ),
                itemBuilder: (context, index) {
                  final pharmacy = data.elementAtOrNull(index);
                  return PharmacyCard(
                    pharmacyName: pharmacy?.name ?? "",
                    pharmacistName: joinStrings([
                      pharmacy?.user?.firstName,
                      pharmacy?.user?.lastName,
                    ]),
                    imageUrl: (pharmacy?.user?.imgurl ?? ""),
                    onPharmacyTap: () {
                      context.push(
                          RouterUtils.getNestedRoute(context,
                              routeName: PharmacyProfileScreen.routeName),
                          extra: pharmacy?.pharmacyId);
                    },
                  );
                },
              ),
              error: (error, stackTrace) => CustomErrorWidget(
                message: error.toString(),
                onTryAgainTap: () {
                  ref
                      .read(pharmaciesViewModelProvider.notifier)
                      .getAllPharmacies();
                },
              ),
              loading: () => const CustomLoadingWidget(),
            )));
  }
}
