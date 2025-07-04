import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'pharmacies_state.dart';
part 'pharmacies_view_model.g.dart';

@riverpod
class PharmaciesViewModel extends _$PharmaciesViewModel {
  @override
  PharmaciesState build() => PharmaciesState();

}

