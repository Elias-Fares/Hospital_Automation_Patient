// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appointment_details_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(AppointmentDetailsViewModel)
const appointmentDetailsViewModelProvider =
    AppointmentDetailsViewModelProvider._();

final class AppointmentDetailsViewModelProvider extends $NotifierProvider<
    AppointmentDetailsViewModel, AppointmentDetailsState> {
  const AppointmentDetailsViewModelProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'appointmentDetailsViewModelProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$appointmentDetailsViewModelHash();

  @$internal
  @override
  AppointmentDetailsViewModel create() => AppointmentDetailsViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AppointmentDetailsState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AppointmentDetailsState>(value),
    );
  }
}

String _$appointmentDetailsViewModelHash() =>
    r'a6f8e55b420d5e4cfe4af33b4cbc7c1126a45b6f';

abstract class _$AppointmentDetailsViewModel
    extends $Notifier<AppointmentDetailsState> {
  AppointmentDetailsState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref as $Ref<AppointmentDetailsState, AppointmentDetailsState>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<AppointmentDetailsState, AppointmentDetailsState>,
        AppointmentDetailsState,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
