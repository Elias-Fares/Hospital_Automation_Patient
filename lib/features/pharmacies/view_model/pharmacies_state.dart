part of 'pharmacies_view_model.dart';

class PharmaciesState {
  final AsyncValue<List<PharmacyModel>>? pharmaciesResponse;

  PharmaciesState({this.pharmaciesResponse});

  PharmaciesState copyWith(
          {AsyncValue<List<PharmacyModel>>? pharmaciesResponse}) =>
      PharmaciesState(
          pharmaciesResponse: pharmaciesResponse ?? this.pharmaciesResponse);
}
