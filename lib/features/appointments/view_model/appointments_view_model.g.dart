// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appointments_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(AppointmentsViewModel)
const appointmentsViewModelProvider = AppointmentsViewModelProvider._();

final class AppointmentsViewModelProvider
    extends $NotifierProvider<AppointmentsViewModel, AppointmentsState> {
  const AppointmentsViewModelProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'appointmentsViewModelProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$appointmentsViewModelHash();

  @$internal
  @override
  AppointmentsViewModel create() => AppointmentsViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AppointmentsState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AppointmentsState>(value),
    );
  }
}

String _$appointmentsViewModelHash() =>
    r'9f8f6ed14b1a4c41fb016e523da0354e6a8903f6';

abstract class _$AppointmentsViewModel extends $Notifier<AppointmentsState> {
  AppointmentsState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AppointmentsState, AppointmentsState>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<AppointmentsState, AppointmentsState>,
        AppointmentsState,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
