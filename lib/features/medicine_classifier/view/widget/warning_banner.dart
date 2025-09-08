part of '../medicine_classifier_screen.dart';
class WarningBanner extends StatelessWidget {
  const WarningBanner({
    super.key,
  
  });



  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.tertiary.withValues(alpha: .2),
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppColors.onTertiary,
              shape: BoxShape.circle,
            ),
            alignment: Alignment.center,
            child: Text(
              "⚠️",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
          const SizedBox(width: 13),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Experimental Feature',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(fontWeight: FontWeight.w500)),
                const SizedBox(height: 4),
                Text(
                    'This tool is not a substitute for professional pharmacist consultation. Accuracy: 93.23%',
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(color: AppColors.onTertiaryContainer)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

