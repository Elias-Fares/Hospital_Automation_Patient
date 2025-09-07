// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vaccine_details_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(VaccineDetailsViewModel)
const vaccineDetailsViewModelProvider = VaccineDetailsViewModelProvider._();

final class VaccineDetailsViewModelProvider
    extends $NotifierProvider<VaccineDetailsViewModel, VaccineDetailsState> {
  const VaccineDetailsViewModelProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'vaccineDetailsViewModelProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$vaccineDetailsViewModelHash();

  @$internal
  @override
  VaccineDetailsViewModel create() => VaccineDetailsViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(VaccineDetailsState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<VaccineDetailsState>(value),
    );
  }
}

String _$vaccineDetailsViewModelHash() =>
    r'5dbc48cce4451a7526cd357386f843bb7166c576';

abstract class _$VaccineDetailsViewModel
    extends $Notifier<VaccineDetailsState> {
  VaccineDetailsState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<VaccineDetailsState, VaccineDetailsState>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<VaccineDetailsState, VaccineDetailsState>,
        VaccineDetailsState,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
