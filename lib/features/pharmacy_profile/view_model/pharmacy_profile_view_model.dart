import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'pharmacy_profile_state.dart';
part 'pharmacy_profile_view_model.g.dart';

@riverpod
class PharmacyProfileViewModel extends _$PharmacyProfileViewModel {
  @override
  PharmacyProfileState build() => PharmacyProfileState();

}

