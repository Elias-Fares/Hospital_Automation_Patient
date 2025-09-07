part of '../medicines_search_screen.dart';

class MedicineSearchCard extends StatelessWidget {
  final String medicineName;
  final String medicineTiter;
  final String price;

  final String imageUrl;
  final String pharmacyCount;
  final VoidCallback? onTap;
  final VoidCallback? onPharmacyTap;

  const MedicineSearchCard({
    super.key,
    required this.medicineName,
    required this.medicineTiter,
    required this.price,
    required this.imageUrl,
    required this.pharmacyCount,
    this.onTap,
    this.onPharmacyTap,
  });

  @override
  Widget build(BuildContext context) {
    return CustomInkwell(
      color: AppColors.white,
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                  height: 120,
                  width: 1.sw,
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: GeneralNetworkImage(
                    url: imageUrl,
                    boxFit: BoxFit.cover,
                  )),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Text(medicineName,
                    style: Theme.of(context).textTheme.bodyMedium),
                const SizedBox(
                  width: 2,
                ),
                Text(
                  "($medicineTiter)",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                )
              ],
            ),
            const SizedBox(height: 6),
            Text(price,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: AppColors.primary, fontWeight: FontWeight.w700)),
            const SizedBox(height: 10),
            CustomInkwell(
              onTap: onPharmacyTap,
              borderRadius: BorderRadius.circular(8),
              color: AppColors.backgroundColor,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: AppColors.outlineVariant),
                ),
                child: Row(
                  children: [
                    const IconContainer(
                      iconData: Icons.local_pharmacy_outlined,
                      containerPadding: 0,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      "$pharmacyCount Pharmacies",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[700],
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const Spacer(),
                    const Icon(
                      Icons.chevron_right,
                      size: 18,
                      color: AppColors.hintTextColor,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
