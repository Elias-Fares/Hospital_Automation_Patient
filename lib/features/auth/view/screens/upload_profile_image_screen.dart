import 'package:flutter/material.dart';
import 'package:patient_app/configuration/res.dart';
import 'package:patient_app/core/style/app_colors.dart';
import 'package:patient_app/core/widgets/buttons/loading_button.dart';
import 'package:patient_app/core/widgets/general_image_asset.dart';

class UploadProfileImageScreen extends StatelessWidget {
  static const routeName = "/upload_profile_image";
  const UploadProfileImageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center( 
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                    color: AppColors.backgroundLight,
                    borderRadius: BorderRadius.circular(8)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const GeneralImageAssets(
                      path: Res.uploadImage,
                      width: 100,
                      height: 100,
                      boxFit: BoxFit.contain,
                    ),
                    Text(
                      "Upload Your Profile Photo",
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: AppColors.primary,
                          fontWeight: FontWeight.w600),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        "To help us verify your identity and ensure the security of your account, please upload a clear, recognizable photo of yourself. This step helps us prevent fraudulent activity.",
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(fontWeight: FontWeight.w400),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: LoadingButton(
                        title: "Upload Image",
                        isLoading: false,
                        onTap: () {},
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: kToolbarHeight,
            )
          ],
        ),
      ),
    );
  }
}
