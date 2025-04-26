import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:patient_app/core/app_colors.dart';

class SubAppBar extends StatelessWidget implements PreferredSizeWidget {
  const SubAppBar({super.key,  this.titleWidget});

  final Widget? titleWidget;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.backgroundColor,
      elevation: 0,
      leading: IconButton(
          onPressed: () {
            if (context.canPop()) {
              context.pop();
            }
          },
          icon: const Icon(Icons.arrow_back, color: Colors.black)),
      titleSpacing: 0,
      title: titleWidget,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
