// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medical_record_prescriptions_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(MedicalRecordPrescriptionsViewModel)
const medicalRecordPrescriptionsViewModelProvider =
    MedicalRecordPrescriptionsViewModelProvider._();

final class MedicalRecordPrescriptionsViewModelProvider
    extends $NotifierProvider<MedicalRecordPrescriptionsViewModel,
        MedicalRecordPrescriptionsState> {
  const MedicalRecordPrescriptionsViewModelProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'medicalRecordPrescriptionsViewModelProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() =>
      _$medicalRecordPrescriptionsViewModelHash();

  @$internal
  @override
  MedicalRecordPrescriptionsViewModel create() =>
      MedicalRecordPrescriptionsViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(MedicalRecordPrescriptionsState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride:
          $SyncValueProvider<MedicalRecordPrescriptionsState>(value),
    );
  }
}

String _$medicalRecordPrescriptionsViewModelHash() =>
    r'6bd956317b32252a583969e4d1894438ef0d845b';

abstract class _$MedicalRecordPrescriptionsViewModel
    extends $Notifier<MedicalRecordPrescriptionsState> {
  MedicalRecordPrescriptionsState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<MedicalRecordPrescriptionsState,
        MedicalRecordPrescriptionsState>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<MedicalRecordPrescriptionsState,
            MedicalRecordPrescriptionsState>,
        MedicalRecordPrescriptionsState,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
