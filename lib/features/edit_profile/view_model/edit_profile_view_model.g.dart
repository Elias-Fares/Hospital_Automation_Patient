// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_profile_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(EditProfileViewModel)
const editProfileViewModelProvider = EditProfileViewModelProvider._();

final class EditProfileViewModelProvider
    extends $NotifierProvider<EditProfileViewModel, AsyncValue?> {
  const EditProfileViewModelProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'editProfileViewModelProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$editProfileViewModelHash();

  @$internal
  @override
  EditProfileViewModel create() => EditProfileViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AsyncValue? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AsyncValue?>(value),
    );
  }
}

String _$editProfileViewModelHash() =>
    r'b1153f1dfb3fc5b748a9157ec9142a663a5188bf';

abstract class _$EditProfileViewModel extends $Notifier<AsyncValue?> {
  AsyncValue? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue?, AsyncValue?>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<AsyncValue?, AsyncValue?>, AsyncValue?, Object?, Object?>;
    element.handleValue(ref, created);
  }
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
