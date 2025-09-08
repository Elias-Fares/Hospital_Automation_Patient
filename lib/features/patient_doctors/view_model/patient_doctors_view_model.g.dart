// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patient_doctors_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(PatientDoctorsViewModel)
const patientDoctorsViewModelProvider = PatientDoctorsViewModelProvider._();

final class PatientDoctorsViewModelProvider
    extends $NotifierProvider<PatientDoctorsViewModel, PatientDoctorsState> {
  const PatientDoctorsViewModelProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'patientDoctorsViewModelProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$patientDoctorsViewModelHash();

  @$internal
  @override
  PatientDoctorsViewModel create() => PatientDoctorsViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PatientDoctorsState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PatientDoctorsState>(value),
    );
  }
}

String _$patientDoctorsViewModelHash() =>
    r'e39d00798a687fe495f283aa79a9f5bea58ebd88';

abstract class _$PatientDoctorsViewModel
    extends $Notifier<PatientDoctorsState> {
  PatientDoctorsState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<PatientDoctorsState, PatientDoctorsState>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<PatientDoctorsState, PatientDoctorsState>,
        PatientDoctorsState,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
