// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'children_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(ChildrenViewModel)
const childrenViewModelProvider = ChildrenViewModelProvider._();

final class ChildrenViewModelProvider
    extends $NotifierProvider<ChildrenViewModel, ChildrenState> {
  const ChildrenViewModelProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'childrenViewModelProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$childrenViewModelHash();

  @$internal
  @override
  ChildrenViewModel create() => ChildrenViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ChildrenState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ChildrenState>(value),
    );
  }
}

String _$childrenViewModelHash() => r'1a99166b98f2491212fb61dc61e28a5dfe7d9c5e';

abstract class _$ChildrenViewModel extends $Notifier<ChildrenState> {
  ChildrenState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<ChildrenState, ChildrenState>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<ChildrenState, ChildrenState>,
        ChildrenState,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
