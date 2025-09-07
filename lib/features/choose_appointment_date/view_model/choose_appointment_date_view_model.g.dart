// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'choose_appointment_date_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(ChooseAppointmentDateViewModel)
const chooseAppointmentDateViewModelProvider =
    ChooseAppointmentDateViewModelProvider._();

final class ChooseAppointmentDateViewModelProvider extends $NotifierProvider<
    ChooseAppointmentDateViewModel, ChooseAppointmentDateState> {
  const ChooseAppointmentDateViewModelProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'chooseAppointmentDateViewModelProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$chooseAppointmentDateViewModelHash();

  @$internal
  @override
  ChooseAppointmentDateViewModel create() => ChooseAppointmentDateViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ChooseAppointmentDateState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ChooseAppointmentDateState>(value),
    );
  }
}

String _$chooseAppointmentDateViewModelHash() =>
    r'c219654070efffc858e2d0ed56ea7303a5dba5e6';

abstract class _$ChooseAppointmentDateViewModel
    extends $Notifier<ChooseAppointmentDateState> {
  ChooseAppointmentDateState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref
        as $Ref<ChooseAppointmentDateState, ChooseAppointmentDateState>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<ChooseAppointmentDateState, ChooseAppointmentDateState>,
        ChooseAppointmentDateState,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
