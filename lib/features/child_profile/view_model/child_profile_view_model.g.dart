// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'child_profile_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(ChildProfileViewModel)
const childProfileViewModelProvider = ChildProfileViewModelProvider._();

final class ChildProfileViewModelProvider extends $NotifierProvider<
    ChildProfileViewModel, AsyncValue<ChildProfileModel>?> {
  const ChildProfileViewModelProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'childProfileViewModelProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$childProfileViewModelHash();

  @$internal
  @override
  ChildProfileViewModel create() => ChildProfileViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AsyncValue<ChildProfileModel>? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride:
          $SyncValueProvider<AsyncValue<ChildProfileModel>?>(value),
    );
  }
}

String _$childProfileViewModelHash() =>
    r'115f2e81cb49be6f6736858b29a8536b0eda0ae7';

abstract class _$ChildProfileViewModel
    extends $Notifier<AsyncValue<ChildProfileModel>?> {
  AsyncValue<ChildProfileModel>? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref
        as $Ref<AsyncValue<ChildProfileModel>?, AsyncValue<ChildProfileModel>?>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<AsyncValue<ChildProfileModel>?,
            AsyncValue<ChildProfileModel>?>,
        AsyncValue<ChildProfileModel>?,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
