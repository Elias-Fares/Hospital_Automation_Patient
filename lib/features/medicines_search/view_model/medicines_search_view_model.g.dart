// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medicines_search_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(MedicinesSearchViewModel)
const medicinesSearchViewModelProvider = MedicinesSearchViewModelProvider._();

final class MedicinesSearchViewModelProvider
    extends $NotifierProvider<MedicinesSearchViewModel, MedicinesSearchState> {
  const MedicinesSearchViewModelProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'medicinesSearchViewModelProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$medicinesSearchViewModelHash();

  @$internal
  @override
  MedicinesSearchViewModel create() => MedicinesSearchViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(MedicinesSearchState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<MedicinesSearchState>(value),
    );
  }
}

String _$medicinesSearchViewModelHash() =>
    r'64b45f7184b4ef60633c318863b059ffc0c400c1';

abstract class _$MedicinesSearchViewModel
    extends $Notifier<MedicinesSearchState> {
  MedicinesSearchState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<MedicinesSearchState, MedicinesSearchState>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<MedicinesSearchState, MedicinesSearchState>,
        MedicinesSearchState,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
