// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'department_details_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(DepartmentDetailsViewModel)
const departmentDetailsViewModelProvider =
    DepartmentDetailsViewModelProvider._();

final class DepartmentDetailsViewModelProvider extends $NotifierProvider<
    DepartmentDetailsViewModel, DepartmentDetailsState> {
  const DepartmentDetailsViewModelProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'departmentDetailsViewModelProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$departmentDetailsViewModelHash();

  @$internal
  @override
  DepartmentDetailsViewModel create() => DepartmentDetailsViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DepartmentDetailsState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DepartmentDetailsState>(value),
    );
  }
}

String _$departmentDetailsViewModelHash() =>
    r'67984bbb12d27edaf6bede8d090146565ae9e6cb';

abstract class _$DepartmentDetailsViewModel
    extends $Notifier<DepartmentDetailsState> {
  DepartmentDetailsState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref as $Ref<DepartmentDetailsState, DepartmentDetailsState>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<DepartmentDetailsState, DepartmentDetailsState>,
        DepartmentDetailsState,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
