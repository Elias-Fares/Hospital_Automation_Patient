import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:patient_app/common_widgets/card_container_decoration.dart';
import 'package:patient_app/common_widgets/icon_key_value_widget.dart';
import 'package:patient_app/common_widgets/sub_app_bar.dart';
import 'package:patient_app/configuration/res.dart';
import 'package:patient_app/core/widgets/general_image_asset.dart';
part 'widget/profile_details_widget.dart';

class ProfileScreen extends StatelessWidget {
  static const routeName = "profile";
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: SubAppBar(),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            ProfileDetailsWidget(
                name: "john doe",
                gender: "male",
                imagePath: Res.personePlaceHolderImage,
                address: "Lattakia - Masaya Street",
                lastAppointment: "12:00 AM",
                nextAppointment: "11/11/2025")
          ],
        ),
      ),
    );
  }
}
