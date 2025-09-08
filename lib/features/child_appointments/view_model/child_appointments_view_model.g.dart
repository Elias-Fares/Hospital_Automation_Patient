// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'child_appointments_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(ChildAppointmentsViewModel)
const childAppointmentsViewModelProvider =
    ChildAppointmentsViewModelProvider._();

final class ChildAppointmentsViewModelProvider extends $NotifierProvider<
    ChildAppointmentsViewModel, AsyncValue<List<AppointmentModel>>?> {
  const ChildAppointmentsViewModelProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'childAppointmentsViewModelProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$childAppointmentsViewModelHash();

  @$internal
  @override
  ChildAppointmentsViewModel create() => ChildAppointmentsViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AsyncValue<List<AppointmentModel>>? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride:
          $SyncValueProvider<AsyncValue<List<AppointmentModel>>?>(value),
    );
  }
}

String _$childAppointmentsViewModelHash() =>
    r'73173da41c10c0a35a2e6f2e7c300b3f1b5f6f1a';

abstract class _$ChildAppointmentsViewModel
    extends $Notifier<AsyncValue<List<AppointmentModel>>?> {
  AsyncValue<List<AppointmentModel>>? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<List<AppointmentModel>>?,
        AsyncValue<List<AppointmentModel>>?>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<AsyncValue<List<AppointmentModel>>?,
            AsyncValue<List<AppointmentModel>>?>,
        AsyncValue<List<AppointmentModel>>?,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
