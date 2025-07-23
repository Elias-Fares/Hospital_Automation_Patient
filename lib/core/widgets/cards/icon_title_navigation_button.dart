import 'package:flutter/material.dart';

import 'package:patient_app/core/style/app_colors.dart';
import 'package:patient_app/core/widgets/buttons/custom_inkwell.dart';
import 'package:patient_app/core/widgets/cards/svg_container.dart';
import 'package:patient_app/core/widgets/general_image_asset.dart';

class IconTitleNavigationButton extends StatelessWidget {
  const IconTitleNavigationButton(
      {super.key,
      required this.iconPath,
      required this.title,
      required this.onTap,
      this.textColor});
  final String iconPath;
  final String title;
  final Color? textColor;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return CustomInkwell(
      color: AppColors.white,
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
            border: Border(bottom: BorderSide(color: AppColors.surface))),
        child: Row(
          children: [
            // GeneralImageAssets(
            //   path: iconPath,
            //   width: 24,
            //   height: 24,
            //   boxFit: BoxFit.contain,
            // ),
            SvgContainer(
              imgPath: iconPath,
              color: textColor,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: textColor),
            )
          ],
        ),
      ),
    );
  }
}
