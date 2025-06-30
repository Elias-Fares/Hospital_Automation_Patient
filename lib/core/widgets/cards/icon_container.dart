import 'package:flutter/material.dart';
import 'package:patient_app/core/style/app_colors.dart';

class IconContainer extends StatelessWidget {
  const IconContainer({super.key, required this.iconData, this.iconSize,  this.containerPadding});
  final IconData iconData;
  final double? iconSize;
  final double? containerPadding;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding:  EdgeInsets.all(containerPadding ?? 6),
        alignment: Alignment.center,
        decoration: const BoxDecoration(
            color: AppColors.primaryContainer, shape: BoxShape.circle),
        child:  Icon(
          Icons.medical_information_outlined,
          size: iconSize ??  18,
          color: AppColors.primary,
        ));
  }
}
