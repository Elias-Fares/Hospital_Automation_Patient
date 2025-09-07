// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vaccines_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(VaccinesViewModel)
const vaccinesViewModelProvider = VaccinesViewModelProvider._();

final class VaccinesViewModelProvider
    extends $NotifierProvider<VaccinesViewModel, VaccinesState> {
  const VaccinesViewModelProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'vaccinesViewModelProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$vaccinesViewModelHash();

  @$internal
  @override
  VaccinesViewModel create() => VaccinesViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(VaccinesState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<VaccinesState>(value),
    );
  }
}

String _$vaccinesViewModelHash() => r'ec375fcd3c659236c45f30641ad673be42dcbb2e';

abstract class _$VaccinesViewModel extends $Notifier<VaccinesState> {
  VaccinesState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<VaccinesState, VaccinesState>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<VaccinesState, VaccinesState>,
        VaccinesState,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
