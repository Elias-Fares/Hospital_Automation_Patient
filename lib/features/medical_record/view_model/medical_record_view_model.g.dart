// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medical_record_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(MedicalRecordViewModel)
const medicalRecordViewModelProvider = MedicalRecordViewModelProvider._();

final class MedicalRecordViewModelProvider
    extends $NotifierProvider<MedicalRecordViewModel, MedicalRecordState> {
  const MedicalRecordViewModelProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'medicalRecordViewModelProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$medicalRecordViewModelHash();

  @$internal
  @override
  MedicalRecordViewModel create() => MedicalRecordViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(MedicalRecordState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<MedicalRecordState>(value),
    );
  }
}

String _$medicalRecordViewModelHash() =>
    r'243602b9a919be294816cb44b1212abc7babb74c';

abstract class _$MedicalRecordViewModel extends $Notifier<MedicalRecordState> {
  MedicalRecordState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<MedicalRecordState, MedicalRecordState>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<MedicalRecordState, MedicalRecordState>,
        MedicalRecordState,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
