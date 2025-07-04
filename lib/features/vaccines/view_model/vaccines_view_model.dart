import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'vaccines_state.dart';
part 'vaccines_view_model.g.dart';

@riverpod
class VaccinesViewModel extends _$VaccinesViewModel {
  @override
  VaccinesState build() => VaccinesState();

}

