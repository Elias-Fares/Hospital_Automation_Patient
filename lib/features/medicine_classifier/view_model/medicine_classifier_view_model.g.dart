// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medicine_classifier_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(MedicineClassifierViewModel)
const medicineClassifierViewModelProvider =
    MedicineClassifierViewModelProvider._();

final class MedicineClassifierViewModelProvider extends $NotifierProvider<
    MedicineClassifierViewModel, MedicineClassifierState> {
  const MedicineClassifierViewModelProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'medicineClassifierViewModelProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$medicineClassifierViewModelHash();

  @$internal
  @override
  MedicineClassifierViewModel create() => MedicineClassifierViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(MedicineClassifierState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<MedicineClassifierState>(value),
    );
  }
}

String _$medicineClassifierViewModelHash() =>
    r'0f35b8bdf4adc9934f8b901170266f91c222ba41';

abstract class _$MedicineClassifierViewModel
    extends $Notifier<MedicineClassifierState> {
  MedicineClassifierState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref as $Ref<MedicineClassifierState, MedicineClassifierState>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<MedicineClassifierState, MedicineClassifierState>,
        MedicineClassifierState,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
