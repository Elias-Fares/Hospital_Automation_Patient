// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'departments_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(DepartmentsViewModel)
const departmentsViewModelProvider = DepartmentsViewModelProvider._();

final class DepartmentsViewModelProvider
    extends $NotifierProvider<DepartmentsViewModel, DepartmentsState> {
  const DepartmentsViewModelProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'departmentsViewModelProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$departmentsViewModelHash();

  @$internal
  @override
  DepartmentsViewModel create() => DepartmentsViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DepartmentsState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DepartmentsState>(value),
    );
  }
}

String _$departmentsViewModelHash() =>
    r'3cb32b5e26138d67ce241c6a3740a9b484626270';

abstract class _$DepartmentsViewModel extends $Notifier<DepartmentsState> {
  DepartmentsState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<DepartmentsState, DepartmentsState>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<DepartmentsState, DepartmentsState>,
        DepartmentsState,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
