import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../state/doctor_profile_screen_state.dart';
part 'doctor_profile_screen_view_model.g.dart';

@riverpod
class DoctorProfileScreenViewModel extends _$DoctorProfileScreenViewModel {
  @override
  DoctorProfileScreenState build() => DoctorProfileScreenState();

}

