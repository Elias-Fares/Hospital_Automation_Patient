import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:patient_app/configuration/res.dart';
import 'package:patient_app/core/style/card_container_decoration.dart';
import 'package:patient_app/core/widgets/appbars/sub_app_bar.dart';
import 'package:patient_app/core/widgets/buttons/loading_button.dart';
import 'package:patient_app/core/widgets/cards/icon_key_value_widget.dart';
part 'widget/vaccine_details_page.dart';

class VaccineDetailsScreen extends ConsumerStatefulWidget {
  const VaccineDetailsScreen({super.key});
  static const routeName = "/vaccine_details_screen";

  @override
  ConsumerState<VaccineDetailsScreen> createState() =>
      _VaccineDetailsScreenState();
}

class _VaccineDetailsScreenState extends ConsumerState<VaccineDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SubAppBar(
        titleWidget: Text(
          "Vaccine name",
          style: Theme.of(context)
              .textTheme
              .titleMedium
              ?.copyWith(fontWeight: FontWeight.w700),
        ),
      ),
      floatingActionButton: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: LoadingButton(title: "Book Vaccine"),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: const SingleChildScrollView(
        child: VaccineDetailsPage(
          fromAge: "1 day",
          toAge: "3 months",
          availability: "Available",
          description:
              "The vaccine contains a weakened form of the rubella virus. When given, it triggers your body to produce antibodies against the virus, providing immunity.",
          interactions: [
            "Immunodeficiency conditions: Individuals with conditions like HIV/AIDS or other immune system disorders may also have a weakened response to the vaccine.",
            "Neomycin or gelatin allergy: The MMR vaccine contains trace amounts of neomycin and gelatin. Individuals with severe allergies to these substances may experience an allergic reaction.",
            "Egg allergy: While the MMR vaccine is grown in chick embryo cell culture, severe reactions in individuals with egg allergies are rare. However, it's essential to inform the healthcare provider about any egg allergies."
          ],
        ),
      ),
    );
  }
}
