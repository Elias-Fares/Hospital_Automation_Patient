import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../state/product_details_state.dart';
part 'product_details_view_model.g.dart';

@riverpod
class ProductDetailsViewModel extends _$ProductDetailsViewModel {
  @override
  ProductDetailsState build() => ProductDetailsState();

}

