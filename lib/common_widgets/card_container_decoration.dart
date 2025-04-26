import 'package:flutter/material.dart';
import 'package:patient_app/core/app_colors.dart';

BoxDecoration containerCardDecoration({Color? color}) {
  return BoxDecoration(
      color: color ?? AppColors.white, borderRadius: BorderRadius.circular(8));
}
