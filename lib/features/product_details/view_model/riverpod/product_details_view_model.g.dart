// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_details_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(ProductDetailsViewModel)
const productDetailsViewModelProvider = ProductDetailsViewModelProvider._();

final class ProductDetailsViewModelProvider
    extends $NotifierProvider<ProductDetailsViewModel, ProductDetailsState> {
  const ProductDetailsViewModelProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'productDetailsViewModelProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$productDetailsViewModelHash();

  @$internal
  @override
  ProductDetailsViewModel create() => ProductDetailsViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ProductDetailsState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ProductDetailsState>(value),
    );
  }
}

String _$productDetailsViewModelHash() =>
    r'be1d2cfa4fa1525125cc56a546db0abec6b2d424';

abstract class _$ProductDetailsViewModel
    extends $Notifier<ProductDetailsState> {
  ProductDetailsState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<ProductDetailsState, ProductDetailsState>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<ProductDetailsState, ProductDetailsState>,
        ProductDetailsState,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
