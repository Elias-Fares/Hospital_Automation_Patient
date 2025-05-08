import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../state/doctor_profile_state.dart';
part 'doctor_profile_view_model.g.dart';

@riverpod
class DoctorProfileViewModel extends _$DoctorProfileViewModel {
  @override
  DoctorProfileState build() => DoctorProfileState();

}

