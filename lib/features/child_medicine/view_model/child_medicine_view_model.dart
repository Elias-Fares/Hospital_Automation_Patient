import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'child_medicine_state.dart';
part 'child_medicine_view_model.g.dart';

@riverpod
class ChildMedicineViewModel extends _$ChildMedicineViewModel {
  @override
  ChildMedicineState build() => ChildMedicineState();

}

