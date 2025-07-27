import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:patient_app/configuration/res.dart';
import 'package:patient_app/core/constant/constant.dart';
import 'package:patient_app/core/models/medicine_model.dart';
import 'package:patient_app/core/style/app_colors.dart';
import 'package:patient_app/core/style/card_container_decoration.dart';
import 'package:patient_app/core/widgets/appbars/sub_app_bar.dart';
import 'package:patient_app/core/widgets/cards/icon_key_value_widget.dart';
import 'package:patient_app/core/widgets/general_image_asset.dart';
import 'package:patient_app/core/widgets/general_network_image.dart';

class MedicineDetailsScreen extends ConsumerStatefulWidget {
  const MedicineDetailsScreen({
    super.key,
    this.med,
  });
  static const routeName = "/medicine_details_screen";

  final MedicineModel? med;

  @override
  ConsumerState<MedicineDetailsScreen> createState() =>
      _MedicineDetailsScreenState();
}

class _MedicineDetailsScreenState extends ConsumerState<MedicineDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SubAppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            MedicineDetailsWidget(
              name: widget.med?.name ?? "",
              price:
                  "${widget.med?.price?.toString() ?? ""} ${Constant.appCurrency}",
              imageUrl: "${Constant.baseUrl}/${widget.med?.medImageUrl ?? ""}",
              titer: widget.med?.pharmaceuticalTiter?.toString() ?? "",
              composition: widget.med?.pharmaceuticalComposition ?? "",
              indication: widget.med?.pharmaceuticalIndications ?? "",
              company: widget.med?.companyName ?? "",
              allownace: widget.med?.isAllowedWithoutPrescription! == true
                  ? "Prescription not required"
                  : "Prescription required",
            )
          ],
        ),
      ),
    );
  }
}

class MedicineDetailsWidget extends StatelessWidget {
  const MedicineDetailsWidget({
    super.key,
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.titer,
    required this.composition,
    required this.indication,
    required this.company,
    required this.allownace,
  });

  final String name;
  final String price;
  final String imageUrl;
  final String titer;
  final String composition;
  final String indication;
  final String company;
  final String allownace;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: containerCardDecoration(),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // const SizedBox(
          //   height: 16,
          // ),
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: GeneralNetworkImage(
              url: imageUrl,
              // url:
              //     "https://th.bing.com/th/id/R.dcd85fd802de08a660ef70274abd6549?rik=jEnBkxetovWJxA&pid=ImgRaw&r=0",
              width: MediaQuery.sizeOf(context).width,
              height: 380.h,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(name, style: Theme.of(context).textTheme.titleMedium),
              Text(price,
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall
                      ?.copyWith(color: AppColors.primary)),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          IconKeyValueWidget(
            keyTitle: "Titer",
            value: titer,
            iconPath: Res.medicineTiter,
          ),
          const SizedBox(
            height: 16,
          ),
          IconKeyValueWidget(
            keyTitle: "Allownace",
            value: allownace,
            iconPath: Res.prescriptionsIcon,
          ),
          const SizedBox(
            height: 16,
          ),
          IconKeyValueWidget(
            keyTitle: "Company",
            value: company,
            iconPath: Res.medicineCompany,
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            "Pharmaceutical composition",
            style: Theme.of(context).textTheme.titleSmall,
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            composition,
            style: Theme.of(context).textTheme.bodySmall,
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            "Pharmaceutical Indication",
            style: Theme.of(context).textTheme.titleSmall,
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            indication,
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ],
      ),
    );
  }
}
