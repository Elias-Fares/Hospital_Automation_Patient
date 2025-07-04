import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'vaccine_details_state.dart';
part 'vaccine_details_view_model.g.dart';

@riverpod
class VaccineDetailsViewModel extends _$VaccineDetailsViewModel {
  @override
  VaccineDetailsState build() => VaccineDetailsState();

}

