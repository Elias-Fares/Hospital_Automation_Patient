import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:patient_app/core/constant/constant.dart';
import 'package:patient_app/core/style/app_colors.dart';
import 'package:patient_app/core/widgets/appbars/sub_app_bar.dart';
import 'package:patient_app/core/widgets/buttons/custom_inkwell.dart';
import 'package:patient_app/core/widgets/cards/icon_container.dart';
import 'package:patient_app/core/widgets/custom_error_widget.dart';
import 'package:patient_app/core/widgets/custom_loading_widget.dart';
import 'package:patient_app/core/widgets/general_network_image.dart';
import 'package:patient_app/features/medicines_search/view_model/medicines_search_view_model.dart';
part 'widget/search_for_medicine_text_field.dart';
part 'widget/medicine_search_card.dart';

class MedicinesSearchScreen extends ConsumerStatefulWidget {
  const MedicinesSearchScreen({super.key});
  static const routeName = "/medicines_search_screen";

  @override
  ConsumerState<MedicinesSearchScreen> createState() =>
      _MedicinesSearchScreenState();
}

class _MedicinesSearchScreenState extends ConsumerState<MedicinesSearchScreen> {
  final TextEditingController searchTextEditingController =
      TextEditingController();

  @override
  void dispose() {
    searchTextEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final medicinesSearchState = ref.watch(medicinesSearchViewModelProvider);
    return Scaffold(
      appBar: SubAppBar(
        titleWidget: Text(
          "Search For Medicines",
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            SearchForMedicineTextField(
              searchTextEditingController: searchTextEditingController,
              onEditingComplete: () {
                ref
                    .read(medicinesSearchViewModelProvider.notifier)
                    .searchForMedicine(
                        searchWord: searchTextEditingController.text);
              },
            ),
            const SizedBox(
              height: 20,
            ),
            medicinesSearchState.medicineSearchResponse?.when(
                  data: (data) {
                    if (data.isEmpty) {
                      return Expanded(
                          child: CustomErrorWidget(
                        message:
                            "There is no search result for ${searchTextEditingController.text}",
                        onTryAgainTap: () {
                          ref
                              .read(medicinesSearchViewModelProvider.notifier)
                              .searchForMedicine(
                                  searchWord: searchTextEditingController.text);
                        },
                      ));
                    } else {
                      return Expanded(
                        child: GridView.builder(
                          itemCount: data.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisExtent: 250.h,
                                  mainAxisSpacing: 15,
                                  crossAxisSpacing: 15),
                          itemBuilder: (context, index) {
                            final med = data.elementAtOrNull(index);
                            return MedicineSearchCard(
                              medicineName: med?.name ?? "",
                              medicineTiter:
                                  med?.pharmaceuticalTiter?.toString() ?? "",
                              pharmacyCount: "1",
                              price: med?.price?.toString() ?? "",
                              imageUrl:
                                  "${Constant.baseUrl}/${med?.medImageUrl}",
                            );
                          },
                        ),
                      );
                    }
                  },
                  error: (error, stackTrace) => Expanded(
                    child: CustomErrorWidget(
                      message: error.toString(),
                      onTryAgainTap: () {
                        ref
                            .read(medicinesSearchViewModelProvider.notifier)
                            .searchForMedicine(
                                searchWord: searchTextEditingController.text);
                      },
                    ),
                  ),
                  loading: () => const Expanded(child: CustomLoadingWidget()),
                ) ??
                const SizedBox.shrink()
          ],
        ),
      ),
    );
  }
}
