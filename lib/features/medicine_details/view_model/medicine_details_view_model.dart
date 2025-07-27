import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'medicine_details_state.dart';
part 'medicine_details_view_model.g.dart';

@riverpod
class MedicineDetailsViewModel extends _$MedicineDetailsViewModel {
  @override
  MedicineDetailsState build() => MedicineDetailsState();

}

