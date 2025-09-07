// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_appointment_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(BookAppointmentViewModel)
const bookAppointmentViewModelProvider = BookAppointmentViewModelProvider._();

final class BookAppointmentViewModelProvider
    extends $NotifierProvider<BookAppointmentViewModel, BookAppointmentState> {
  const BookAppointmentViewModelProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'bookAppointmentViewModelProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$bookAppointmentViewModelHash();

  @$internal
  @override
  BookAppointmentViewModel create() => BookAppointmentViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(BookAppointmentState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<BookAppointmentState>(value),
    );
  }
}

String _$bookAppointmentViewModelHash() =>
    r'0aa6199f0868b3ca43b2324482c820f22e544269';

abstract class _$BookAppointmentViewModel
    extends $Notifier<BookAppointmentState> {
  BookAppointmentState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<BookAppointmentState, BookAppointmentState>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<BookAppointmentState, BookAppointmentState>,
        BookAppointmentState,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
