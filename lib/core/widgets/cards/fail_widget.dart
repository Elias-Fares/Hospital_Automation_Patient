import 'package:flutter/material.dart';

import '../../style/app_colors.dart';

class PersonFailWidget extends StatelessWidget {
  const PersonFailWidget({super.key, required this.name});
  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 35,
      height: 35,
      alignment: Alignment.center,
      decoration: const BoxDecoration(
          color: AppColors.primaryDimmed, shape: BoxShape.circle),
      child: Text(
        name.length > 2 ? name.substring(0, 1).toUpperCase() : "",
        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            color: AppColors.white, fontSize: 18, fontWeight: FontWeight.w400),
      ),
    );
  }
}
