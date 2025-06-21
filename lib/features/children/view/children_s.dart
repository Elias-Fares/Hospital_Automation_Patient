import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:patient_app/core/widgets/appbars/main_app_bar.dart';
import 'package:patient_app/configuration/res.dart';
import 'package:patient_app/core/style/app_colors.dart';
import 'package:patient_app/core/widgets/buttons/custom_inkwell.dart';
import 'package:patient_app/core/widgets/custom_error_widget.dart';
import 'package:patient_app/core/widgets/custom_loading_widget.dart';
import 'package:patient_app/features/child_profile/view/child_profile_screen.dart';
import 'package:patient_app/features/children/view_model/children_view_model.dart';

part 'children_screen.dart';
part 'widget/child_card.dart';