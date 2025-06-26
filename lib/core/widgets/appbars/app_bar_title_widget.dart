import 'package:flutter/material.dart';
import 'package:patient_app/configuration/res.dart';
import 'package:patient_app/core/constant/constant.dart';
import 'package:patient_app/core/widgets/general_image_asset.dart';
import 'package:patient_app/core/widgets/general_network_image.dart';

class AppBarTitleWidget extends StatelessWidget {
  const AppBarTitleWidget({
    super.key,
    required this.title,
    required this.imagePath,
  });

  final String? imagePath;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipOval(
          child: GeneralNetworkImage(
            url: "${Constant.baseUrl}/$imagePath",
            width: 35,
            height: 35,
            boxFit: BoxFit.cover,
            failWidget: const GeneralImageAssets(
              path: Res.childCardIcon,
              width: 35,
              height: 35,
              boxFit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        Text(
          title,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ],
    );
  }
}
