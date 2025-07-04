import 'package:flutter/material.dart';
import 'package:patient_app/core/style/app_colors.dart';
import 'package:patient_app/core/widgets/general_image_asset.dart';

class SvgContainer extends StatelessWidget {
  const SvgContainer(
      {super.key,
      this.containerPadding,
      required this.imgPath,
      this.imageWidth,
      this.imageHieght});
  final String imgPath;
  final double? imageWidth;
  final double? imageHieght;
  final double? containerPadding;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(containerPadding ?? 6),
        alignment: Alignment.center,
        decoration: const BoxDecoration(
            color: AppColors.primaryContainer, shape: BoxShape.circle),
        child: GeneralImageAssets(
          path: imgPath,
          color: AppColors.primary,
          width: imageWidth ?? 18,
          height: imageHieght ?? 18,
          boxFit: BoxFit.contain,
        ));
  }
}
