// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patient_prescription_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(PatientPrescriptionViewModel)
const patientPrescriptionViewModelProvider =
    PatientPrescriptionViewModelProvider._();

final class PatientPrescriptionViewModelProvider extends $NotifierProvider<
    PatientPrescriptionViewModel, PatientPrescriptionState> {
  const PatientPrescriptionViewModelProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'patientPrescriptionViewModelProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$patientPrescriptionViewModelHash();

  @$internal
  @override
  PatientPrescriptionViewModel create() => PatientPrescriptionViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PatientPrescriptionState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PatientPrescriptionState>(value),
    );
  }
}

String _$patientPrescriptionViewModelHash() =>
    r'98781d0d8a6114b83468aef3638ca52b26973513';

abstract class _$PatientPrescriptionViewModel
    extends $Notifier<PatientPrescriptionState> {
  PatientPrescriptionState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref as $Ref<PatientPrescriptionState, PatientPrescriptionState>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<PatientPrescriptionState, PatientPrescriptionState>,
        PatientPrescriptionState,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
