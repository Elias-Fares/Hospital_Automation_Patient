import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'appointment_details_state.dart';
part 'appointment_details_view_model.g.dart';

@riverpod
class AppointmentDetailsViewModel extends _$AppointmentDetailsViewModel {
  @override
  AppointmentDetailsState build() => AppointmentDetailsState();

}

