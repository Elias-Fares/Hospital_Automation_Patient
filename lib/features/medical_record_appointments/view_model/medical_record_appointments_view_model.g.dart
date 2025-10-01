// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medical_record_appointments_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(MedicalRecordAppointmentsViewModel)
const medicalRecordAppointmentsViewModelProvider =
    MedicalRecordAppointmentsViewModelProvider._();

final class MedicalRecordAppointmentsViewModelProvider
    extends $NotifierProvider<MedicalRecordAppointmentsViewModel,
        MedicalRecordAppointmentsState> {
  const MedicalRecordAppointmentsViewModelProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'medicalRecordAppointmentsViewModelProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() =>
      _$medicalRecordAppointmentsViewModelHash();

  @$internal
  @override
  MedicalRecordAppointmentsViewModel create() =>
      MedicalRecordAppointmentsViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(MedicalRecordAppointmentsState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride:
          $SyncValueProvider<MedicalRecordAppointmentsState>(value),
    );
  }
}

String _$medicalRecordAppointmentsViewModelHash() =>
    r'eb19d557e67d8674dcd81f7dc94a8b50f246608b';

abstract class _$MedicalRecordAppointmentsViewModel
    extends $Notifier<MedicalRecordAppointmentsState> {
  MedicalRecordAppointmentsState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref
        as $Ref<MedicalRecordAppointmentsState, MedicalRecordAppointmentsState>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<MedicalRecordAppointmentsState,
            MedicalRecordAppointmentsState>,
        MedicalRecordAppointmentsState,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
