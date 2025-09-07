// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prescription_details_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(PrescriptionDetailsViewModel)
const prescriptionDetailsViewModelProvider =
    PrescriptionDetailsViewModelProvider._();

final class PrescriptionDetailsViewModelProvider extends $NotifierProvider<
    PrescriptionDetailsViewModel, PrescriptionDetailsState> {
  const PrescriptionDetailsViewModelProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'prescriptionDetailsViewModelProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$prescriptionDetailsViewModelHash();

  @$internal
  @override
  PrescriptionDetailsViewModel create() => PrescriptionDetailsViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PrescriptionDetailsState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PrescriptionDetailsState>(value),
    );
  }
}

String _$prescriptionDetailsViewModelHash() =>
    r'ce83ad0b2604bd60d9e236284f4b3e02579b5128';

abstract class _$PrescriptionDetailsViewModel
    extends $Notifier<PrescriptionDetailsState> {
  PrescriptionDetailsState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref as $Ref<PrescriptionDetailsState, PrescriptionDetailsState>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<PrescriptionDetailsState, PrescriptionDetailsState>,
        PrescriptionDetailsState,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
