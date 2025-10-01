// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'child_medicine_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(ChildMedicineViewModel)
const childMedicineViewModelProvider = ChildMedicineViewModelProvider._();

final class ChildMedicineViewModelProvider
    extends $NotifierProvider<ChildMedicineViewModel, ChildMedicineState> {
  const ChildMedicineViewModelProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'childMedicineViewModelProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$childMedicineViewModelHash();

  @$internal
  @override
  ChildMedicineViewModel create() => ChildMedicineViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ChildMedicineState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ChildMedicineState>(value),
    );
  }
}

String _$childMedicineViewModelHash() =>
    r'6063882105dd1ad46acc5e6a0cbc62de9dc94a76';

abstract class _$ChildMedicineViewModel extends $Notifier<ChildMedicineState> {
  ChildMedicineState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<ChildMedicineState, ChildMedicineState>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<ChildMedicineState, ChildMedicineState>,
        ChildMedicineState,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
