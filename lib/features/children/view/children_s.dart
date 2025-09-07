import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/widgets/appbars/main_app_bar.dart';
import '../../../configuration/res.dart';
import '../../../core/style/app_colors.dart';
import '../../../core/widgets/buttons/custom_inkwell.dart';
import '../../../core/widgets/cards/svg_container.dart';
import '../../../core/widgets/custom_error_widget.dart';
import '../../../core/widgets/custom_loading_widget.dart';
import '../../child_profile/view/child_profile_screen.dart';
import '../view_model/children_view_model.dart';

part 'children_screen.dart';
part 'widget/child_card.dart';