part of '../medicines_search_screen.dart';

class PharmacyMedicinesBottomSheet extends StatelessWidget {
  const PharmacyMedicinesBottomSheet(
      {super.key,
      required this.valuesList,
      this.onTap,
      required this.bottomSheetLabel});
  static builder(BuildContext context,
      {required List<PharmacyMedicine> valuesList,
      void Function(int)? onTap,
      required String bottomSheetLabel}) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (context) {
          return PharmacyMedicinesBottomSheet(
            valuesList: valuesList,
            onTap: onTap,
            bottomSheetLabel: bottomSheetLabel,
          );
        });
  }

  final List<PharmacyMedicine> valuesList;
  final void Function(int)? onTap;
  final String bottomSheetLabel;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400.h,
      width: 1.sw,
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
          color: AppColors.backgroundColor,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(bottomSheetLabel,
                style: Theme.of(context).textTheme.bodyLarge),
            const SizedBox(
              height: 20,
            ),
            ListView.separated(
              itemCount: valuesList.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              separatorBuilder: (context, index) => const SizedBox(
                height: 8,
              ),
              itemBuilder: (context, index) {
                final pharmacyMedicine = valuesList.elementAtOrNull(index);
                return PharmacyCard(
                    onPharmacyTap: () {
                      if (onTap != null) {
                        onTap!(index);
                      }
                    },
                    pharmacyName: pharmacyMedicine?.pharmacy?.phName ?? "",
                    pharmacistName: joinStrings([
                      pharmacyMedicine?.pharmacy?.user?.firstName,
                      pharmacyMedicine?.pharmacy?.user?.lastName,
                    ]),
                    imageUrl: pharmacyMedicine?.pharmacy?.user?.imgurl ?? "");
              },
            )
          ],
        ),
      ),
    );
  }
}
