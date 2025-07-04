part of '../pharmacies_screen.dart';

class PharmacyCard extends StatelessWidget {
  const PharmacyCard({
    super.key,
    required this.pharmacyName,
    required this.pharmacistName,
    required this.imageUrl,
    this.onPharmacyTap,
  });

  final String pharmacyName;
  final String pharmacistName;
  final String imageUrl;
  final void Function()? onPharmacyTap;

  @override
  Widget build(BuildContext context) {
    return CustomInkwell(
      onTap: onPharmacyTap,
      color: containerCardDecoration().color,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: const BoxDecoration(shape: BoxShape.circle),
              child: GeneralNetworkImage(
                url: imageUrl,
                boxFit: BoxFit.contain,
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  pharmacistName,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(
                  height: 2,
                ),
                Text(
                  pharmacyName,
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.copyWith(color: AppColors.hintTextColor),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
