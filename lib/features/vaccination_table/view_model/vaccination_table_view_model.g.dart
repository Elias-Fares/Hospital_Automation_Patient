// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vaccination_table_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(VaccinationTableViewModel)
const vaccinationTableViewModelProvider = VaccinationTableViewModelProvider._();

final class VaccinationTableViewModelProvider extends $NotifierProvider<
    VaccinationTableViewModel, VaccinationTableState> {
  const VaccinationTableViewModelProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'vaccinationTableViewModelProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$vaccinationTableViewModelHash();

  @$internal
  @override
  VaccinationTableViewModel create() => VaccinationTableViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(VaccinationTableState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<VaccinationTableState>(value),
    );
  }
}

String _$vaccinationTableViewModelHash() =>
    r'37a8e0979e388a022718ed3b1f82640515d6ba6f';

abstract class _$VaccinationTableViewModel
    extends $Notifier<VaccinationTableState> {
  VaccinationTableState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<VaccinationTableState, VaccinationTableState>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<VaccinationTableState, VaccinationTableState>,
        VaccinationTableState,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
