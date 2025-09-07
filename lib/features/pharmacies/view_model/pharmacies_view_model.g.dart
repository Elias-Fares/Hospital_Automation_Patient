// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pharmacies_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(PharmaciesViewModel)
const pharmaciesViewModelProvider = PharmaciesViewModelProvider._();

final class PharmaciesViewModelProvider
    extends $NotifierProvider<PharmaciesViewModel, PharmaciesState> {
  const PharmaciesViewModelProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'pharmaciesViewModelProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$pharmaciesViewModelHash();

  @$internal
  @override
  PharmaciesViewModel create() => PharmaciesViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PharmaciesState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PharmaciesState>(value),
    );
  }
}

String _$pharmaciesViewModelHash() =>
    r'ccfd2cfb093bb1fe63d9e2ad45892a3205b3a5e1';

abstract class _$PharmaciesViewModel extends $Notifier<PharmaciesState> {
  PharmaciesState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<PharmaciesState, PharmaciesState>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<PharmaciesState, PharmaciesState>,
        PharmaciesState,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
