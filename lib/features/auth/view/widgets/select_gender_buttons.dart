import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:patient_app/configuration/res.dart';
import 'package:patient_app/core/enums/gender_enum.dart';
import 'package:patient_app/core/style/app_colors.dart';
import 'package:patient_app/core/widgets/general_image_asset.dart';

class SelectGenderButtons extends StatelessWidget {
  const SelectGenderButtons(
      {super.key, required this.selectedGender,required this.onGenderSelect});

  final GenderEnum selectedGender;
  final void Function(GenderEnum) onGenderSelect;

  Widget buildButton(BuildContext context,
      {required String iconPath,
      required String title,
      required Function()? onTap,
      required bool isSelected}) {
    return Expanded(
      child: Material(
        color: isSelected ? AppColors.surface : AppColors.white,
        borderRadius: BorderRadius.circular(8),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(8),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: isSelected
                    ? Border.all(width: 2, color: AppColors.primary)
                    : null),
            child: Row(
              children: [
                GeneralImageAssets(
                  path: iconPath,
                  width: 24.r,
                  height: 24.r,
                  boxFit: BoxFit.contain,
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  title,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(fontWeight: FontWeight.w700),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        buildButton(
          context,
          iconPath: Res.maleIcon,
          isSelected: selectedGender == GenderEnum.male,
          title: "Male",
          onTap: () {
            onGenderSelect(GenderEnum.male);
          },
        ),
        const SizedBox(
          width: 14,
        ),
        buildButton(
          context,
          iconPath: Res.femaleIcon,
          isSelected: selectedGender == GenderEnum.female,
          title: "Female",
          onTap: () {
                  onGenderSelect(GenderEnum.female);
          },
        ),
      ],
    );
  }
}
