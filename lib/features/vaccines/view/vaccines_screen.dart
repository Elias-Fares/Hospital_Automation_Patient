import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:patient_app/configuration/router/router_utils.dart';
import 'package:patient_app/core/style/app_colors.dart';
import 'package:patient_app/core/style/card_container_decoration.dart';
import 'package:patient_app/core/widgets/appbars/sub_app_bar.dart';
import 'package:patient_app/core/widgets/buttons/custom_inkwell.dart';
import 'package:patient_app/features/vaccine_details/view/vaccine_details_screen.dart';
part 'widget/vaccine_card.dart';

class VaccinesScreen extends ConsumerStatefulWidget {
  const VaccinesScreen({super.key});
  static const routeName = "/vaccines_screen";

  @override
  ConsumerState<VaccinesScreen> createState() => _VaccinesScreenState();
}

class _VaccinesScreenState extends ConsumerState<VaccinesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SubAppBar(
        titleWidget: Text("Vaccines"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: ListView.builder(
          itemCount: 8,
          itemBuilder: (context, index) => VaccineCard(
            vaccineName: "Rubella",
            vaccineDescription:
                "The vaccine contains a weakened form of the rubella virus. When given, it triggers your body to produce antibodies against the virus, providing immunity.",
            vaccineAgeRange: "3 months - 2 years",
            onVaccineCardTap: () {
              context.push(RouterUtils.getNestedRoute(context,
                  routeName: VaccineDetailsScreen.routeName));
            },
          ),
        ),
      ),
    );
  }
}
