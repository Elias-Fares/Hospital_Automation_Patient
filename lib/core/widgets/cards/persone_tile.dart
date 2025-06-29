import 'package:flutter/material.dart';
import 'package:patient_app/core/style/app_colors.dart';
import 'package:patient_app/core/widgets/general_image_asset.dart';
import 'package:patient_app/core/widgets/general_network_image.dart';

class PersoneTile extends StatelessWidget {
  final String imageUrl;
  final String tile;
  final String subtitle;

  const PersoneTile({
    super.key,
    required this.imageUrl,
    required this.tile,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: Row(
        children: [
          ClipOval(
            child: GeneralNetworkImage(
              url: imageUrl,
              width: 40,
              height: 40,
              boxFit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(tile, style: Theme.of(context).textTheme.bodyMedium),
              Text(
                subtitle,
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(color: AppColors.hintTextColor),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
