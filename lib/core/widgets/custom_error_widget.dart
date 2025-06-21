import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:patient_app/configuration/res.dart';
import 'package:patient_app/core/style/app_colors.dart';
import 'package:patient_app/core/widgets/buttons/custom_inkwell.dart';
import 'package:patient_app/core/widgets/buttons/custom_text_button.dart';
import 'package:patient_app/core/widgets/general_image_asset.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({
    super.key,
    required this.message,
    this.height,
    this.mainAxisAlignment,
    this.textStyle,
    this.onTryAgainTap,
  });

  final String message;
  final double? height;
  final MainAxisAlignment? mainAxisAlignment;
  final TextStyle? textStyle;
  final void Function()? onTryAgainTap;


  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: height,
        width: 1.sw,
        child: Column(
          mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.center,
          children: [
            const GeneralImageAssets(
              path: Res.errorIcon,
              color: AppColors.primary,
              width: 50,
              height: 50,
              boxFit: BoxFit.contain,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(message,
                style: textStyle ?? Theme.of(context).textTheme.bodyMedium),
            const SizedBox(
              height: 15,
            ),
            CustomInkwell(
              onTap: onTryAgainTap,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 4),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AppColors.primary.withValues(alpha: 0.15)),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("Try Again",
                        style: Theme.of(context).textTheme.bodyMedium),
                    const SizedBox(
                      width: 2,
                    ),
                    const Icon(
                      Icons.refresh_rounded,
                      color: AppColors.primary,
                    )
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
