part of 'vaccines_view_model.dart';

class VaccinesState {
  final AsyncValue<List<VaccineModel>>? vaccinesResponse;

  VaccinesState({this.vaccinesResponse});

  VaccinesState copyWith({AsyncValue<List<VaccineModel>>? vaccinesResponse}) {
    return VaccinesState(
        vaccinesResponse: vaccinesResponse ?? this.vaccinesResponse);
  }
}
