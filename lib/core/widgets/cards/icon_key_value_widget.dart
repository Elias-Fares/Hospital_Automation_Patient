import 'package:flutter/material.dart';
import 'package:patient_app/configuration/res.dart';
import 'package:patient_app/core/style/app_colors.dart';
import 'package:patient_app/core/widgets/buttons/custom_inkwell.dart';
import 'package:patient_app/core/widgets/general_image_asset.dart';

class IconKeyValueWidget extends StatelessWidget {
  const IconKeyValueWidget(
      {super.key,
      required this.iconPath,
      required this.keyTitle,
      required this.value,
      this.needOnTap = false,
      this.onTap});

  final String iconPath;
  final String keyTitle;
  final String value;
  final bool needOnTap;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return needOnTap
        ? CustomInkwell(
            onTap: onTap,
            color: AppColors.white,
            child: getWidget(context),
          )
        : getWidget(context);
  }

  Row getWidget(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GeneralImageAssets(
          path: iconPath,
          width: 24,
          height: 24,
          boxFit: BoxFit.contain,
        ),
        const SizedBox(
          width: 12,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              keyTitle,
              style: Theme.of(context)
                  .textTheme
                  .bodySmall
                  ?.copyWith(color: AppColors.hintTextColor),
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              value,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
        if (needOnTap) ...[
          const Spacer(),
          const Icon(
            Icons.arrow_forward_ios,
            size: 14,
            color: AppColors.hintTextColor,
          )
        ]
      ],
    );
  }
}
